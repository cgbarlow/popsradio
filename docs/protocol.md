# Walkie-Talkie Protocol v0.1

Nov 20, 2026 · Draft for agreement

## Summary

**This is the wire protocol between every client and the channel service for the hack day and the first builds.** Any client that follows it can talk to any other: the R1 app, the ESP32 radio, and a browser test client. It has to be agreed before anyone builds a client, because two clients built to different guesses will not hear each other.

- **One WebSocket per client per channel,** over TLS on port 443, to the channel service on Cloudflare (one Durable Object per channel), as the [service design](Walkie-Talkie%20Service%20Design.md) locks.
- **JSON text messages for control, binary messages for audio.** Six control messages carry the turn-taking: `floor`, `granted`, `denied`, `talking`, `end`, plus `joined` and `member` for presence.
- **An 8-byte header on every audio frame,** readable by the service, followed by the audio.
- **The service enforces the floor:** one talker at a time, and it drops audio from anyone else. It passes audio on byte for byte and never changes it.
- **Hack day shortcuts:** raw 16 kHz audio instead of Opus, TLS only with no end-to-end sealing, and a shared test token instead of key-pair sign-in. Each is listed in [Temporary for the hack day](#temporary-for-the-hack-day) with what replaces it.

A few choices differ from the list in the [Hack Day Action Plan](Hack%20Day%20Action%20Plan.md) (task 4). They are collected in [For discussion](#for-discussion) so they can be changed before anything is built.

## Connecting

A client opens one WebSocket:

```
wss://<service host>/channel/<channel>/ws?token=<token>&name=<name>
```

| Part | Rule |
|---|---|
| `channel` | 1 to 32 characters from `a-z`, `0-9` and `-` |
| `name` | The name others see and hear, 1 to 32 characters, URL-encoded |
| `token` | The shared test token. Sent in the query because browsers cannot set headers on a WebSocket |

The service answers before the upgrade with HTTP **401** for a wrong token, **400** for a bad channel or name, and **409** when the channel already has ten members. A browser cannot see these codes, only that the connection failed.

**One connection is one channel.** To change channel (the R1 wheel, the radio's knob), close the connection and open a new one. A channel holds up to ten radios, phones and browsers.

**Keeping the connection alive.** Clients send the text message `{"t":"ping"}` every 30 seconds. The service answers `{"t":"pong"}` without waking the channel object, so idle radios cost nothing. If no `pong` arrives within 10 seconds, the client treats the link as down and reconnects. This keeps mobile network address mappings open, which expire after a median of 65 seconds (see the [R1 doc](Rabbit%20R1%20Walkie-Talkie%20Research%20and%20Design.md)).

**Reconnecting.** After any drop, wait 1 second and double each time up to 30 seconds, adding up to 1 second of random delay each time, so a service restart does not bring every radio back at the same instant.

## Control messages

Every control message is a JSON object in a text frame, with its type in `t`. Clients and the service ignore fields they do not know and messages with a `t` they do not know, so later versions can add to them.

### From the service

| Message | Sent to | When |
|---|---|---|
| `{"t":"joined","v":1,"you":3,"members":[{"id":1,"name":"Pop"},{"id":3,"name":"Chris"}],"talking":null}` | The new client | Straight after connecting. `you` is this client's sender id. `members` includes the client itself. `talking` is the id of whoever holds the floor, or `null` |
| `{"t":"member","id":3,"name":"Chris","present":true}` | Everyone else | Someone joins (`true`) or leaves (`false`) |
| `{"t":"granted"}` | The requester | The floor is now theirs |
| `{"t":"denied","who":1}` | The requester | Someone else holds the floor; `who` is their id |
| `{"t":"talking","who":1}` | Everyone except the talker | A turn has started |
| `{"t":"end","who":1,"reason":"end"}` | Everyone, including the talker | A turn has ended. `reason` is one of `end`, `silence`, `limit`, `left` |
| `{"t":"pong"}` | The client that pinged | Reply to `ping` |

### From a client

| Message | When |
|---|---|
| `{"t":"floor"}` | The talk button went down |
| `{"t":"end"}` | The talk button came up, after the last audio frame has been sent |
| `{"t":"ping"}` | Every 30 seconds |

There is no client "join" message: the channel and name in the URL do that job, and `joined` is the answer.

## Audio frames

Each audio frame is one binary WebSocket message: an 8-byte header, then the audio. All header fields are big-endian.

| Offset | Size | Field | Meaning |
|---|---|---|---|
| 0 | 1 | `version` | 1 for this spec |
| 1 | 1 | `codec` | 0 = raw PCM (below). 1 = Opus, reserved for v0.2 |
| 2 | 2 | `sender` | The sender's id from `joined` |
| 4 | 2 | `spurt` | The sender's turn number. Add one each time the client sends `floor`. Wraps from 65535 to 0 |
| 6 | 2 | `seq` | Frame number within the turn, from 0, one per frame |

**Codec 0** is mono, 16,000 samples a second, signed 16-bit little-endian, 20 ms per frame. That is 320 samples, a 640-byte payload and a 648-byte message, 50 a second: about 260 kbit/s each way while talking, which home Wi-Fi handles easily.

A frame is never larger than 1,500 bytes.

**What the service does with a frame.** It drops it, without telling anyone, if the header is short or the wrong version, if the frame is over 1,500 bytes, if `sender` is not the connection's own id, or if the sender does not hold the floor. Otherwise it forwards the exact bytes to every other member, in the order received. The talker never gets their own audio back.

**Receivers** know a new turn has started when `sender` or `spurt` changes. Gaps in `seq` mean lost or dropped frames; play silence for them.

## Turn-taking

These are the floor rules from the [R1 doc](Rabbit%20R1%20Walkie-Talkie%20Research%20and%20Design.md#pairing-and-channels), made exact.

- **One talker per channel.** `floor` when the floor is free gives `granted`. When someone else holds it, `denied` with their id. When the requester already holds it, `granted` again.
- **A turn ends** when the talker sends `end`, when **1.5 seconds** pass with no audio from the talker (counted from the grant or the last frame), after **60 seconds** in total from the grant, or when the talker's connection closes. The `reason` says which.
- **The floor is free as soon as a turn ends.** There is no queue and no priority. Caregiver pre-emption is not in v0.1.
- **Order is guaranteed.** The service sends `granted` before it accepts any of that turn's frames, forwards frames in order, and sends `end` after the last frame it forwarded for the turn. Frames arriving after the end are dropped.

**Pre-roll.** A client starts capturing the moment the button goes down, before `granted` arrives, so the first word is never clipped. It keeps up to 1 second (50 frames) and, once granted, sends them in order from `seq` 0 and carries on live. If denied, it throws them away. If the button comes up before `granted` arrives, it still sends what it captured, then `end`.

**The 1.5-second silence rule counts frames, not speech.** A client sends frames for as long as the button is held, quiet or not, so a thinking pause does not end the turn. The rule only catches a client that has stopped sending.

## What clients show and play

Not part of the wire format, but every client should behave the same so a family hears one kind of radio. From the [R1 doc's sounds and screen states](Rabbit%20R1%20Walkie-Talkie%20Research%20and%20Design.md):

| Moment | Sound | Screen |
|---|---|---|
| `granted` | Squelch chirp | Red, TALKING |
| Button down with no connection | Low double buzz | Amber, NOT CONNECTED |
| `denied` | Busy tone | Amber, WAIT |
| First frame of someone's turn | Short kerchunk, then speech | Green, LISTENING and their name |
| `end` of someone else's turn | Roger beep and squelch tail | Grey, READY |

The talker does not play the roger beep for their own turn. When the button comes up before `granted`, skip the chirp.

**Playback** starts 80 ms after the first frame of a turn arrives, to absorb uneven delivery. This is a starting value for Wi-Fi; the hack day measurements will say whether mobile data needs more.

## Example turn

Pop (id 1) and Chris (id 2) are in channel `family`. Pop holds the button for one second.

| # | Direction | Message |
|---|---|---|
| 1 | Pop → service | `{"t":"floor"}` |
| 2 | service → Pop | `{"t":"granted"}` |
| 3 | service → Chris | `{"t":"talking","who":1}` |
| 4 | Pop → service → Chris | 50 binary frames, `spurt` 0, `seq` 0 to 49 |
| 5 | Pop → service | `{"t":"end"}` |
| 6 | service → both | `{"t":"end","who":1,"reason":"end"}` |

If Chris presses while Pop is talking, he gets `{"t":"denied","who":1}`.

## Test vectors

Every client's tests check these exact bytes, so separately built clients cannot drift apart.

| Header | Bytes (hex) |
|---|---|
| codec 0, sender 1, spurt 0, seq 0 | `01 00 00 01 00 00 00 00` |
| codec 0, sender 3, spurt 65535, seq 49 | `01 00 00 03 ff ff 00 31` |

A full codec 0 frame is those 8 bytes followed by 640 bytes of audio, 648 bytes in all. A decoder must reject 7 bytes, 1,501 bytes, and any frame whose first byte is not `01`.

## Temporary for the hack day

| Shortcut | Replaced in v0.2 by |
|---|---|
| Raw 16 kHz PCM (codec 0) | Opus, codec 1: 20 ms frames, 16 to 24 kbit/s, in-band FEC, as the R1 doc sets out |
| TLS only; the service can hear audio | End-to-end sealing with XChaCha20-Poly1305 and the channel key. The header stays readable and becomes the associated data, with the channel bound in |
| Shared test token in the URL | Each radio and app signs a challenge with its own key pair |
| The service hands out sender ids from 1 and reuses them after someone leaves | Ids fixed to each device's key, because the sealing nonce includes the sender |
| No missed-message replay | The service keeps the last turn for 24 hours |

Open (hands-free) mode needs its own floor rule and is not in v0.1.

## Changing this spec

Any change to the wire format bumps the `version` byte and the `v` in `joined`, and is agreed here in the repo before any client ships it. The service accepts every version that has shipped, as the service design promises, so a radio that missed an update keeps talking.

## For discussion

These differ from the list in the hack day plan. Each can still change.

1. **No channel field in the header.** One connection carries one channel, so the service already knows the channel without it. When sealing arrives, the channel is bound into the associated data, which gives the same protection without spending header bytes on every frame.
2. **Joining is in the URL, not a message.** The service has to know the channel before it can hand the connection to the right channel object, so the channel must be in the URL anyway. Putting the name there too means the connection is usable as soon as it opens, one round trip sooner.
3. **A `spurt` field.** Added so receivers can tell turns apart, and because the R1 doc's sealing nonce is (sender, spurt, frame).
4. **The service assigns sender ids,** until key pairs exist.
5. **Additions to the six messages in the hack day plan:** `joined`, `member`, the `reason` on `end`, and `ping`/`pong`.
