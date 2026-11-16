---
created: 2026-11-16
council-type: standalone
---

# Council Report

Scope: lock the design choices that were ideas, per the [cost-down report](../reports/Custom%20PCB%20and%20cost-down.md) and its option C (a co-processor for Meshtastic), with the mesh always on and every radio taking part; update the docs and the site to match. Read in full: the cost-down report, the README, the image prompts, `index.html`. Read in part: the platform brief, the service design, the Stage 2 doc, COMMERCIAL.md.

The Council's advice was acted on in the same session. What changed is listed at the end.

## Animal Perspectives

### Bear — Vision & Direction
1. **Three documents disagreed about what the radio is.** The platform brief called itself "a design exploration, not a locked decision", the README's Stage 2 was a one-knob radio for NZ$35 to 50, and the site said "the design we're exploring". One page now has to win. That is `Design Decisions.md`.
2. **The headline does not move.** "Hold to talk. Let go to listen." The mesh is the second thing the radio does, not the first, and it cannot carry voice.
3. **Always on changes what is being sold.** With the mesh asleep it is a feature. With it always on and passing messages along, every radio sold improves every other one. That is a network, and it is the strongest reason yet for a stranger to buy one.
4. **Kits come before built radios.** A hundred kits cannot carry certification; a thousand can. The order of work should say so.

### Cat — Risk & Scope
1. **Always on overrules the report's own advice.** The report recommended a quiet node, on only when docked or when Wi-Fi was down. Always on takes the battery from about 13 days to about 3, and the 3 rests on an estimated 30 mA. Nothing is measured.
2. **Hundreds of relaying radios in a busy city mesh.** The relay report says Wellington's mesh is already busy. Arriving uninvited could sour the people whose mesh this depends on.
3. **"Resilience" will be read as a safety promise.** A message needs a chain of radios and a mesh radio at the family's end. On day one there are two radios. The site must say best efforts, text only, not 111, every time the mesh is mentioned.
4. **A price is now public before a quote exists.** NZ$89 to 99 rests on list prices, an estimated HT-CT62 volume price, and no certification. Kits probably count as supply to the regulator.
5. **The serial link is the thinnest part.** Text mode reaches only the primary channel, and anything richer waits on legal advice about GPL protobufs. The HT-CT62's serial pins are unconfirmed.

### Owl — Process & Structure
1. **A decision register with a tie-break rule.** Ten numbered decisions, what each replaced, and where the detail lives. Other documents get a dated note at the top, not a rewrite.
2. **Keep the stage numbers stable.** Stage 2 splits into 2a (modules) and 2b (custom board), so Stages 3 and 4 keep their meaning in the service design.
3. **The home page must not grow.** Two new topics go in; the other shapes, the old parts picture and the numbers move to a second page. Shared styles then belong in one stylesheet.
4. **Pictures are a dependency.** The two parts pictures cannot be made here. The prompts need fixed file names so the pictures drop in, and the site needs honest drawings in the meantime.
5. **Left behind on purpose:** the simulator has no Mesh mode and the printed card has no mesh line.

### Puppy — Opportunities & Momentum
1. **The mesh map is the easiest picture in the project to explain.** Eleven houses, three hops, "I'm OK".
2. **A kit with no soldering is a school and workshop project.** That is a second market the built radio never reaches.
3. **Quick win: Mesh in the simulator.** Turn Mode to MESH, pick "I'm OK", press. It would test the idea with Pop before any hardware.
4. **One evening on a breadboard** proves or kills option C: an ESP32-S3 board, an HT-CT62, a serial line.

### Rabbit — Resources & Stakeholders
1. **New people to talk to:** the local mesh group, RSM, Heltec, the board maker, and Meshtastic's trademark contact.
2. **One supplier for the dearest part.** The HT-CT62 is about 30% of the parts bill and comes from Heltec alone.
3. **Cash.** A hundred kits is about NZ$5,800 landed. A thousand is about NZ$45,000, before certification.
4. **The built radio has no price** because the case and speaker have none.
5. **Stock.** The ESP32-S3 module was out of stock at LCSC on 16 November.

### Wolf — Cohesion & Balance
1. **Pop against the neighbourhood.** Always on serves the mesh; three days of battery is what Pop pays. That is acceptable only because his radio lives on its stand. Say it plainly.
2. **The card and the simulator are now behind the design.** They are the two things Pop actually touches.
3. **The kids' mini phone keeps its promise.** No mesh chip, no strangers. Every radio takes part except that one.
4. **Kit buyers pay for channels; built radios include them.** It is consistent with the service design, and it may still feel unfair. Watch for it.
5. **Stage 1 is untouched,** and should be. The hack day plan and the R1 doc did not need a word changed.

## Consensus

**Common themes.**

- **One source of truth.** Bear and Owl both wanted a single page that wins, with the older documents pointing at it.
- **Decided is not tested.** Cat, Wolf and Owl all asked that every locked decision name the test that could reopen it.
- **Honesty about the mesh.** Text only, best efforts, not an emergency service, and a real battery cost.
- **Keep the home page short.** Detail moves to a second page.

**Key tensions.**

- **Always on against battery and a busy mesh.** You decided always on. The Council records the cost (about 3 days, an extra NZ$14 a radio, more traffic) and the mitigations (it lives on its stand; default hop limit; talk to the local mesh first).
- **Publishing a kit price against having no quote.** Resolved by calling it suggested, for a first batch, and saying nothing is for sale.
- **A network story against the one-button promise.** Resolved by order: Talk first, mesh second, and the orange button never sends a mesh message.

**Assessment.** The project now has one radio, one board and one plan, where yesterday it had a simple radio, a platform idea and a research report that did not agree. The price of that clarity is that several decisions are locked ahead of any measurement, and the always-on mesh is the boldest of them.

## Recommended Next Steps

1. **Breadboard the mesh chip.** An ESP32-S3 dev board and an HT-CT62 in text mode. Confirm the serial pins, and measure the current with the mesh always on.
2. **Make the two parts pictures** from prompts 1a and 1b, and swap them in for the drawing.
3. **Get real quotes:** the board maker for 10 and 100, and Heltec for the HT-CT62 at 1,000.
4. **Two conversations before any sale:** RSM on whether a kit is supply, and the local mesh group on relaying radios.
5. **Catch up what Pop touches:** Mesh mode in the simulator, a mesh line on the card, and a price for the case and speaker so the built radio can be priced.

## What changed in this session

| File | Change |
|---|---|
| `Design Decisions.md` | New. Ten locked decisions, the mesh settings, kits and built radios, savings, order of work, and the tests still to pass |
| `index.html` | Tags changed from ideas to decided; new mesh section with a map; new board, kits and prices section; plan now 1, 2a, 2b; three new questions. Other shapes, the old parts list and the numbers moved out |
| `build.html` | New second page: decisions, the board, costs, kits, the mesh, what is still to prove, other shapes |
| `site.css` | New. The styles both pages share |
| `images/mesh-map.svg`, `images/build-compare.svg` | New drawings |
| `Walkie-Talkie Image Prompts.md` | Prompt 1a (twenty module parts), 1b (the custom board kit), 1c (the mesh). The old prompt kept, folded away |
| `reports/Custom PCB and cost-down.md` | Decision note; role, power and lever rows updated for always on |
| `Pop's Radio as a Platform.md` | Locked; Mesh mode and section added; screen chosen; hardware priced |
| `Walkie-Talkie Service Design.md`, `Walkie-Talkie Beyond the R1 Minimum Hardware.md`, `README.md` | Dated notes, stages, kits and links |
