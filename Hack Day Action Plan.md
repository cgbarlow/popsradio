# Hack Day Action Plan

Nov 14, 2026 · @Chris Barlow

## Summary

**The goal for Friday 4 December: the two R1s talking to each other with our own app.** Hold to talk on one, hear it on the other, through our channel service. Nothing more is required.

That fits in one day only if the slow, risky setup is done beforehand. So the next three weeks bring forward everything that isn't the app itself:

- **Reflash and root both R1s before the day,** at a bench night. It is the riskiest step, and it involves waiting on tools, so it should not eat the hack day.
- **Get a fallback working on the same night.** Zello on both flashed R1s means they are already talking, whatever happens on the day.
- **Have the service running and an app skeleton installed** before the day, so the day is spent on audio and the button, not setup.
- **Bring your own network:** a 2.4 GHz phone hotspot, because venue Wi-Fi with a sign-in page will not work.

Deliberately left out of the day: the ESP32 radio, end-to-end encryption, kiosk lock-down, automatic updates, key-pair sign-in and the family app. They all come later, as planned in the R1 doc and service design.

This is a plan, not sourced research. Effort figures are my estimates.

## What the day must prove

| Tier | Outcome |
|---|---|
| Must | Two R1s running our app. Hold an on-screen button on one, and the other plays it, through the channel service on Wi-Fi |
| Should | The side button works as push-to-talk. One talker at a time, with a busy tone. Chirp and roger beep. Mouth-to-ear delay measured |
| Could | Opus in place of raw audio. A try on LTE. The wheel changes channel |

**The fallback:** if the app isn't working by the afternoon, Zello from the bench night is the demo, and what we learned is the result.

**Shortcuts for the day.** These are allowed on the day only, and each is marked in the code as temporary:

- **Raw 16 kHz audio** rather than Opus. That is 256 kbit/s, which is fine on Wi-Fi. Opus is a stretch goal.
- **TLS only, no sealing.** The WebSocket's TLS protects the audio in transit, but the service can hear it. End-to-end sealing comes after the day.
- **A shared test token** in place of key-pair sign-in.
- **An on-screen button first.** The side button needs root, so it is a "Should".

## Before the day

### Week 1: 14 to 22 November

| # | Task | Owner | Effort |
|---|---|---|---|
| 1 | **Brief your teammate.** Share the repo and this plan, and ask whether they can make the bench night | Chris | 30 minutes |
| 2 | **Bench night** ([R1 doc](Rabbit%20R1%20Walkie-Talkie%20Research%20and%20Design.md#getting-control-of-the-r1), steps 1 to 6). On the Mac mini, running directly on macOS, not in a VM: Google's platform-tools for adb and fastboot, and the main [mtkclient](https://github.com/bkerler/mtkclient) project with its macOS install notes. A VM tends to miss the R1 as it reconnects between boot modes. Back up each R1, nvram included, and label the backups. Unlock, flash the LineageOS GSI and root with Magisk. Then run `getevent -lt` and press everything, and write down the real scancodes | Chris and teammate | 1 evening |
| 3 | **Zello smoke test** on the same night. Install it on both R1s and talk over Wi-Fi, then over LTE if there is a SIM. Note how loud they are and roughly how much delay there is. **The R1s are now talking:** this is the guaranteed fallback | Chris and teammate | 30 minutes |
| 4 | **Protocol spec v0.1** in `docs/protocol.md`, kept short. The WebSocket messages (join, floor request, granted, denied, talking, end) and the binary audio frame with its header (channel, sender, sequence, codec). Pick the cipher for later too: XChaCha20-Poly1305, as the service design says | Chris | 1 evening |
| 5 | **Cloudflare account and Wrangler** installed | Chris | 30 minutes |

### Week 2: 23 to 29 November

| # | Task | Owner | Effort |
|---|---|---|---|
| 6 | **Channel service v0.** One Worker and one Durable Object per channel: join, fan out binary frames unchanged, floor control, "who is talking", and a shared test token. Deploy it. Check it with `websocat` or a small script from the laptop | Chris | 2 evenings |
| 7 | **App skeleton on both R1s.** A Kotlin project that installs on the flashed R1, shows one big state word and an on-screen talk button, and opens the WebSocket to the service. No audio yet | Chris | 1 to 2 evenings |

### Week 3: 30 November to 3 December

| # | Task | Owner | Effort |
|---|---|---|---|
| 8 | **Dry run.** Both R1s join the deployed service over the phone hotspot and show each other's join and leave | Chris | 1 hour |
| 9 | **Pack.** Android Studio and adb on both laptops, with the R1s authorised for adb. Hotspot tested at 2.4 GHz. Both R1s charged, with cables. Bench night notes and scancodes in the repo | Both | 1 hour |
| 10 | **Push everything,** and give your teammate write access to the repo | Chris | 10 minutes |

**The critical path** is the bench night (2), because a stuck unlock needs time to sort out. Do it this week. Then the spec (4) → service (6) → app skeleton (7) → dry run (8). The rest can slip a few days.

## The day: Friday 4 December

The hack day page could not be read from this session, so times are counted from the start of the day, assuming about seven working hours.

**Using your teammate's ESP32 experience.** The R1s are Android, but most of the hard parts are low level, and that is where an embedded developer pays off:

- **The side button.** Remap scancode 116 in a key layout file, or write the small root daemon that reads the input device. The R1 doc covers both.
- **Audio timing.** Buffer sizes, the 20 ms framing, why playback stutters, and measuring delay.
- **Debugging on the device:** `adb logcat`, `getevent`, and reading the service's frames byte by byte.

You take the app's audio path, the service and integration. Pair up whenever one of you is stuck.

| Time | Teammate | Chris | Together |
|---|---|---|---|
| 0:00 to 0:30 | Check both R1s, adb and the hotspot | Service health check; skeleton app on both R1s | Agree the tiers |
| 0:30 to 2:30 | **Side button:** try the key layout remap first; if it fails, the root daemon. Report presses to the app | **Audio:** capture 16 kHz on button down, send 20 ms frames, play what arrives | |
| 2:30 to 3:00 | Break | Break | |
| 3:00 to 4:30 | Help with stutter and buffering on the receiving side | Fix the service's floor control and fan-out | **Must reached:** one R1 talks, the other hears |
| 4:30 to 6:00 | Wire the side button in place of the on-screen one | Busy tone, chirp and roger beep | **Measure delay:** film a clap heard on both R1s with one phone and count the frames |
| 6:00 to 6:30 | Stretch: Opus, LTE, or the wheel | Write findings in `docs/measurements.md` | |
| 6:30 to 7:00 | Demo | Demo, then push | List what's next |

**Rules for the day.**

- **If the spec is wrong, fix it in the repo first,** then the code.
- **Fall back, don't stall.** If the deployed service misbehaves, run it on the laptop with `wrangler dev`, with both R1s on the laptop's hotspot. If the app isn't working by 4:30, demo Zello and spend the rest of the day writing down what was learned.
- **Write measurements down as they happen.**

**If your teammate brings an ESP32 with a mic and amp they already own,** an unmodified xiaozhi-esp32 flash gives a quick loudness comparison with the R1. It is optional, and nothing gets integrated on the day.

## Risks to the day

| Risk | Mitigation |
|---|---|
| An R1 won't unlock or flash | Done in week 1, with time to sort it out; the mtkclient route is in the R1 doc |
| mtkclient won't connect from macOS | Use a real Linux machine: your teammate's laptop, or a PC booted from an Ubuntu USB stick |
| Venue Wi-Fi has a sign-in page | Own 2.4 GHz hotspot |
| Service not ready | `wrangler dev` on the laptop |
| Side button remap fails | On-screen button; the side button is only a "Should" |
| The app isn't finished | Zello from the bench night is the demo |

## After the day

From the [council review](.campaign/council-report.md), in order:

1. **Replace the shortcuts:** Opus, end-to-end sealing to the spec, and key-pair sign-in.
2. **Lock the R1s down** as Device Owner with kiosk mode, ready for Pop.
3. **Write a one-page Pop trial plan.** Before that, sit with him in front of the [site's simulator](https://popsradio.chrisbarlow.nz/) on a tablet, which can happen any time.
4. **Sweep the docs for drift** and **soften the public promises** ("NZ$0 Subscription, ever", "for life") until the legal review.
5. **Breadboard an ESP32 with your teammate,** once the R1s work. The [Stage 2 doc](Walkie-Talkie%20Beyond%20the%20R1%20Minimum%20Hardware.md) has the parts list.
