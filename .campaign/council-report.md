---
created: 2026-11-16
council-type: standalone
---

# Council Report

Scope: a research task on turning Pop's Radio into a hardware platform. A cheap base with Talk, FM, Wi-Fi and Bluetooth; plug-in mesh, mobile data and more; two USB-C ports; a Bluetooth keyboard; an external screen. The question: how cheap can the base be, and is it viable and practical? Read: Design Decisions, the cost-down report, the platform brief (rules and app store), the Stage 2 doc (Bluetooth, memory), the service design (signing). Researched: the chip's USB and Bluetooth, modem prices, competing devices, and existing expansion standards.

The full findings are in [the research report](../reports/Modular%20platform%20and%20base%20unit%20cost.md). It is a proposal, not a decision.

## Animal Perspectives

### Bear — Vision & Direction
1. **The brand line is the best thing in the brief.** "The radio his younger self would have opened" respects the user, where most products for older people talk down. It is true to why the project exists.
2. **It is a second market, not a new product.** The base is today's board with one chip moved to a card. That keeps one radio, one firmware and one service.
3. **Two messages need two rooms.** A family buying for a frail parent wants "it just works". A maker wants "open it up". The front page stays Pop's; the tinkering gets its own page.
4. **This reverses part of yesterday.** Decision 8 says every Pop's Radio is a link in the mesh. An optional mesh module ends that for the cheapest kit. Decide it on purpose.

### Cat — Risk & Scope
1. **Three of the ideas do not work as described.** A USB-C screen needs a video signal the chip cannot make. Bluetooth is Low Energy only, so keyboards work and speakers, headphones and most hearing aids do not. A 5G module costs three to four times a 4G one.
2. **The regulator could undo the business model.** If RSM treats a radio module the owner plugs in as a new product each time, modules cannot be sold separately.
3. **An open radio breaks a firmware promise.** "Nobody can switch the microphone on from somewhere else" is kept by our firmware today. On an open radio only the hard-wired red light keeps it.
4. **Pins and power are not counted.** Three knobs, a screen, audio, two card bays and USB use nearly every pin. A keyboard, a loud speaker and a modem can all draw at once.
5. **"Dirt cheap" will disappoint.** The base is about NZ$33 to make and NZ$59 to 69 to buy. That is cheap for what it is. It is not a ten-dollar board.

### Owl — Process & Structure
1. **Research first, decisions second.** The report sits beside Design Decisions and lists the four decisions it would reopen. Nothing is re-locked.
2. **Same cost method as before.** Same exchange rate, GST, factory and part prices as the cost-down report, so the two tables compare line for line.
3. **Borrow a standard for the sockets.** A private connector means making every add-on ourselves. mikroBUS for the two card bays and Qwiic for sensors bring a catalogue with them.
4. **Order of work.** Ask RSM, count pins and power on paper, try a keyboard and the web page on a dev board, decide the mesh question, then draw the board once.

### Puppy — Opportunities & Momentum
1. **The big case was a cost. Now it is the asset.** At 220 × 125 × 80 mm there is room for bays and screw posts that no pocket device has.
2. **A web page is a better screen than a cable.** The radio serves a page on the home Wi-Fi, and any phone, tablet or TV becomes its screen and keyboard, for nothing.
3. **A badge socket costs cents.** It is the tinkerer's handshake, and there are hundreds of home-made cards for it.
4. **Makers are the first mesh nodes and the first installers.** The grandchild who builds the kit is the one who sets up Pop's radio.
5. **Less cash per batch.** A thousand bases is about NZ$33,000 against NZ$45,000, and modules can be ordered as they sell.

### Rabbit — Resources & Stakeholders
1. **New people to ask:** RSM on plug-in radios, MIKROE on using the mikroBUS name, and the maker community itself.
2. **The licence is in the way.** PolyForm Noncommercial stops a maker selling an add-on. Publish the socket page freely; keep the radio's own design as it is.
3. **More things to stock and support.** A base, two modules, two cases and a speaker, each with a box and a listing.
4. **Every module is firmware work.** Mesh and 4G are planned. Each later one needs a driver, a test and support.
5. **Prices are thin in places.** The M5Stack and T-Deck prices are from 2024 and third-party listings, and no specific 5G module price was found.

### Wolf — Cohesion & Balance
1. **Pop must not notice.** Sockets inside, behind a screwed back panel. Nothing new on the outside but a second USB-C port.
2. **The mesh is what the proposal costs.** Fit the mesh module to every built radio, and leave it out of the bare kit only. That keeps most of yesterday's promise.
3. **Hearing aids are the question families will ask.** "Bluetooth" on the box will be read as "plays through Pop's hearing aids". Say "Bluetooth keyboards" and nothing wider.
4. **The card and the simulator are still behind.** Third Council running. Neither mentions the mesh, and now there is a keyboard too.
5. **The kids' mini phone stays closed.** No bays, no header, no mesh.

## Consensus

**Common themes.**

- **Viable, in a narrow form.** Bear, Owl and Puppy: two card bays, two sensor sockets, a badge socket, two USB-C ports. It is today's board, rearranged.
- **Cheaper to make, about NZ$3 dearer fully loaded.** About NZ$33 a base at 1,000 against NZ$45 for the all-in-one board; NZ$48 with the mesh module fitted.
- **Change three promises.** Cat and Wolf: no USB-C screen, "Bluetooth keyboards" not "Bluetooth", and 4G not 5G.
- **Use other people's sockets.** Owl, Puppy and Rabbit.

**Key tensions.**

- **A cheap bare base against a mesh in every radio.** The proposal's real cost. Resolved, as a recommendation, by fitting the mesh module to every built radio.
- **Open hardware against the microphone promise.** Resolved by making the hard-wired red light the guarantee, and locking the firmware on radios built for Pop.
- **A hobbyist platform against a non-commercial licence.** Not resolved. It is your call.
- **"Dirt cheap" against three knobs and a screen.** The floor is about NZ$31. Below that it is a different radio.

**Assessment.** The idea is sound and the numbers support it: the modular base is cheaper to make, ties up less cash and adds about three dollars to a fully loaded radio. Three of the features as first described do not survive contact with the chip, and each has a workable substitute. The open questions are the regulator, the licence and the mesh, not the engineering.

## Recommended Next Steps

1. **Ask RSM about radio modules the owner fits.** It decides whether modules are a product or only a factory option.
2. **Count the pins and the power on paper**, with two card bays, two sensor sockets and a keyboard on the Data port.
3. **Try the two awkward claims on a dev board:** a Low Energy keyboard typing onto the screen, and the radio's web page open on a phone.
4. **Decide the mesh question,** and the licence for the socket page.
5. **Then draw the board once,** with the sockets in.
