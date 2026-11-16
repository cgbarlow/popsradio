# Walkie-Talkie Image Prompts

Nov 14, 2026 · @Chris Barlow · updated Nov 16, 2026

Prompts for an image generator. Prompts 1a and 1b are a matching pair: every part of the radio as separate modules, and the same radio on one custom board, so the two pictures can sit side by side. Prompts 2a to 2d are the three earlier shapes. Prompts for the radio itself are in [Pop's Radio Platform Image Prompts](Pop's%20Radio%20Platform%20Image%20Prompts.md).

## How to use

Paste one prompt at a time. Each is self-contained, so the generator needs no other context.

- **A matching pair.** 1a and 1b describe the same mat, light and camera, so they match without a reference picture. Do not attach 1a to 1b. They are saved as `images/parts-modules.jpg` and `images/parts-custom-board.jpg`, with `_sml` copies 1000 px wide, and are on the site's front page. Prompt 1b changed on 16 November 2026, when the board went modular; 1a did not, since a hand-wired radio has always been loose parts.
- **Labels.** Image generators often garble small text. Prompts 1a and 1b ask for numbered tags and give the key below, so a wrong label does not matter. Prompt 1b does the same. If your generator handles text well, use the "with names" line instead.
- **Boards have no readable text.** Both prompts ask for plain boards with no logos or part numbers, because generators invent them.
- **There is an antenna now, but only in the parts pictures.** The mesh radio needs a 915 MHz antenna, so 1a and 1b show one. It is meant to sit inside the case, so the pictures of the finished radio still say "no antenna". Whether it can stay inside is a range test still to do.
- **Aspect ratio.** 16:9 for the parts pictures, 4:5 for the shapes. Change the last line of each prompt if your tool sets this elsewhere.
- **The earlier shapes.** Prompts 2a to 2d repeat the same five features (big orange button, knob, small screen, speaker grille, PUSH / OPEN toggle switch), so the three results stay comparable. They work over Wi-Fi only, so they say "no antenna". Generators love adding one.

## Prompt 1a: every part, as modules

The radio as it is built in Stage 2a: breakout modules joined by hand. The parts follow the module build in the [cost-down report](../reports/Custom%20PCB%20and%20cost-down.md#what-it-costs-from-modules-today), with the empty battery holder. The speaker and the battery cell are sold separately, so they sit off to one side, apart from the kit. The case is left out: it has its own pictures.

```
Top-down flat lay product photograph of electronic hobby parts, neatly arranged in a grid (knolling style) on a matte light grey workbench mat. Soft even studio lighting, sharp focus, no hands, no tools, generous spacing between parts. Exactly eighteen items in three rows of six on the left three-quarters of the mat, each with a small white round numbered tag (1 to 18) placed beside it:

1. A small green ESP32-S3 microcontroller dev board, about 60 x 25 mm, with two USB-C ports, a silver metal radio shield and two rows of gold header pins.
2. A tiny round purple microphone breakout board, about 15 mm across, with one small silver MEMS microphone and six pins.
3. A small blue amplifier breakout board, about 18 x 18 mm, with a green two-pin screw terminal.
4. A large round orange arcade-style push button, 30 mm wide, with a black threaded body and nut.
5. A rotary encoder with a metal shaft on a small black board, with a large black deeply ribbed knob, 40 mm across, beside it.
6. A second identical rotary encoder on a small black board, with a second identical large black ribbed knob, 40 mm across, beside it.
7. A third rotary encoder on a small black board, with a small black ribbed knob, 20 mm across, beside it.
8. A 2.4 inch display module, a black glass rectangle about 60 x 43 mm on a red board with a row of pins, switched off.
9. A tiny green FM radio module, about 11 x 11 mm, a bare board with gold half-holes along two edges.
10. A neat coil of thin black insulated wire, about 75 cm long, with one stripped end.
11. A tiny purple accelerometer breakout board, about 12 x 12 mm, with one small black chip and a row of pins.
12. A small dark green radio module shaped like a postage stamp, about 18 x 17 mm, with a silver metal shield, gold half-holes along its edges and one tiny round gold antenna socket.
13. A short black stubby rubber antenna, about 50 mm long, joined to a thin grey cable with a tiny gold connector on the end.
14. An empty black plastic holder for one cylindrical battery, with a metal spring contact at one end.
15. A small blue USB-C battery charger board, about 25 x 17 mm.
16. A small black slide switch with a short flat thumb tab.
17. One red LED and two clear LEDs, each with two long legs.
18. A tan perforated prototyping board, about 70 x 50 mm, and a small coil of thin multi-coloured hookup wire.

On the right quarter of the mat, set well apart from the grid behind a thin white line, two items sold separately, each with a numbered tag (19 and 20):

19. A round black 57 mm loudspeaker with a paper cone, metal frame, and two short red and black wires.
20. One green cylindrical 18650 lithium cell, 65 mm long and 18 mm across.

Clean technical catalogue look, realistic scale between parts, neutral colours. No case or enclosure, no extra components, no text or part numbers printed on any board, no brand logos. Aspect ratio 16:9.
```

**With names instead of numbers.** Swap the tag sentence for: "each with a small white printed label beside it reading its name in clean black sans-serif capitals", and use these names: ESP32-S3 BOARD, MICROPHONE, AMPLIFIER, TALK BUTTON, MODE KNOB, SELECT KNOB, VOLUME KNOB, SCREEN, FM TUNER, FM AERIAL, TILT SENSOR, MESH RADIO, MESH ANTENNA, BATTERY HOLDER, CHARGER, PUSH OPEN SWITCH, LIGHTS, BOARD AND WIRE; and, set apart, SPEAKER, BATTERY.

**Key to the numbers.**

| No. | Part | Job | About NZ$ |
| --- | --- | --- | --- |
| 1 | ESP32-S3 dev board, N16R8 | The brain: Wi-Fi, voice coding, encryption, the screen and games | 10 |
| 2 | I2S microphone breakout (INMP441) | Hears you | 6, with the amplifier |
| 3 | I2S amplifier breakout (MAX98357A) | Drives the speaker | |
| 4 | Big push button | Hold to talk | 5, with the switch and lights |
| 5 | Encoder and large knob | Mode: Talk, FM, internet radio or Play | 7.50 for all three |
| 6 | Encoder and large knob | Select: who, which station, which game | |
| 7 | Encoder and small knob | Volume | |
| 8 | 2.4 inch TFT screen, 320 × 240 | Names, stations and Pong | 8 |
| 9 | FM module (RDA5807M) | Ordinary FM radio, with no internet | 2 |
| 10 | FM wire aerial, about 75 cm | Runs through the shoulder strap | With the FM module |
| 11 | Accelerometer breakout | Knows upright from lying on its back | 2 |
| 12 | Mesh radio stamp (Heltec HT-CT62) | The always-on mesh: Meshtastic on its own chip | 14 |
| 13 | 915 MHz antenna with pigtail | The mesh radio's antenna | A few dollars; not in the report's module total |
| 14 | 18650 holder, empty | Holds the cell | With the charger |
| 15 | USB-C charger board | Charges the cell | 3.20, with the holder |
| 16 | Slide switch | PUSH or OPEN | With the button |
| 17 | Red LED and two RGB LEDs | Red whenever the microphone can hear; colours for talk and listen | With the button |
| 18 | Proto board and hookup wire | Joins it all up, by hand | 3 |
| 19 | Speaker, 4 ohm 3 W | Loud enough for Pop, and for music | Sold separately; not in the report's total |
| 20 | 18650 cell | Power off the stand | Sold separately; about 12.50 |

About NZ$61 for parts 1 to 18, and two to three hours of soldering. The speaker (19) and the cell (20) are sold separately. Prices are from the cost-down report and are list prices and estimates, not quotes.

## Prompt 1b: the same radio on one custom board

The radio as it is built in Stage 2b and sold as a kit: a base that opens up, with plug-in cards. It stands on its own: no reference picture is needed, and attaching 1a made things worse by leaking its loose parts into the picture. It describes the same mat, light and camera as 1a in words, so the two pictures still compare. The base kit is on the left. The things sold separately sit off to one side: the speaker, the battery cell, and the plug-in cards. The case is left out: it has its own pictures.

```
Top-down flat lay product photograph, knolling style, shot straight down from directly above. A matte light grey silicone workbench mat with rounded corners fills the frame, on a pale grey desk. Soft, even, shadowless studio lighting, sharp focus edge to edge, no hands, no tools, generous spacing between parts. A thin white line runs from top to bottom of the mat, two-thirds of the way across, dividing it into a wide left area and a narrow right column.

A small plain white round paper tag, about 12 mm across, sits just below each item, with one clear black handwritten number on it. There are exactly thirteen tags, numbered 1 to 13. Each number is used exactly once: no number is repeated and none is missing. The tag numbers match the numbers in the lists below.

In the left area, exactly eight items, tagged 1 to 8, and nothing else. They are a mock-up of a custom electronics kit in matte dark green circuit board with gold pads and neat rows of tiny black and grey surface-mounted parts, all machine-assembled, with no loose wires:

1. One main circuit board, about 110 x 80 mm, dark green, with a rounded corner cut-out at each mounting hole. On it: one silver metal-shielded square module in the top left corner; a few small black square chips; two USB-C sockets side by side on the right edge; a row of three small white cable sockets along the top edge; in the middle of the board, two empty card bays, each one a pair of short black 8-pin socket strips standing parallel about 23 mm apart with bare board between them; two tiny white 4-pin sockets and one small black 2 x 3 pin socket near the left edge; and an empty black holder for one cylindrical battery fixed along the bottom edge. There is only one metal-shielded module on this board.
2. One long narrow circuit board, about 110 x 25 mm, dark green, carrying a small square push switch in the centre, a small black slide switch with a flat thumb tab to its left, a rotary encoder with a short metal shaft to its right, and three tiny LEDs.
3. One small circuit board, about 30 x 30 mm, dark green, carrying a single rotary encoder with a metal shaft.
4. A second identical small circuit board, about 30 x 30 mm, carrying a single rotary encoder with a metal shaft.
5. Exactly three short flat white ribbon cables, each about 80 mm long, with a small white plug on both ends, laid side by side, sharing the single tag 5. Three cables, not four.
6. A 2.4 inch display, a thin black glass rectangle about 60 x 43 mm, switched off, with a short flat orange flexible cable.
7. A neat coil of thin black insulated wire, about 75 cm long, with one stripped end.
8. Four printed parts in one row, close together, sharing the single tag 8: a round orange 3D printed button cap, 30 mm across; two large black deeply ribbed knobs, 40 mm across; and one small black ribbed knob, 20 mm across.

There are no plug-in cards, no antennas with gold connectors and no sensor boards in the left area.

In the right column, to the right of the white line, exactly five items, tagged 9 to 13, in one tidy column from top to bottom:

9. A round black 57 mm loudspeaker with a paper cone, metal frame, and two short red and black wires.
10. One green cylindrical 18650 lithium cell, 65 mm long and 18 mm across.
11. A small dark green plug-in card, a plain rectangle about 57 x 25 mm, with a row of 8 short gold pins along each of its two long edges and no connectors on its short ends, carrying one small silver metal-shielded module and one tiny round gold antenna socket on its face; beside it, a short black stubby rubber antenna, about 50 mm long, on a thin grey cable with a tiny gold connector. The antenna lies right beside its card, inside the right column.
12. A second small dark green plug-in card with exactly the same rectangular outline, size and pin rows as the card above it, carrying one larger flat silver metal-shielded module and a small metal SIM card holder; beside it, a short thin grey cable ending in a gold threaded antenna socket with a hex nut, and a black screw-on whip antenna about 110 mm long with a hinged elbow and a gold threaded base.
13. A tiny square blue sensor board, about 25 x 25 mm, with one small black chip, joined to a short thin cable of four coloured wires with a small white plug on each end.

Clean technical catalogue look, realistic scale between parts, neutral colours. The four circuit boards in the left area look like finished factory-made products of one matching set. No case or enclosure, no breadboard, no perforated board, no hookup wire, no solder, no text or part numbers on any board, no writing other than the thirteen tag numbers, no brand logos. High resolution, at least 2000 pixels wide. Aspect ratio 16:9.
```

**With names instead of numbers.** Swap the tag sentences for: "A small white printed label sits just below each item, reading its name in clean black sans-serif capitals", and use these names: MAIN BOARD, TOP BOARD, MODE BOARD, SELECT BOARD, CABLES, SCREEN, FM AERIAL, BUTTON AND KNOBS; and, in the right column, SPEAKER, BATTERY, MESH CARD, 4G CARD, TILT SENSOR.

**If the numbers come out wrong.** Earlier tries repeated some numbers and dropped others. If that happens again, the wrong tags can be painted over and renumbered afterwards, as long as the items themselves are in the right places.

**Key to the numbers.**

| No. | Part | What is on it | In the kit |
| --- | --- | --- | --- |
| 1 | Main board | ESP32-S3 module, audio codec and amplifier, FM tuner, charger, two USB-C ports (Power and Data), two empty card bays, two sensor sockets, a badge socket, a pin header and the cell holder | Yes |
| 2 | Top board | The talk switch, the PUSH / OPEN slide switch, the volume encoder, the red microphone light and two status lights | Yes |
| 3 | Mode board | The left-hand encoder | Yes |
| 4 | Select board | The right-hand encoder | Yes |
| 5 | Three cables | Join the small boards to the main board | Yes |
| 6 | 2.4 inch TFT screen | Plugs into the main board | Yes |
| 7 | FM wire | The FM aerial, for the strap | Yes |
| 8 | Button cap and knobs | Small printed parts | With a bought case, or printed from the plans |
| 9 | Speaker | Set apart | No: sold separately |
| 10 | 18650 cell | Set apart. Fits the empty holder on the main board | No: sold separately |
| 11 | Mesh card and antenna | The mesh radio (HT-CT62) on a plug-in card, for card bay 1 | No: sold separately. Fitted in a built radio |
| 12 | 4G card, antenna socket and antenna | A modem and SIM holder on a plug-in card, for card bay 2. The socket fits a hole in the case, and the antenna screws on outside. It also makes the radio a Wi-Fi hotspot | No: sold separately |
| 13 | Tilt sensor | Plugs into a sensor socket on its cable | No: sold separately |

The base is about NZ$44 to make in a batch of 100 and NZ$33 in a batch of 1,000, with no soldering. All four boards are cut from one panel. This is a mock-up: the board is not drawn yet, so the layout in the picture is the generator's guess. The picture on the site was made from this prompt on 16 November 2026.

**Getting 1b right.** Check six things: the tags run 1 to 13 with none repeated; eight items on the left and five on the right; no card, gold-connector antenna or sensor on the left; three cables; the two cards the same shape; and at least 2,000 pixels wide. If it comes out small, look for a size or quality setting in the generator: the prompt cannot force it.

**A single comparison picture.** To get both in one frame, add to the start of 1b: "A split image. The left half shows the same radio as eighteen separate hobby modules, a perforated board and a tangle of coloured hookup wire; the right half shows the kit below." It is harder to get right than two pictures.

## Earlier version of prompt 1: the one-knob build

The picture in `images/parts-layout.jpg` was made from this prompt. It shows the thirteen parts of the first, simpler radio, and is kept for reference.

<details>
<summary>The thirteen-part prompt and its key</summary>

```
Top-down flat lay product photograph of electronic hobby parts, neatly arranged in a grid (knolling style) on a matte light grey workbench mat. Soft even studio lighting, sharp focus, no hands, no tools, generous spacing between parts. Exactly thirteen items, each with a small white round numbered tag (1 to 13) placed beside it:

1. A small green ESP32-S3 microcontroller dev board, about 60 x 25 mm, with two USB-C ports, a silver metal radio shield and two rows of gold header pins.
2. A tiny round purple microphone breakout board, about 15 mm across, with one small silver MEMS microphone and six pins (INMP441).
3. A small blue amplifier breakout board, about 18 x 18 mm, with a green two-pin screw terminal (MAX98357A).
4. A round black 50 mm loudspeaker with a paper cone, metal frame, and two short red and black wires.
5. A large round orange arcade-style push button, 30 mm wide, with a black threaded body and nut.
6. A rotary encoder with a metal shaft on a small board, with a black ribbed knob beside it.
7. A small one-colour OLED display module, 1.3 inch, black glass with a blue board and four pins, showing plain white text.
8. A flat silver lithium polymer battery pouch, about 50 x 34 mm, with a red and black wire and small white plug.
9. A tiny USB-C battery charger board, about 25 x 17 mm, blue.
10. A single red-green-blue LED and a small black slide switch.
11. A small coil of thin multi-coloured hookup wire.
12. An empty matte black ABS plastic project box with its lid beside it, about 120 x 60 x 30 mm.
13. A small chrome toggle switch with a short metal bat-shaped lever, a threaded collar with a hex nut, and three solder lugs.

Clean technical catalogue look, realistic scale between parts, neutral colours. No extra components, no antenna, no brand logos. Aspect ratio 16:9.
```

**With names instead of numbers.** Swap the tag sentence for: "each with a small white printed label beside it reading its name in clean black sans-serif capitals", and use these names: ESP32-S3 BOARD, MICROPHONE, AMPLIFIER, SPEAKER, TALK BUTTON, CHANNEL KNOB, SCREEN, BATTERY, CHARGER, LED AND SWITCH, WIRE, CASE, MODE SWITCH.

**Key to the numbers.**

| No. | Part | Job |
| --- | --- | --- |
| 1 | ESP32-S3 dev board | The brain: Wi-Fi, voice coding, encryption |
| 2 | I2S microphone (INMP441) | Hears you |
| 3 | I2S amplifier (MAX98357A) | Drives the speaker |
| 4 | 4 ohm 3 W speaker | Loud enough for Pop |
| 5 | Big push button | Hold to talk |
| 6 | Rotary encoder and knob | Picks the channel |
| 7 | One-colour OLED screen | Shows channel name and state |
| 8 | LiPo battery, 1000 mAh | Power off the dock |
| 9 | USB-C charger board | Charges the battery |
| 10 | Status LED and switch | Colour for talk and listen; on and off |
| 11 | Hookup wire | Joins it all up |
| 12 | Project box | The case |
| 13 | Toggle switch | Chooses push-to-talk or open channel |

</details>

## Prompts 2a to 2d: the earlier shapes

Three shapes we looked at before the platform radio: a classic handheld, a bedside radio, and a pocket pebble. All three are the one-knob, Wi-Fi only build.

### 2a. Classic handheld

The familiar walkie-talkie shape, so nobody needs it explained.

```
Studio product photograph of a simple homemade internet walkie-talkie, three-quarter front view, standing upright on a pale wooden table. A chunky rounded rectangular handheld in matte cream plastic, about 130 mm tall, 65 mm wide and 30 mm deep, sized for an elderly person's hand. Front face from top to bottom: a round perforated speaker grille filling the top third; a small one-colour OLED screen in the middle showing the word "CHRIS" in large white letters on black; one very large round orange push button, 30 mm wide, in the lower third. A small chrome toggle switch with a short metal lever on the right-hand side of the case, with the tiny engraved labels "PUSH" and "OPEN" either side of it. On the top edge, a single black ribbed rotary knob like a radio volume knob. A small status light glowing green beside the screen. A USB-C port on the bottom edge. No antenna, no keypad, no other buttons or switches, no brand logos. Friendly, sturdy, slightly retro design, like a well-made 3D printed gadget. Soft daylight, shallow depth of field, plain light background. Aspect ratio 4:5.
```

### 2b. Bedside radio

Sits on a table by the chair, always on charge. The button is on top where a hand lands on it.

```
Studio product photograph of a small homemade internet walkie-talkie designed as a tabletop radio, three-quarter front view, sitting on a wooden bedside table next to a reading lamp and a cup of tea. A squat wedge-shaped box in matte sage green plastic with rounded corners, about 120 mm wide, 80 mm deep and 70 mm tall, with a gently sloped front face. On the top surface: one very large round orange arcade-style push button, easy to press with a whole palm. On the sloped front face: a wide perforated speaker grille on the left, a small one-colour OLED screen on the right showing the word "CHRIS" in large white letters on black, and below the screen a large black ribbed rotary knob with a white pointer line. A small chrome toggle switch with a short metal lever on the front face below the speaker grille, with the tiny engraved labels "PUSH" and "OPEN" either side of it. A small status light glowing green next to the screen. A USB-C cable plugged into the back. No antenna, no keypad, no other buttons or switches, no brand logos. Warm, homely, sturdy design, like a modern take on a 1960s transistor radio. Soft warm indoor light, shallow depth of field. Aspect ratio 4:5.
```

### 2c. Pocket pebble

Small enough for a pocket or a lanyard. The knob is a ring around the button, so there are only two things to touch.

```
Studio product photograph of a small homemade internet walkie-talkie shaped like a smooth pebble, three-quarter front view, resting in an open adult hand for scale. A rounded oval puck in matte navy blue plastic, about 85 mm long, 65 mm wide and 28 mm thick, with a woven lanyard loop at the top. On the front face: one very large round orange push button in the centre, surrounded by a black ribbed rotating ring that turns to change channel; above the button a small one-colour OLED screen showing the word "CHRIS" in large white letters on black; below the button a row of small speaker holes. A small slide switch on the right edge with the tiny engraved labels "PUSH" and "OPEN". A small status light glowing green beside the screen. A USB-C port on the bottom edge. No antenna, no keypad, no other buttons or switches, no brand logos. Soft, friendly, minimal design, like a well-made 3D printed gadget. Soft daylight, plain light background, shallow depth of field. Aspect ratio 4:5.
```

### 2d. Pocket pebble, back view

The reverse of 2c, to show how it is carried: a sprung clip for a belt or shirt pocket, and the lanyard loop. Generate it straight after 2c so the colour and hand match.

```
Studio product photograph of the back of a small homemade internet walkie-talkie shaped like a smooth pebble, rear view, resting face down in an open adult hand for scale. A rounded oval puck in matte navy blue plastic, about 85 mm long, 65 mm wide and 28 mm thick, with a woven navy lanyard loop threaded through a small hole at the top. The back is plain and smooth except for one sturdy sprung belt clip in matching navy plastic running down the centre, hinged near the top with a visible small steel coil spring, with a ribbed grip at its lower tip. A small slide switch on the right edge. A USB-C port on the bottom edge. No screen, no buttons, no speaker holes and no labels on the back, no antenna, no brand logos. Soft, friendly, minimal design, like a well-made 3D printed gadget. Soft daylight, plain light background, shallow depth of field. Aspect ratio 4:5.
```

**Variations worth trying.** Add "exploded view showing the internal circuit boards, speaker and battery floating apart above the case" to any concept for a cutaway. Swap the screen word for "LISTENING" or "TALK" and the status light to red to show other states. Add "sitting in a matching charging dock" for the dock.
