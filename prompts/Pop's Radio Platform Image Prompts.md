# Pop's Radio Platform Image Prompts

Nov 15, 2026 · @Chris Barlow

Eleven prompts for an image generator, for the platform unit in [Pop's Radio as a Platform](../docs/Pop's%20Radio%20as%20a%20Platform.md). Prompt 1 designs the radio, in the bedside scene. Prompts 2 to 7 take that picture as their reference and change only the scene: a blueprint, a chess clock in a rest home, Pong from the player's seat, FM radio on the screen, the Talk list close up, and the radio carried with its strap over a shoulder. Prompts 8 and 9 are the plywood case: the cut panels laid out as a plan, and the finished plywood radio. Prompts 10 and 11 are for tinkerers: the radio with its back off, and the plug-in cards.

## How to use

1. **Make the reference picture.** Run prompt 1 until the radio is right, and save that picture. It is the only prompt that describes the radio in full.
2. **Attach it to every other prompt.** For prompts 2 to 7 and 9, attach the reference picture and paste the prompt. Prompt 10 takes two pictures: the reference picture and the custom board parts picture. Each one tells the generator to keep the radio exactly as it is and change only the scene, the camera angle and what the screen shows.
3. **Always attach the original.** Use the prompt 1 picture every time, not the latest result. Each copy drifts a little, and copies of copies drift a lot.
4. **If the radio changes anyway,** add "match the reference image exactly; the radio must not change" to the end, or try again. Small parts drift first: the switch, the volume knob, the status light.
5. **If your tool cannot take a reference picture,** use [the fallback](#fallback-no-reference-picture) at the end.

Notes for prompts 2 to 7:

- **Upright or on its back.** In prompt 3 the radio stands upright, the right way up, as in the reference picture. Only in prompt 4 does it lie on its back with the screen facing up: the top edge, with the orange button, points away from the player, and the speaker grille is nearest them. If prompt 3 comes out lying down, add "the radio stands on its base, as in the reference image".
- **Faces.** Prompts 3, 4 and 7 keep faces out of frame. If the generator adds one anyway, add "cropped at the chest, no faces visible".
- **The mode bar.** Upright screens show all four modes as tabs across the top (TALK, FM, NET, PLAY), with the current one highlighted, and the choices for that mode below. The chess clock and Pong use the whole screen, with no tabs.
- **Screen text.** Every prompt spells out every word on the screen and ends with "no other text on the screen", because generators fill an empty screen with made-up station names. If the words come out wrong, cut the small text first.
- **Aspect ratio.** 4:5 for most, 16:9 for the blueprint, 3:2 for the chess game. Some tools copy the shape of the reference picture; if so, set the ratio in the tool instead.

## Prompt 1: by the bed (the reference picture)

The original bedside scene from [prompt 2b](Walkie-Talkie%20Image%20Prompts.md#2b-bedside-radio), redone with the new radio: wooden bedside table, reading lamp and a mug of tea. Everything else is built on this picture, so it is worth several tries.

```
Product photograph of a homemade internet walkie-talkie and radio, three-quarter front view, sitting on a wooden bedside table next to a reading lamp with a warm glowing shade and a ceramic mug of tea, with the soft edge of a made bed and its pillow just visible behind. The bedside table, the lamp and the mug are all clearly in frame. A stout rectangular tabletop radio in matte sage green plastic with softly rounded edges: a long, low, landscape shape, about 220 mm wide, 125 mm tall and 80 mm deep, like a classic portable transistor radio. The front face is clearly much wider than it is tall, nearly twice as wide, and never square. The case is one plain shape with straight sides all the way down to the table: no flared base, no plinth, no skirt, no foot. A long, narrow, adjustable woven cream fabric shoulder strap, only about 20 mm wide, long enough to wear over the shoulder, with a metal slide buckle for adjusting its length, fixed at each end to a small metal ring at the upper corner of each side panel; not a short handle. The spare length of the strap lies in loose loops on the table beside the radio. Front face: in the upper half, a paper-like reflective black-and-white screen about 140 mm wide and 50 mm tall, a wide landscape shape, with a warm light grey background and crisp black text, lit by a soft warm front light; in the lower half, a wide perforated speaker grille. Top surface, from left to right: a small, compact smooth slide switch: a short slot only about 20 mm long, half the width of the orange button, with the word "PUSH" printed in small white capitals just in front of its left end and "OPEN" just in front of its right end. The slider thumb is a small raised oval about 8 mm long, sitting hard against the far left end of the slot, directly behind the word "PUSH"; the rest of the slot, to the right of the thumb, is an empty dark groove. The switch is clearly set to PUSH, not in the middle; exactly in the centre of the top surface, midway between the left and right edges, with the switch to its left and the volume knob to its right, one very large domed orange arcade-style push button about 40 mm wide, the biggest and brightest control on the radio; and a small black ribbed volume knob about 25 mm across, clearly smaller than the orange button. One large black ribbed rotary knob sticks out from each side panel, left and right, level with the screen, each about 40 mm across and 25 mm deep, with deep finger grips like a vintage radio tuning knob and a white pointer line on the face. One small status light glowing green, to the left of the screen only. Only three knobs in total. No antenna, no keypad, no other buttons, switches or lights, no brand logos. The screen shows, across the top, a row of four small evenly spaced tabs reading "TALK", "FM", "NET" and "PLAY" from left to right, with the "TALK" tab highlighted as white letters on a solid black block and the other three tabs as plain black letters; below the tabs, a simple list of three names in large bold letters, one per row: "CHRIS", "FAMILY", "NURSE". The "FAMILY" row is selected, shown as white letters on a solid black bar. No other text on the screen. Warm, homely, sturdy design, like a modern take on a 1960s portable radio. Soft warm evening lamp light, shallow depth of field. Aspect ratio 4:5.
```

**Getting prompt 1 right.** What to check, and what to add if it is wrong:

| Check | If it is wrong, add |
| --- | --- |
| **Shape:** a long, low rectangle with straight sides down to the table. Generators pull it towards a square, most of all in a tall 4:5 picture, so "nearly twice as wide" overstates it a little on purpose | Change the aspect ratio to 3:2. For a plinth or foot: "the bottom edge is the same as the top edge" |
| **Strap:** long, narrow (about 20 mm) and adjustable, not a short handle or a wide bag strap | "a thin strap, no wider than a finger" |
| **Switch:** small, with its thumb hard against the left, PUSH end. A thumb half as long as the slot looks halfway; the words "long slot" make it stretch across the top | "the thumb touches the left end of the slot" |
| **Orange button:** dead centre on top, and the biggest thing there | "the orange button lines up with the middle of the screen below it" and "the orange button is twice the size of the volume knob" |
| **Knobs:** three only: a small volume knob on top, a big one on each side | "only three knobs in total" |
| **Light:** one, to the left of the screen | "no light on the right of the screen" |
| **Antenna:** none. The FM antenna is a wire hidden in the strap | "no antenna" again, at the end |

## Prompt 2: blueprint

A technical sheet: four views, the games board position, and the parts inside shown dashed. Numbered callouts, with the key below, so garbled labels don't matter.

```
Use the attached image as the reference for the radio. Draw exactly the same radio as a technical blueprint, keeping every part, its position and its proportions as in the reference: the long, low case; on top, the small slide switch on the left with its thumb at the left end, the large round push button in the centre and the small volume knob on the right; the large ribbed knob on each side; the screen above the speaker grille on the front; and the narrow shoulder strap with its buckle, fixed to a ring at the upper corner of each side panel. Do not redesign the radio, and do not add, remove or move any part. Change only the style and the views, as described here. Fine white lines on deep blueprint blue paper with a faint white grid, in the style of a mid-century engineering drawing, with no colour and no photograph. Five views laid out neatly on one sheet: front view, top view, left side view, right side view, and a fifth view of the radio lying on its back with the screen facing up and the strap laid flat behind. The strap is drawn rising above the radio and broken off with a wavy break line to show it continues. Four small rubber feet under the base and four more on the back panel. In the front view, hidden internal parts are drawn in dashed lines: a circuit board behind the screen, a round speaker behind the grille, a flat battery at the bottom, and a thin antenna wire running up into the strap. Dimension lines with arrowheads and millimetre figures: 220 wide, 125 tall, 80 deep, 40 for the push button, 40 for each side knob and 25 for the volume knob. Ten small numbered circles, 1 to 10, with thin leader lines pointing to parts. A plain title block in the bottom right corner. The screens in the drawing are blank. No other text, no brand logos. Clean, precise, high detail. Aspect ratio 16:9.
```

**Key to the numbers.**

| No. | Part | Job |
| --- | --- | --- |
| 1 | PUSH / OPEN slide switch | Push-to-talk or hands-free |
| 2 | Orange button | Hold to talk, in every mode. A quick tap ends your turn on the chess clock |
| 3 | Volume knob | Turn for volume, press to pause |
| 4 | Mode knob (left side) | Talk, Radio (FM), Radio (Internet), Play. Left controller on its back |
| 5 | Select knob (right side) | Who, which station, which game. Right controller on its back |
| 6 | Screen | Type still to be chosen |
| 7 | Speaker | Voice and radio |
| 8 | Status light | Colour for talk and listen |
| 9 | Shoulder strap | Adjustable; hides the FM antenna |
| 10 | Rubber feet | Under the base and on the back: hold it steady upright and as a games board |

## Prompt 3: chess clock in a rest home

Close and low, at table height. The radio stands upright beside the board and Pop ends his turn by pressing the orange button with his palm. The radio is the hero; the players are hands and cardigans.

```
Use the attached image as the reference for the radio. Show exactly the same radio, identical in every detail: the same matte sage green case with the same long, low shape and proportions; on top, the same small PUSH / OPEN slide switch set to PUSH on the left, the same large orange button in the centre and the same small black volume knob on the right; the same large black ribbed knob on each side; the same screen, speaker grille and single green status light on the front; and the same narrow cream fabric shoulder strap with its metal buckle and rings. Do not redesign the radio, and do not add, remove or move any part. Change only the scene, the camera angle and what the screen shows, as described here. Close-up photograph at table height, low camera angle, of the radio being used as a chess clock in a rest home lounge. A wooden chessboard mid-game on a small round table. In front of the board, between the two players, the radio stands upright, the right way up, on its base, exactly as it stands in the reference image: not lying down, not on its back and not on its side. Its front face, with the screen above the speaker grille, faces the camera, and the orange button is on top. Its strap lies in loose loops on the table beside it. The screen is the right way up and shows two large clock times side by side, "14:52" on the left and "09:07" on the right, with a small black triangle under the right-hand time. No tabs and no other text on the screen. Two elderly players sit either side of the table, seen only from the chest down: on the left an elderly man in a grey knitted cardigan with a tartan blanket over the knees, on the right a player in a navy jumper. The man on the left reaches over and presses the large orange button on top of the radio with the flat palm of his wrinkled hand, fingers relaxed, the way a chess player slaps a clock; the orange button is half hidden under his palm. The right-hand player's hand rests beside a captured pawn. No faces visible. Soft out-of-focus background of armchairs, a window with net curtains and a tea trolley. Warm afternoon daylight, shallow depth of field, sharp focus on the radio and the hand pressing the orange button. Aspect ratio 3:2.
```

## Prompt 4: Pong, from the player's seat

First person, looking down at the radio on its back, one hand on each side knob.

```
Use the attached image as the reference for the radio. Show exactly the same radio, identical in every detail: the same matte sage green case with the same long, low shape and proportions; on top, the same small PUSH / OPEN slide switch set to PUSH on the left, the same large orange button in the centre and the same small black volume knob on the right; the same large black ribbed knob on each side; the same screen, speaker grille and single green status light on the front; and the same narrow cream fabric shoulder strap with its metal buckle and rings. Do not redesign the radio, and do not add, remove or move any part. Change only the scene, the camera angle and what the screen shows, as described here. First-person photograph looking down from the player's eyes at the radio lying flat on its back on a kitchen table, being used as a simple games console. The front face points up, with the screen in the half further from the viewer and the speaker grille in the half nearest the viewer. The top edge of the radio, with the switch, the orange button and the volume knob, points away from the viewer. The strap lies in loose loops on the table beyond it. An older person's two hands, with slightly wrinkled skin and a plain wristwatch on the left wrist, grip the two side knobs, one hand on each, fingers wrapped around the ribs, mid-turn. The screen shows a simple black-and-white Pong game: a short vertical paddle at the left edge, another at the right edge, a small square ball mid-flight with slight motion blur, a dotted line down the centre, and the scores "3" and "2" in large blocky digits at the top. No tabs and no other text on the screen. Warm kitchen in the soft out-of-focus background. Natural morning light, shallow depth of field. Aspect ratio 4:5.
```

## Prompt 5: Radio (FM) on the screen

The screen in FM mode, close up, with a hand on the Select knob.

```
Use the attached image as the reference for the radio. Show exactly the same radio, identical in every detail: the same matte sage green case with the same long, low shape and proportions; on top, the same small PUSH / OPEN slide switch set to PUSH on the left, the same large orange button in the centre and the same small black volume knob on the right; the same large black ribbed knob on each side; the same screen, speaker grille and single green status light on the front; and the same narrow cream fabric shoulder strap with its metal buckle and rings. Do not redesign the radio, and do not add, remove or move any part. Change only the scene, the camera angle and what the screen shows, as described here. Close-up product photograph, straight-on front view, of the radio standing upright on a kitchen bench, framed tightly on its screen with the right-hand side knob in view and the speaker grille partly in frame. An older person's fingers are turning the right-hand side knob. The screen keeps the same row of four tabs across the top, "TALK", "FM", "NET" and "PLAY", but now the "FM" tab is highlighted as white letters on a solid black block and the other three tabs are plain black letters; below the tabs, the words "CHANNEL 1" in very large bold letters; below that, "98.2 MHz" in medium letters; and along the bottom edge, a thin horizontal tuning scale with a small black marker about halfway along. No other text on the screen, no station names, no list of names. Clean, legible, high contrast screen layout. Soft daylight, shallow depth of field, sharp focus on the screen. Aspect ratio 4:5.
```

## Prompt 6: the Talk list on the screen

The screen in Talk mode, close up, with the orange button on top in view.

```
Use the attached image as the reference for the radio. Show exactly the same radio, identical in every detail: the same matte sage green case with the same long, low shape and proportions; on top, the same small PUSH / OPEN slide switch set to PUSH on the left, the same large orange button in the centre and the same small black volume knob on the right; the same large black ribbed knob on each side; the same screen, speaker grille and single green status light on the front; and the same narrow cream fabric shoulder strap with its metal buckle and rings. Do not redesign the radio, and do not add, remove or move any part. Change only the scene, the camera angle and what the screen shows, as described here. Close-up product photograph, three-quarter view from slightly above, of the radio standing upright on the same wooden bedside table, framed closely on its screen and its top surface, with the speaker grille partly in frame and the lamp and mug out of focus behind. The screen keeps the same row of four tabs across the top, "TALK", "FM", "NET" and "PLAY", with the "TALK" tab highlighted as white letters on a solid black block; below the tabs, the same list of three names in large bold letters, one per row: "CHRIS", "FAMILY", "NURSE". Now the "CHRIS" row is selected, shown as white letters on a solid black bar, with a small filled dot beside it, and the "FAMILY" row is plain black letters. No other text on the screen. Clean, legible, high contrast screen layout. Soft warm indoor light, shallow depth of field, sharp focus on the screen and the orange button. Aspect ratio 4:5.
```

## Prompt 7: carried under an arm

The radio on the move, strap over the shoulder and the radio tucked under the arm. The focus is the radio and the strap; the person is a cardigan and a hand.

```
Use the attached image as the reference for the radio. Show exactly the same radio, identical in every detail: the same matte sage green case with the same long, low shape and proportions; on top, the same small PUSH / OPEN slide switch set to PUSH on the left, the same large orange button in the centre and the same small black volume knob on the right; the same large black ribbed knob on each side; the same screen, speaker grille and single green status light on the front; and the same narrow cream fabric shoulder strap with its metal buckle and rings. Do not redesign the radio, and do not add, remove or move any part. Change only the scene, the camera angle and what the screen shows, as described here. Close-up lifestyle photograph of the radio being carried while someone walks along a sunny hallway. Framed from the shoulder to the hip, no face visible. The strap runs over the person's left shoulder, and the radio hangs at their side, tucked snugly under their left arm, with their hand cupping its bottom corner and its front face turned towards the camera. The strap's weave, stitching and buckle are shown clearly. The screen is unchanged from the reference: the "TALK" tab highlighted, and the list "CHRIS", "FAMILY", "NURSE" with "FAMILY" selected. No other text on the screen. The person wears a soft oatmeal knitted cardigan with the sleeve pushed up a little. Sharp focus on the radio and the strap, the hallway behind softly blurred. Warm natural daylight, shallow depth of field. Aspect ratio 4:5.
```

**Variations worth trying.** All of these start from the reference picture. For a message playing, ask for the same bedside scene with "LISTENING" in large letters below the tabs and the status light red. In prompt 4, add a second pair of younger hands holding the right knob for two-player Pong with a grandchild. In prompt 4, swap Pong for a pinball table, with one hand pressing each side knob as flippers. For a cutaway, add "exploded view showing the circuit board, speaker, battery and antenna wire floating apart above the case" to prompt 2.

## Prompt 8: the plywood box plan

The plywood case as a flat pack: every panel cut and laid out, before any glue. It needs no reference picture, because it shows panels, not the radio. The numbered tags have a key below, so garbled labels don't matter.

```
Top-down flat lay product photograph, knolling style, of the parts of a flat-pack plywood radio case, neatly arranged on a matte light grey workbench mat. Soft even studio lighting, sharp focus, no hands, generous spacing. All the wooden parts are pale birch plywood, 6 mm thick, freshly cut, with clean visible ply layers on every edge and square finger joints, like evenly spaced teeth, along the edges where panels meet. Exactly nine items, each with a small white round numbered tag (1 to 9) placed beside it:

1. A front panel, a landscape rectangle about 220 x 125 mm. In its upper half, centred, one wide rectangular window about 140 x 50 mm, a long landscape shape nearly two-thirds the width of the panel. In its lower half, a wide speaker grille made of a neat grid of small round holes. One tiny round hole, about 5 mm across, to the left of the window. No other holes in this panel.
2. A back panel, a plain landscape rectangle about 220 x 125 mm, with a small countersunk screw hole in each corner and one small rounded slot near the bottom edge. No other holes in this panel.
3. A top panel, a long narrow rectangle about 220 x 80 mm, with exactly three openings in a row along its length: on the left, a short narrow slot about 20 mm long and 6 mm wide, running left to right; exactly in the centre, one large round hole about 40 mm across; on the right, one small round hole about 8 mm across. No other holes in this panel.
4. A bottom panel, a plain long narrow rectangle about 220 x 80 mm, with one small hole near each corner, four in total. No other holes in this panel.
5. A left side panel, a small rectangle about 125 x 80 mm, with exactly two holes: one round hole about 8 mm across in the middle of its upper half, and one tiny hole about 4 mm across close to the top edge. No other holes in this panel.
6. A right side panel, identical to the left side panel.
7. Small printed plastic parts in a row: one round orange button cap about 40 mm across, two large black deeply ribbed knobs about 40 mm across, and one small black ribbed knob about 25 mm across.
8. A small pile of fittings: eight small brass wood screws, four round black rubber feet, and two small steel rings.
9. A folded narrow cream woven fabric strap with a metal slide buckle.

Beside the panels, at the edge of the mat, a small bottle of wood glue, a folded sheet of sandpaper and a short steel ruler. Warm, clean, craft workshop catalogue look, realistic scale between parts. Each panel has exactly the holes described and no others. No electronics, no circuit boards, no wires, no assembled box, no text or logos on any part, no burn marks. Aspect ratio 16:9.
```

**With names instead of numbers.** Swap the tag sentence for: "each with a small white printed label beside it reading its name in clean black sans-serif capitals", and use these names: FRONT, BACK, TOP, BOTTOM, LEFT SIDE, RIGHT SIDE, BUTTON AND KNOBS, FITTINGS, STRAP.

**Key to the numbers.**

| No. | Part | What the holes are for |
| --- | --- | --- |
| 1 | Front panel | The screen window, the speaker grille and the status light |
| 2 | Back panel | Screws on, so the boards, speaker and cell go in last. The slot is for USB-C |
| 3 | Top panel | The PUSH / OPEN switch, the orange button and the volume knob |
| 4 | Bottom panel | Four rubber feet |
| 5 | Left side panel | The Mode knob, and a strap ring |
| 6 | Right side panel | The Select knob, and a strap ring |
| 7 | Button cap and knobs | 3D printed, with either case |
| 8 | Screws, feet and strap rings | |
| 9 | Shoulder strap | The FM aerial runs inside it |

**Getting the holes right.** Generators add holes and move them. Check each panel against the key: the front has one wide window, a grille and one tiny hole; the top has a slot, a big hole and a small hole in a row; each side has two holes. If one panel is wrong, name it at the end: "the top panel has exactly three openings".

**As a drawing instead.** For a plan to print, swap the first sentence for: "A clean technical cutting plan on white paper, drawn in thin black lines, showing six flat panels laid out as they would be cut from one sheet of plywood, each with its width and height marked by dimension lines." Generators garble the numbers, so use it as a picture of a plan, not as the plan. The real cutting file comes from the board and case drawings.

## Prompt 9: the finished plywood radio

The same radio in the same bedside scene, with a plywood case. Attach the prompt 1 picture. This is the one prompt that does change the radio, so it says exactly what changes and what does not.

```
Use the attached image as the reference for the radio and the scene. Show the same radio in the same place, with every control in the same position and at the same size: on top, the same small PUSH / OPEN slide switch set to PUSH on the left, the same large orange button in the centre and the same small black volume knob on the right; the same large black ribbed knob on each side; the same single green status light to the left of the screen; and the same narrow cream fabric shoulder strap with its metal slide buckle, fixed at each end to a small metal ring at the upper corner of each side panel, close to the top edge, exactly where it is in the reference image. The strap is never fixed low down or at the bottom of the case, and has no clasp or hinge. Do not add, remove, restyle or move any control. Change only the case, as described here. The case is now a box made of pale birch plywood, 6 mm thick, instead of green plastic: the same long, low shape, about 220 mm wide, 125 mm tall and 80 mm deep, but with flat faces and square edges, the corners only lightly sanded round. Square finger joints, like evenly spaced interlocking teeth, show clearly along every edge where two panels meet, with the darker ply layers visible on the end grain. The wood has a soft oiled satin finish with a fine natural grain, not varnished and not glossy. The switch on top is exactly the reference image's small smooth slide switch: a short slot about 20 mm long running left to right, with a small raised oval thumb sitting hard against its left end, the word "PUSH" engraved in small dark capitals just in front of its left end and "OPEN" just in front of its right end. It is not a toggle, not a rocker and not a lever, and the two words sit side by side, not one above the other. On the front face, in the upper half, the screen is exactly the reference image's screen, the same size and in the same place: a wide paper-like reflective black-and-white screen about 140 mm wide and 50 mm tall, nearly two-thirds the width of the front, with a warm light grey background and crisp black text, sitting behind a neat wide rectangular window cut in the plywood. It is not a small display, not glowing, not blue and not white text on black. Apart from the screen window, the speaker grille and the one small status light, there are no other holes, sensors or lenses in the front panel. Below the screen the speaker grille is a neat grid of small round holes drilled straight through the wood. The orange button, the black knobs and the black slide switch stand out against the pale wood. Four small black rubber feet under the base. It looks carefully handmade from a kit, sturdy and warm, like a small piece of furniture. The same wooden bedside table, reading lamp with a warm glowing shade and ceramic mug of tea, the same soft warm evening lamp light and shallow depth of field. The screen shows exactly what the reference image shows: across the top, a row of four small evenly spaced tabs reading "TALK", "FM", "NET" and "PLAY" from left to right, with the "TALK" tab highlighted as white letters on a solid black block; below the tabs, a list of three names in large bold letters, one per row: "CHRIS", "FAMILY", "NURSE", with the "FAMILY" row shown as white letters on a solid black bar. No other text on the screen: no clock, no numbers, no battery symbol. No antenna, no keypad, no other buttons, switches or lights, no brand logos, no burn marks, no visible glue. Aspect ratio 4:5.
```

**Getting the plywood right.** The first try came out with a small glowing screen, a toggle switch, two extra holes beside the screen and the strap fixed low on the sides, so the prompt now spells each of those out. Check them first; if one is still wrong, generate again with only that sentence moved to the end. If the case comes out as solid timber, add "plywood, with thin layers visible on every edge". If the corners come out rounded like the plastic case, add "square edges, flat panels". If the joints vanish, add "box joints visible on every corner". For a pair, ask for "the green plastic radio and the plywood radio side by side on the same table".

## Prompt 10: the back off

The radio opened up, for the [tinkerer's page](https://popsradio.chrisbarlow.nz/tinker.html). Attach two pictures, in this order:

1. **The radio:** the prompt 1 bedside picture, `images/platform-bedside.jpg`. It fixes what the outside looks like.
2. **The parts:** `images/parts-custom-board.jpg`. It fixes what goes inside: the boards, the cables, the mesh card, the speaker and the cell.

The numbered callouts have a key below.

```
Two images are attached. The first image is the reference for the outside of the radio. The second image is the reference for the parts inside it: a flat lay of circuit boards and parts on a grey mat, with numbered tags.

Show the radio from the first image from behind, with its back panel taken off. Keep its outside exactly as in the first image: the same matte sage green case with the same long, low shape, about 220 mm wide, 125 mm tall and 80 mm deep; the same large orange button, small slide switch and small black volume knob on top; the same large black ribbed knob on each side; and the same narrow cream fabric shoulder strap, fixed to a metal ring at the upper corner of each side panel and lying in loose loops on the bench. Do not redesign the outside of the radio. No lettering is readable on the top from this angle.

Product photograph, three-quarter rear view, on a wooden workbench in soft daylight. The radio stands upright with its back open towards the camera, like a box with one side removed, so the inside is clearly visible and well lit. The removed back panel, a flat sage green rectangle with a screw hole in each corner, lies flat on the bench in front of the radio with four small screws on it and a small screwdriver beside it.

Inside the case, fit the parts from the second image, drawn exactly as they look there, tidy and uncluttered, with plenty of empty space around them:

- The large main circuit board from the second image (its item 1) is fixed upright against the inside of the front wall on four short posts, with the green cylindrical battery from the second image (its item 10) sitting in the holder along its bottom edge. The main board carries only one metal-shielded module.
- The long narrow board from the second image (its item 2) is fixed flat under the top of the case, beneath the orange button.
- One of the two small square boards from the second image (its items 3 and 4) sits behind each side knob.
- The three flat white cables from the second image (its item 5) run neatly from the main board, one to the top board and one to each side board. Three cables only.
- The small green card with the metal-shielded module from the second image (its item 11) is plugged into the first card bay on the main board, standing just proud of it. The second card bay is empty.
- The round loudspeaker from the second image (its item 9) is fixed to the inside of the front wall beside the main board.

Do not show the grey mat, the white line or any numbered tag from the second image. Do not show its items 6, 7, 8, 12 or 13.

On the inside of the floor of the case, a neat grid of small round screw posts, moulded in the same green plastic, with nothing fixed to them. On the outside of the short side panel nearest the camera, low down, two small USB-C ports side by side, and high on the same panel one small gold threaded antenna socket with no antenna screwed on.

Six small white round numbered tags, 1 to 6, each number used exactly once, each sitting right beside the thing it names: 1 beside the main board; 2 beside the card plugged into the first bay; 3 beside the empty second bay; 4 beside the two tiny white sockets on the main board; 5 beside the grid of screw posts; 6 beside the two USB-C ports. No other numbers anywhere.

No loose wires, no tangle, no soldering iron, no hands, no faces, no text on the boards, no brand logos. It looks deliberately easy to work on, like a well-made kit. High resolution, at least 2000 pixels wide. Aspect ratio 3:2.
```

**Key to the numbers.**

| No. | Part | What it is for |
| --- | --- | --- |
| 1 | Main board | The base: Talk, FM, Wi-Fi and Bluetooth keyboards |
| 2 | A card in bay 1 | The mesh card |
| 3 | Empty bay 2 | For the 4G card, or any Click card |
| 4 | Two sensor sockets | Plug-in sensors on a cable |
| 5 | Screw posts | Somewhere to fix what you add |
| 6 | Two USB-C ports, with an antenna socket above them | Power, and Data. The socket takes a screw-on 4G antenna |

**The picture on the site.** Made from an earlier version of this prompt, with one reference picture, on 16 November 2026 and saved as `images/radio-open.jpg`. Its tags came out differently from the key above (two 2s, and 1 on the case corner), so the tinkerer's page has its own key written to match the picture. It also shows the mesh radio on the main board and leaves out the strap, which is why the prompt now takes the parts picture as a second reference.

**Getting the inside right.** Generators fill an open case with wires. If it comes out cluttered, add "almost empty inside, three flat cables only". If the outside changes, add "the outside of the radio matches the first image exactly". If the grey mat or the flat lay appears, add "the second image is only a guide to what the parts look like; none of its layout appears in the picture". To show the hotspot, add "the second green card from the second image, its item 12, is plugged into the second bay, and its black whip antenna is screwed onto the gold socket on the side". For the plywood version, attach `images/plywood-radio.jpg` as the first image instead.

## Prompt 11: the plug-in cards

*Not made. We decided to leave this picture off: the cards already show in the custom board picture. The prompt is kept in case it is wanted later.*

The cards and sensors on their own, laid out like the parts pictures. It needs no reference picture. The numbered tags have a key below.

```
Top-down flat lay product photograph, knolling style, of small plug-in electronics cards neatly arranged on a matte light grey workbench mat. Soft even studio lighting, sharp focus, no hands, no tools, generous spacing. Exactly seven items, each with a small white round numbered tag (1 to 7) placed beside it:

1. A small dark green card, about 57 x 25 mm, with a row of 8 gold pins along each long edge, carrying one small silver metal-shielded module and one tiny round gold antenna socket. Beside it, a short black stubby rubber antenna, about 50 mm long, on a thin grey cable with a tiny gold connector.
2. A second dark green card of exactly the same size and shape, with a row of 8 gold pins along each long edge, carrying one larger flat silver metal-shielded module and a small metal SIM card holder. Beside it, a short thin grey cable ending in a gold threaded antenna socket with a hex nut, a black screw-on whip antenna about 110 mm long with a hinged elbow and a gold threaded base, and one small SIM card.
3. A third card of the same size and shape but red, with a row of 8 gold pins along each long edge, carrying a few small black chips.
4. A tiny square red sensor board, about 25 x 25 mm, with one small black chip and a tiny white socket on two opposite edges.
5. A second tiny square sensor board, about 25 x 25 mm, purple, with a small silver sensor in its centre and a tiny white socket on two opposite edges.
6. Two short thin cables, each of four coloured wires (black, red, blue, yellow) about 100 mm long, with a small white plug on each end, laid side by side.
7. A coin-sized round circuit board, about 40 mm across, matte black with a simple gold pattern and four small LEDs, with a small black 2 x 3 pin plug on its back edge.

Above the cards, at the top of the mat, one empty socket for scale: a small piece of dark green circuit board carrying a pair of short black 8-pin socket strips standing parallel about 23 mm apart. Clean technical catalogue look, realistic scale between parts, neutral colours. Cards 1, 2 and 3 are clearly the same size and shape as each other. No loose wires other than the two cables, no soldering iron, no text or part numbers on any board, no brand logos. Aspect ratio 16:9.
```

**With names instead of numbers.** Use: MESH CARD, 4G CARD, CLICK CARD, TILT SENSOR, SENSOR, CABLES, BADGE ADD-ON.

**Key to the numbers.**

| No. | Part | Where it goes |
| --- | --- | --- |
| 1 | Mesh card and antenna | Card bay 1 |
| 2 | 4G card, antenna socket, screw-on antenna and SIM | Card bay 2. The socket fits a hole in the case; the antenna screws on outside |
| 3 | Someone else's Click card | Either card bay |
| 4 | Tilt sensor | A sensor socket |
| 5 | Another plug-in sensor | A sensor socket, or chained from the first |
| 6 | Sensor cables | Between a sensor socket and a sensor |
| 7 | A badge add-on | The badge socket |

**Getting the cards right.** The three cards must match in size: that is the point of a standard bay. If they differ, add "three identical card outlines, different parts on each". Our own cards are not designed yet, so the parts on them are the generator's guess.

## Fallback: no reference picture

If your tool cannot take a picture as a reference, each prompt has to describe the radio itself. Prompts 8 and 11 need no reference. In prompts 2 to 7, delete everything from "Use the attached image" to "as described here." and paste this in its place. Results will match less closely than with a reference picture.

```
The radio: a stout rectangular tabletop radio in matte sage green plastic with softly rounded edges: a long, low, landscape shape, about 220 mm wide, 125 mm tall and 80 mm deep, like a classic portable transistor radio. The front face is clearly much wider than it is tall, nearly twice as wide, and never square. The case is one plain shape with straight sides all the way down: no flared base, no plinth, no skirt, no foot. A long, narrow, adjustable woven cream fabric shoulder strap, only about 20 mm wide, long enough to wear over the shoulder, with a metal slide buckle for adjusting its length, fixed at each end to a small metal ring at the upper corner of each side panel; not a short handle. Front face: in the upper half, a paper-like reflective black-and-white screen about 140 mm wide and 50 mm tall, a wide landscape shape, with a warm light grey background and crisp black text, lit by a soft warm front light; in the lower half, a wide perforated speaker grille. Top surface, from left to right: a small, compact smooth slide switch: a short slot only about 20 mm long, half the width of the orange button, with the word "PUSH" printed in small white capitals just in front of its left end and "OPEN" just in front of its right end. The slider thumb is a small raised oval about 8 mm long, sitting hard against the far left end of the slot, directly behind the word "PUSH"; the rest of the slot, to the right of the thumb, is an empty dark groove. The switch is clearly set to PUSH, not in the middle; exactly in the centre of the top surface, midway between the left and right edges, with the switch to its left and the volume knob to its right, one very large domed orange arcade-style push button about 40 mm wide, the biggest and brightest control on the radio; and a small black ribbed volume knob about 25 mm across, clearly smaller than the orange button. One large black ribbed rotary knob sticks out from each side panel, left and right, level with the screen, each about 40 mm across and 25 mm deep, with deep finger grips like a vintage radio tuning knob and a white pointer line on the face. One small status light glowing green, to the left of the screen only. Only three knobs in total. No antenna, no keypad, no other buttons, switches or lights, no brand logos.
```
