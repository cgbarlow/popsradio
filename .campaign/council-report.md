---
created: 2026-11-16
council-type: standalone
---

# Council Report

Scope: add a plywood case to the kit. Two things: a free plywood box plan, and a finished plywood box that can be bought with a kit, alongside the plans for 3D printing. Text for `index.html`, and two image prompts. Read: `index.html` and `build.html` (the kits sections), `Design Decisions.md`, the platform image prompts (prompt 1, prompt 2 and the fallback), the service design's "Build your own" table.

The advice was acted on in the same session. What changed is listed at the end.

## Animal Perspectives

### Bear — Vision & Direction
1. **Plywood answers the kit's weakest line.** "You add a case" assumed a 3D printer. Most families who can use a screwdriver do not own one. A wooden box closes that gap.
2. **It fits what the radio is meant to be.** The brief asks for "a modern take on a 1960s portable radio". A plywood box by the bed looks like furniture, not a gadget.
3. **It is a second case, not a second radio.** Same boards, same size, same controls in the same places. That needs saying as a decision, so it is decision 11.
4. **The sage green radio stays the face of the project.** Plywood is an option on the kit, not a new hero picture.

### Cat — Risk & Scope
1. **Nothing is drawn.** The 6 mm thickness, the finger joints and the oil finish are guesses. The site must say the plan is not drawn and has no price.
2. **Will the parts reach through 6 mm of wood?** The knob shafts, the slide switch's thumb, the button cap and the screen all sit behind a panel twice as thick as a printed wall. That is a fit test, not a detail.
3. **Sound and radio.** A wooden box with a drilled grille will sound different from the printed case, and the mesh antenna is meant to sit inside. Both need a built box to check.
4. **A finished box is handwork.** Gluing, sanding and oiling is time for someone. Selling it adds a product with no cost model behind it yet.
5. **Prompt 1 is now out of date.** The reference picture still describes a paper-like screen 140 mm wide and four mode tabs. The locked design is a 2.4 inch black-and-white screen. (The four tabs are right: the mesh is connectivity, not a mode.) Every picture built on it inherits that.

### Owl — Process & Structure
1. **One place to choose a case.** On the home page it goes under "Three ways to get one" as two cards. The comparison table goes on the detail page.
2. **Plywood is "a first proposal" inside a locked document.** Design Decisions says so, and adds a test to "Still to prove".
3. **Prompt numbering.** The radio's prompts run 1 to 7 and each takes the reference picture. Plywood goes on as 8 and 9. Prompt 8 shows panels, so needs no reference; prompt 9 is the only one that changes the radio, so it must say what changes.
4. **Keep the home page short.** Two cards and one line of small print, about 440 pixels.

### Puppy — Opportunities & Momentum
1. **This is the school and shed version.** A laser cutter, glue and a screwdriver. An afternoon's project that ends with a working radio.
2. **Grandchildren could build Pop's radio.** That is a better story than any picture.
3. **Quick win: cut one from cardboard first.** The brief already asks for a cardboard mock-up for size. The plywood plan and the mock-up are the same drawing.
4. **Side by side.** A picture of the green radio and the plywood radio on one table would sell the choice in a glance.

### Rabbit — Resources & Stakeholders
1. **Who cuts it.** A makerspace or library laser cutter, a school workshop, or a fretsaw at home. A bought box needs someone to make them.
2. **What the plan depends on.** The board outline and the positions of the knobs, switch and screen. The plywood plan cannot be finished before the board is drawn.
3. **Small printed parts remain.** Two large knobs, the volume knob and the button cap. A plywood buyer still needs those, so they go in with a bought case.
4. **Prices missing.** Neither case has a price, so the built radio still has none.

### Wolf — Cohesion & Balance
1. **Two cases, one radio.** The pictures all show green plastic. Until a plywood picture exists, the site describes plywood in words only, and should not pretend otherwise.
2. **Don't let the printed case look second-best.** Both get a card, both have free plans, both can be bought.
3. **The card and the simulator are still behind.** Neither mentions the mesh. That was last Council's finding and it stands.
4. **Makers get a real choice now.** Free plans in two materials is a fair offer to people who will never buy anything.

## Consensus

**Common themes.**

- **Plywood makes the kit possible for people without a printer.** Bear, Puppy and Rabbit.
- **Say plainly that nothing is drawn or priced.** Cat, Owl and Wolf.
- **Same boards, same size, same controls.** It is a second case, not a second design.

**Key tensions.**

- **Locking a decision that is only a proposal.** Resolved by recording it as decision 11 and marking the thickness, joints and finish as starting points with a named test.
- **A new thing to sell with no cost behind it.** Resolved by leaving the price unset and saying so.
- **Prompt 1 against the locked design.** Resolved after the Council: the base image stays as it is. Its four tabs are right, and its black-and-white screen is right.

**Assessment.** Plywood is a good addition and a cheap one to describe. It is also the least worked-out thing on the site: one sentence of intent, no drawing. The words now say that.

## Recommended Next Steps

1. **Keep the reference picture as it is.** Decided after the Council: the base image is right and does not change. Its screen is drawn wider than a 2.4 inch panel, which is a point for the parts list, not the picture.
2. **Make the new pictures:** 1a and 1b (the parts), 8 and 9 (plywood), and 1c (the mesh) if wanted.
3. **Cut the box from cardboard,** from the same drawing as the size mock-up.
4. **Build one plywood box with the boards in it** before settling 6 mm, the joints and the grille.
5. **Price both cases,** so the built radio can be priced.

## What changed in this session

| File | Change |
|---|---|
| `index.html` | "Two cases: printed or plywood" under "Three ways to get one"; kit card, plans card and one answer mention plywood |
| `build.html` | "The case, two ways" table in the kits section; a plywood row in "Still to prove" |
| `Design Decisions.md` | Decision 11, a section on the two cases, and a test |
| `Pop's Radio Platform Image Prompts.md` | Prompt 8, the plywood box plan as a flat pack, with a key. Prompt 9, the finished plywood radio by the bed |
| `Walkie-Talkie Service Design.md`, `README.md` | The case row and one line |
