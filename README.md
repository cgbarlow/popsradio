# Pop's Radio

A walkie-talkie with one big button, made for Pop.

Mobile phones can be tricky for older people. Small icons, passcodes, updates and menus get in the way when all they want is an easy way to reach the people they love. This project is a small radio that does one thing first: hold the orange button to talk, let go to listen. It works over Wi-Fi, so the family can be in the next room or the next town. A second radio inside it passes short messages from house to house when the internet is down.

**See it and try it:** https://popsradio.chrisbarlow.nz/

![A sage green radio on a bedside table, with a big orange button on top, a knob on each side and a shoulder strap](images/platform-bedside_sml.jpg)

*Concept picture of the radio we're building. The design is [locked](Design%20Decisions.md); nothing is built yet.*

Other shapes we looked at, and the parts:

| The first bedside radio | Classic handheld | Pocket pebble | The parts of the first, one-knob build |
| --- | --- | --- | --- |
| ![Sage green wedge-shaped bedside radio](images/bedside-radio_sml.jpg) | ![Cream handheld radio](images/classic-handheld_sml.jpg) | ![Navy pebble-shaped radio in a hand](images/pocket-pebble-front_sml.jpg) | ![Thirteen parts laid out on a mat](images/parts-layout_sml.jpg) |

## Where it's at

This is a family project at the research and design stage. The design is decided, in [Design Decisions](Design%20Decisions.md). Nothing is built yet.

| Stage | What | Status |
| --- | --- | --- |
| 1 | Prove the idea on two Rabbit R1s, reflashed to run one app | Now |
| 2a | Build the radio from modules: three knobs, a 2.4 inch screen, FM and the mesh radio, about NZ$61 in parts | Next |
| 2b | Put it on one custom board: 10 boards, then 100 kits at about NZ$58 each to make | After 2a |
| 3 | A family app for iOS and Android, to talk to Pop's radio from a phone | Later |
| 4 | A direct path between homes, only if the trials show it's needed | If needed |
| Later | Certify it, then built radios and a batch of 1,000 kits at about NZ$45 each to make | After the first 100 |
| Later | A kids' mini phone: a smaller, cheaper radio that only reaches the people parents approve | Idea |
| Later | Approved apps from other people, on the [platform](Pop's%20Radio%20as%20a%20Platform.md) | Idea |

Every stage uses the same serverless service, the same code core and the same sounds, so R1s, ESP32 radios and phones can share a channel. The design is locked in the [service design](Walkie-Talkie%20Service%20Design.md).

### Making the R1 work count

The R1 is a temporary client. Most of what Stage 1 builds is used again in Stage 2:

- **Used again as is:** the serverless service, the update system, the protocol, the sounds and screen states, and everything learned from the week with Pop.
- **Written once for all:** a small C library holding the protocol, encryption, jitter buffer, turn-taking and speech shaping (making voices clearer for older ears). The R1 app calls it, the ESP32 firmware compiles the same files, and the iOS and Android family app will use it too. The R1 app itself becomes the start of the Android family app.
- **Built first:** a written protocol spec and a laptop test client, so the server can be tested without either device and the two devices can be checked against each other.
- **R1 only, kept small:** reflashing, the button remap and locking the R1 to one app.

Afterwards the R1s can stay on the same channels as the ESP32 radios. The detail is in the [R1 doc](Rabbit%20R1%20Walkie-Talkie%20Research%20and%20Design.md#making-the-r1-work-count-for-stage-2).

## How it works

- **Hold to talk.** One talker at a time, like a real radio. A chirp says it's ready, a roger beep says the message ended.
- **A knob picks who.** The right-hand knob says each name out loud. A channel can be one person or a group, such as the whole family.
- **More than talk.** The left-hand knob picks what the radio is doing: Talk, FM radio, internet radio, games and a chess clock, or Mesh. The family chooses which appear. Holding the orange button always talks.
- **PUSH / OPEN switch.** Flip to OPEN to talk hands-free, taking turns. It works on group channels too, and the radio says out loud who can hear. The red light stays on whenever the microphone can hear. This part is a design proposal and hasn't been tested.
- **A mesh that is always on.** Every radio carries a small Meshtastic radio that needs no internet. Radios in range pass short text messages along, so an "I'm OK" can cross a suburb in a power cut. Text only, and best efforts.
- **Private.** Messages are encrypted on the radio. The server passes them on but can't open them, and nobody can switch the microphone on from somewhere else.
- **Looks after itself.** It keeps the last message for 24 hours, tells the family if it goes offline or the battery runs low, and updates itself overnight.
- **No subscription, ever.** Each set comes with its channels, and their running costs are prepaid for life. More channels can be added later, for life or monthly.

It is not an emergency alarm. In an emergency, call 111.

![Eleven houses on a simple map, each with a Pop's Radio. With the internet down, a message from Pop reaches Chris in three hops through two neighbours' radios](images/mesh-map.svg)

*How the mesh might look. A drawing, not a coverage map.*

![The same radio built two ways: sixteen modules joined by hand-soldered wires, and one main board with three small boards](images/build-compare.svg)

*Wired from modules for the first few, then one custom board. A drawing, not a photo.*

## What's in this repo

| File | What it is |
| --- | --- |
| [`index.html`](index.html) | The project site. Includes a simulator you can try in the browser |
| [`build.html`](build.html) | The site's second page: the board, the parts, the costs, kits, the mesh and the other shapes |
| [Design Decisions](Design%20Decisions.md) | What is locked: the radio, the custom board, the always-on mesh, and kits or built radios. Start here |
| [Rabbit R1 Walkie-Talkie Research and Design](Rabbit%20R1%20Walkie-Talkie%20Research%20and%20Design.md) | Stage 1: the R1 hardware, reflashing, the app, networking, and designing for Pop |
| [Walkie-Talkie Beyond the R1: Minimum Hardware](Walkie-Talkie%20Beyond%20the%20R1%20Minimum%20Hardware.md) | The ESP32 research behind Stage 2: the simpler one-knob build, pairing, power, and open channel mode |
| [Walkie-Talkie Service Design](Walkie-Talkie%20Service%20Design.md) | The locked design: serverless service, updates, shared code, family app, lifetime costs, the guarantee and the roadmap |
| [Hack Day Action Plan](Hack%20Day%20Action%20Plan.md) | Getting the two R1s talking at the 4 December hack day: what to do beforehand, and how to spend the day |
| [Walkie talkie without central relay](reports/Walkie%20talkie%20without%20central%20relay.md) | Research on running without a central relay, and the recommendation adopted |
| [NZ addressable market and opportunities](reports/NZ%20addressable%20market%20and%20opportunities.md) | Research on the size of the New Zealand market, for families and for rest homes, hospitals and other organisations, by category and region |
| [Similar products and competitors](reports/Similar%20products%20and%20competitors.md) | Research on products like Pop's Radio around the world, what they cost, and what that means for the plan |
| [Custom PCB and cost-down](reports/Custom%20PCB%20and%20cost-down.md) | Research on putting the whole platform radio, with Meshtastic, on one custom board: parts, costs at 100 and 1,000, the base kit and certification |
| [Walkie-Talkie Image Prompts](Walkie-Talkie%20Image%20Prompts.md) | Prompts for the parts pictures (every module, and the same radio on the custom board), a mesh picture, and the earlier shapes |
| [Pop's Radio as a Platform](Pop's%20Radio%20as%20a%20Platform.md) | The radio we are building: a stout radio with three free-turning knobs that also plays FM and internet radio and simple games, passes mesh messages, and could take approved apps |
| [Pop's Radio Platform Image Prompts](Pop's%20Radio%20Platform%20Image%20Prompts.md) | Prompts for concept pictures of the platform unit |
| [`images/`](images) | Concept pictures. These are generated images, not photos of real units |

## Running the site locally

The site is two HTML files with no build step. Open `index.html` in a browser, or serve the folder:

```bash
python3 -m http.server 8000
```

Then go to http://localhost:8000.

To update the progress shown on the site, change the `done` numbers in the `PLAN` object near the bottom of `index.html`.

## Licence

Free for non-commercial use. Build one for your own family, change it, share it. A home-built radio can run on your own copy of the service for free, or join ours with channels from the same [price list](Walkie-Talkie%20Service%20Design.md#prices-kept-simple) as everyone else.

- **Code** (including `index.html`): [PolyForm Noncommercial 1.0.0](LICENSE)
- **Research documents and images:** [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). Credit Chris Barlow, don't use them commercially, and share any changed versions under the same licence.

The case comes two ways, 3D printed or plywood, and the plans for both will be free.

Building or selling radios commercially needs a licence. See [COMMERCIAL.md](COMMERCIAL.md).
