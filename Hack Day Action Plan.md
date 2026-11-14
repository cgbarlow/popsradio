# Hack Day Action Plan

Nov 14, 2026 · @Chris Barlow

## Summary

**The goal for Friday 4 December: two ESP32 breadboard radios talking push-to-talk to each other through the real channel service, with the first real measurements written down.** That is one day's work only if everything except the firmware is done beforehand. So the next three weeks bring forward every prerequisite: parts on the bench, the protocol written down, the service and a laptop test client running, toolchains installed, and a network we control.

- **Order the parts this weekend.** They are import-only and the slowest thing on the list.
- **Write the protocol spec first.** It is the keystone the [council review](.campaign/council-report.md) found missing, and on the day it lets two people build to the same document.
- **Have the service and laptop client working before the day.** Then the radios have something real to talk to from the first hour.
- **Split the day by strength.** Your teammate owns the ESP32 audio and firmware; you own the service, the protocol and integration. Merge at fixed points.
- **Bring your own network.** A 2.4 GHz phone hotspot or travel router, because venue Wi-Fi with a sign-in page will not work (see the service design's minimum requirements).

The R1 lock-down is paused until after the day. If the breadboard radio is loud and reliable, the R1 may not need it at all, as the R1 doc already suggests.

This is a plan, not sourced research. Effort figures are my estimates.

## What the day must prove

| Tier | Outcome | Proves |
|---|---|---|
| Must | One breadboard radio: hold the button, speak, hear it back through the amp after Opus encode and decode. Loudness checked | The audio chain and whether 3 W is loud enough |
| Must | That radio sends sealed frames to the channel service and the laptop test client plays them, and the other way round | The protocol and the service work end to end |
| Should | Two radios on one channel: one talks, the other hears. Busy tone when both press. Chirp and roger beep | It is a walkie-talkie |
| Should | First measurements recorded: mouth-to-ear delay, Opus CPU load, loudness at 1 m and 3 m, behaviour on a weak hotspot | Replaces estimates with data, the council's main ask |
| Could | Knob changes channel with a spoken name; speech shaping on and off for an A/B listen | Grandad-specific features |
| Could | OPEN mode with voice activity on the bench | The riskiest design proposal, tried early |

If the day ends at "Must", it is still a success: the two biggest unknowns, loudness and delay over WebSocket, will have real answers.

## Prerequisites, by week

Ordered so the slow and blocking items go first. Owners: **Chris**, or **teammate** (the group member with ESP32 experience).

### Week 1: 14 to 22 November

| # | Task | Owner | Why now | Effort |
|---|---|---|---|---|
| 1 | **Order parts for three breadboard radios** (shopping list below). If AliExpress cannot promise delivery by 1 December, buy the core three parts from Core Electronics AU instead | Chris | Import shipping is the longest lead time on the list | 1 hour |
| 2 | **Brief your teammate.** Share the repo and this plan. Ask what they already own (boards, mics, amps, soldering iron, multimeter, logic analyser), which toolchain they use, and whether they can do the pre-work in week 3 | Chris | Their kit may cover a late order; their toolchain choice shapes item 6 | 30 minutes |
| 3 | **Pick the cipher.** Recommended: XChaCha20-Poly1305 as the service design says, with random 24-byte nonces, so no shared counter state is needed. Update the R1 and Stage 2 docs to match | Chris | Two people cannot build to an ambiguous wire format | 30 minutes |
| 4 | **Write protocol spec v0.1** in `docs/protocol.md`: WebSocket messages (join, leave, floor request, granted, denied, talking, end), the binary voice frame and routing header, the cipher and nonce layout, version field, timeouts (1.5 s silence, 60 s turn). Add two or three test vectors: a known key, header and frame with the sealed bytes expected | Chris | The keystone for everything else. The test vectors let firmware and service check each other without the C core | 1 to 2 evenings |
| 5 | **Cloudflare account.** Create it, install Wrangler, and confirm which plan Durable Objects with WebSockets need | Chris | Needed for week 2 | 30 minutes |
| 6 | **Decide the firmware base with your teammate:** fork xiaozhi-esp32 (already speaks Opus over WebSocket, but large and built around an AI assistant), or a small ESP-IDF app using the WebSocket client, the I2S driver and an Opus component. Recommended: let the teammate choose after an hour reading xiaozhi's WebSocket protocol, and stay on ESP-IDF either way, because the C core is planned as an ESP-IDF component | Teammate | The one decision that most changes how the day goes | 1 to 2 hours |

### Week 2: 23 to 29 November

| # | Task | Owner | Why now | Effort |
|---|---|---|---|---|
| 7 | **Channel service v0.** A Worker plus one Durable Object per channel: WebSocket join, fan-out of binary frames unchanged, floor control, "who is talking". Sign-in can be a shared test token for now; key-pair sign-in comes after the day. Deploy it to a test account | Chris | The radios need something real to talk to | 2 to 3 evenings |
| 8 | **Laptop test client v0.** A command-line program that joins a channel, sends a WAV file as sealed Opus frames per the spec, and plays what arrives. Add an echo mode that plays each spurt back to the sender | Chris | The radio's first partner on the day, and the way to test the service alone | 1 to 2 evenings |
| 9 | **Smoke-test every part as it arrives.** Flash a blink sketch on each S3 board, read the INMP441 into a level meter, play a tone through each MAX98357A. Return or replace duds now | Teammate, or Chris | A dead board on the day costs an hour | 1 evening |
| 10 | **Docs drift sweep** from the council report: the R1 summary latency, QR references and "reset group" risk row; the Stage 2 relay address, admin page and Go/SQLite lines; the C core module lists, including speech shaping in the service design; one EQ band | Chris | Your teammate will read these docs; they should not have to guess which parts are current | 1 evening |

### Week 3: 30 November to 3 December

| # | Task | Owner | Why now | Effort |
|---|---|---|---|---|
| 11 | **Pre-wire two breadboards** to one pin map, written in the repo: mic, amp, button, encoder, OLED, toggle. Flash xiaozhi-esp32 unmodified, or the teammate's minimal app, to prove the audio chain | Teammate, ideally with Chris | The day is then firmware, not wiring. This is the Stage 2 "breadboard night" | 1 evening |
| 12 | **Firmware skeleton** in a branch: builds, joins Wi-Fi, opens the WebSocket to the service, sends a join message. Audio can wait for the day | Teammate | Removes the slowest first hour on the day | 1 to 2 evenings |
| 13 | **Dry run without radios.** Two laptop clients talk through the deployed service over the phone hotspot. Fix anything that breaks | Chris | Proves the network, the service and the spec before the day | 1 hour |
| 14 | **Pack and prepare.** Toolchains installed and pinned on both laptops (same ESP-IDF version). Hotspot tested at 2.4 GHz. A few recorded voice clips for repeatable tests. Task cards from the day plan below. A measurements sheet (`docs/measurements.md`) with empty tables to fill in | Both | Nothing on the day should be set-up | 1 hour |
| 15 | **Push everything** and give the teammate write access to the repo or a fork | Chris | So both can commit from the first minute | 10 minutes |

**The critical path** is two chains, and both must finish by 3 December:

- Parts order (1) → parts arrive → smoke test (9) → pre-wire (11)
- Spec (4) → service (7) → laptop client (8) → dry run (13)

Everything else can slip a few days.

### Shopping list

Three lean breadboard radios: two to use and one spare. Part choices and prices are from the [Stage 2 doc](Walkie-Talkie%20Beyond%20the%20R1%20Minimum%20Hardware.md#recommended-build).

| Part | Quantity | Note |
|---|---|---|
| ESP32-S3 dev board, 16 MB flash, 8 MB PSRAM | 3 | Same model for all, so one pin map works |
| INMP441 I2S mic breakout | 3 | |
| MAX98357A I2S amp breakout | 3 | Run it from 5 V for the full 3 W |
| 4 ohm 3 W speaker, 40 to 50 mm | 3 | The size matters more than the watts |
| Big push button, 30 mm or more | 2 | |
| Rotary encoder with push | 2 | Or the small OLED with built-in knob |
| 0.96 to 1.3 inch one-colour OLED | 2 | |
| SPDT toggle switch | 2 | For PUSH / OPEN |
| Breadboards, jumper wires, USB-C data cables | Enough for 3 | Charge-only cables waste an hour |

About NZ$70 to 100 in all, plus shipping (my estimate from the Stage 2 doc's prices). No batteries: the day runs on USB.

## The day: Friday 4 December

The hack day page could not be read from this session, so the times below are counted from the start rather than given as clock times. The day assumes about seven working hours.

**Roles.**

- **Teammate: the radio.** ESP32 firmware: I2S capture and playback, Opus encode and decode, button and encoder, WebSocket client, sounds. Their ESP32 experience is worth most on audio timing and drivers, where a newcomer loses hours.
- **Chris: everything the radio talks to.** The protocol, the service, the laptop client, the sealing code for the firmware, integration, measurements and the write-up.
- **Together** at each merge point, and for anything that needs two hands, such as a delay test with one person at each radio.

| Time | Teammate (radio) | Chris (service and integration) | Merge point |
|---|---|---|---|
| 0:00 to 0:30 | Unpack and power up both breadboards, check the toolchain builds | Hotspot up, service health check, laptop client in echo mode | Agree the day's tiers. Pick the "Must" cards |
| 0:30 to 2:30 | **Audio loop on one radio:** button → mic → Opus encode → decode → amp. Set the amp gain. Note the Opus CPU load | **Sealing code for the firmware:** the spec's frame and header plus XChaCha20-Poly1305 (libsodium), checked against the test vectors. Hand it over as a small ESP-IDF component | Loudness check together: play a recorded voice at 1 m and 3 m in a quiet room and a noisy one. If 3 W is not enough, note it (the Louder-ESP32 fallback is in the Stage 2 doc) |
| 2:30 to 3:00 | Break | Break | |
| 3:00 to 4:30 | **Radio to service:** send sealed frames over the WebSocket on button down, play what arrives | Watch the service logs, fix floor control and fan-out bugs, keep the laptop client as the far end | **Must reached:** radio and laptop talk both ways |
| 4:30 to 6:00 | **Second radio:** flash the same build, add busy tone, chirp and roger beep | **Measure:** mouth-to-ear delay (a clap recorded at both ends on one phone video), behaviour on a weak hotspot, reconnect after Wi-Fi drops | **Should reached:** two radios talk to each other |
| 6:00 to 6:30 | Stretch: knob changes channel, or speech shaping on and off | Fill in `docs/measurements.md`, take photos and a short video | |
| 6:30 to 7:00 | Demo | Demo, then push everything | Write down what to do next |

**Rules for the day.**

- **Work to the spec.** If the spec is wrong, fix it in the repo first, then the code, so both sides change together.
- **Keep one firmware branch and one service branch,** merged at each merge point, not at the end.
- **Fall back, don't stall.** If the deployed service misbehaves, run it locally on the laptop with `wrangler dev`, with both radios on the laptop's hotspot. If WebSocket audio stutters badly, record that as a finding: it is exactly what the trial was meant to find out.
- **Write measurements down as they happen.** They matter more than the demo.

**What not to do on the day:** reflash the R1s, design the case, build key-pair sign-in, OTA updates, the family app or anything about pricing. All of that is in the plan, after the day.

## Risks to the day

| Risk | Impact | Mitigation |
|---|---|---|
| Parts arrive late | No radios | Order by 16 November; Core Electronics AU as the faster backup; the teammate's own boards |
| Venue Wi-Fi has a sign-in page or blocks WebSockets | Radios cannot connect | Own 2.4 GHz hotspot or travel router; `wrangler dev` on the laptop as a last resort |
| Spec or service not ready | Nothing for the radio to talk to | Spec and service are weeks 1 and 2, before anything else; the laptop client's echo mode is the minimum |
| Firmware base turns out heavy (xiaozhi) | Hours lost reading code | Decide in week 1 (item 6); the minimal ESP-IDF app is the fallback |
| Toolchain trouble on the day | Slow first hour | Same pinned ESP-IDF version on both laptops, tested in week 3 |
| Too ambitious for one day | Nothing finished | Tiers: "Must" first, everything else is a bonus |

## After the day

Picked up from the council review, in order:

1. **Write up the measurements** and update the estimates in the service design and Stage 2 doc with them.
2. **Grandad trial plan:** a one page plan saying what to measure, how to capture his view, and what counts as a pass. Before that, sit with him in front of the [site's simulator](https://cgbarlow.github.io/walkie-talkie/) on a tablet. It costs nothing and can happen any time, even before the hack day.
3. **Setup and care for Stages 1 and 2:** decide what replaces the control page before the family app exists. A small command-line tool built on the laptop client is the quickest answer.
4. **Soften the public promises** until the legal review: reword "NZ$0 Subscription, ever" on the site and "for life" in the README as an aim rather than a guarantee. A fifteen-minute edit that can also happen any time.
5. **Decide the R1's future** from the day's results: finish the R1 lock-down for the Grandad trial, or go straight to the ESP32 radio.
