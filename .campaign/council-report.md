---
created: 2026-11-16
council-type: standalone
---

# Council Report

Scope: one more way to expand the radio that had not been covered: software and sensors for monitoring Pop. Read: the service design's radio health and care screens, the Stage 2 doc's control service, the market report on medical alarms, Design Decisions 15 and 22. Researched: presence and fall radar prices, the medical device test in New Zealand, cold homes, and how older people respond to being monitored.

The full findings are in [the research report](../reports/Looking%20out%20for%20Pop.md). It is a proposal, not a decision; nothing on the site or in Design Decisions has changed.

## Animal Perspectives

### Bear — Vision & Direction
1. **This is the angle most likely to turn the project into something it set out not to be.** The radio exists because Pop wanted to talk to his family. "Monitoring Pop" is a product for the family. Any step here has to start from Pop's side.
2. **There is a version that fits.** Looking out for each other is what families do. A radio that quietly says "used this morning" is in that spirit. A radio that watches is not.
3. **Make it mutual.** If Chris can see Pop's radio was used, Pop's can show that Chris's was. That changes the feature from surveillance to company, and it costs nothing.
4. **It must not move the headline.** "Hold to talk" stays first. This belongs in the family app's care screens.

### Cat — Risk & Scope
1. **False reassurance is the real danger.** A tick that the family reads as "Pop is safe" is worse than no tick, because they stop calling. The radio sees one room and knows only that it was touched.
2. **Fall detection is the line.** Radar kits cost about US$25 and are tempting. A radio that claims to detect falls is an alarm and, on my reading, a medical device. A missed fall would be on us.
3. **The microphone promise is one feature away.** "Listen for a fall" is the obvious next request. It needs the microphone on without the button, which is the promise the whole radio rests on.
4. **Someone will switch it on without asking Pop.** A sibling, from a phone, in another town. It has to be switched on at the radio.
5. **Rest homes change the law.** A home watching a resident is not a family. Leave it off there by default.

### Owl — Process & Structure
1. **Three levels make the choice plain.** Software only; plug-in room sensors; the body. Do the first, offer the second with care, leave out the third.
2. **Half of it is already designed.** The service already reports battery, online and last seen. Level 1 extends that, sealed like voice so the service cannot read it.
3. **The sockets were decided yesterday.** A sensor that is unplugged shares nothing. That is consent you can see, on the same principle as the red light.
4. **Two questions before any promise:** Medsafe on where wellbeing ends, and the privacy rules for anyone who is not family.

### Puppy — Opportunities & Momentum
1. **The best part is free.** No parts at all: the radio already knows when a knob turns or the news comes on.
2. **The mesh carries a tick.** A few bytes, best efforts, in a power cut, which is exactly when a family wants to know.
3. **A warm room is a kind thing to know.** A temperature sensor is a few dollars and the least intrusive sensor there is.
4. **Tinkerers get weather and air sensors for nothing,** from the same sockets, with no monitoring involved.

### Rabbit — Resources & Stakeholders
1. **Pop is the stakeholder who has not been asked.** The research is clear that older people's priorities are wider than their families', and that privacy worries grow with use.
2. **People to ask:** Medsafe's categorisation service, and the Privacy Commissioner's guidance.
3. **It could pay for the family app.** Families already pay NZ$850 to 1,350 a year for a medical alarm. A daily tick is worth something and costs almost nothing to run. It must never become a charge on the radio.
4. **Prices are soft.** The temperature and light sensor prices are from memory.

### Wolf — Cohesion & Balance
1. **Two words pull against each other on the same site:** "respecting Pop" on the tinkerer page, and "monitoring Pop" here. The name has to sit on the right side. "Up and about", not "monitoring".
2. **Say what it is not, beside what it is.** Next to "this is not an emergency alarm": no falls, no listening, no camera, no location.
3. **The quiet-day nudge will misfire.** Pop sleeps in. One nudge a day, at a time the family sets, or everyone learns to ignore it.
4. **The card and the simulator are still behind,** and this would add a line to the card: what the radio tells the family.

## Consensus

**Common themes.**

- **Start from Pop's side.** Bear, Cat and Rabbit: off until he agrees, switched on at the radio, said aloud, and stopped by unplugging.
- **The free part is the good part.** Owl and Puppy: a daily "up and about" from the radio being used, with no new hardware.
- **Never the microphone, never an alarm.** Cat and Wolf.
- **Mutual, not one-way.** Bear, and nobody disagreed.

**Key tensions.**

- **What families want against what Pop wants.** Families lean to safety; the research says older people care as much about autonomy and control. Resolved, as a recommendation, by nine rules written from Pop's side.
- **A cheap fall radar against the project's promises.** Resolved by leaving it out and saying so.
- **Reassurance against false reassurance.** Not fully resolved. Careful wording helps; it does not remove the risk.

**Assessment.** There is a small, kind version of this that fits the project: a daily sign of life, shared both ways, with Pop's agreement. Everything beyond the room's temperature moves towards watching him, and the body-sensing ideas would make the radio an alarm it has always said it is not.

## Recommended Next Steps

1. **Ask Pop.** Before anything is built: would he want Chris to see that his radio was used this morning, and would he like to see Chris's?
2. **If yes, build "Up and about" as software,** off by default, mutual, with the nine rules.
3. **Offer a temperature sensor** as the first plug-in after the tilt sensor.
4. **Ask Medsafe** where the line is before any health-sounding word appears.
5. **Put "what it will never do" on the site,** beside "not an emergency alarm", if any of this is accepted.
