# The radio can tell the family Pop is up and about, if Pop agrees and it never pretends to be an alarm

Nov 16, 2026 · @Chris Barlow

> **A research report, not a decision.** [Design Decisions](../docs/Design%20Decisions.md) is unchanged. This looks at one more way to expand the radio: software and sensors that help the family look out for Pop.

## Summary

**The useful part costs nothing and needs no new hardware.** The radio already knows when it is touched: a knob turned, the button pressed, the FM switched on, the radio lifted off its stand. From that it can tell the family one plain thing each day, "Pop's radio has been used this morning", and nudge them if it has not. That is most of what families want from monitoring, and it is the only part I recommend building first.

| Level | What it is | Cost to make | Verdict |
|---|---|---|---|
| **1. Signs of life** | Software only. A daily "up and about", from the radio being used | Nothing | **Do this first** |
| **2. The room** | A plug-in sensor for temperature and humidity; later, a small radar that knows someone is in the room | About NZ$5 to 15 a sensor (*estimate*) | **Offer as plug-ins**, one at a time, after a trial with Pop |
| **3. The body** | Fall detection, breathing, anything that listens or watches | From about US$25 for a fall radar | **Do not build.** It makes the radio an alarm and a medical device, and breaks its promises |

- **Pop decides, and Pop can see it.** Research on this is consistent: older people's priorities are wider than their families', who lean towards safety, and privacy worries grow with use. So it is off until Pop agrees, the radio says what it shares, and a sensor that is unplugged shares nothing.
- **Never the microphone.** "Nobody can switch the microphone on from somewhere else" stays whole. Nothing in this report listens.
- **It is still not an alarm.** It says what the radio noticed. It never says Pop is safe, and it never says Pop has fallen.
- **The service stays blind.** What the radio shares is sealed to the family, the same way voice is.
- **Two questions to ask before anything is promised:** Medsafe, on where "wellbeing" ends and "medical device" begins; and the Privacy Commissioner's guidance, for rest homes above all.

Prices are list prices and my estimates on 16 November 2026. Lines marked *estimate* are mine.

## What the radio already tells the family

This is in the [service design](../docs/Walkie-Talkie%20Service%20Design.md) today: battery level, whether it is charging, whether it is online, when it was last seen, Wi-Fi signal, and alerts for a low battery or a radio that has gone offline. The Stage 2 doc already carries the right instinct: "Health and last-seen data are visible to whoever runs the page, so tell Pop what it shows."

So the family can already see the *radio* is well. The question here is how far to go towards seeing that *Pop* is.

## Level 1: signs of life, in software

**The radio is touched many times on an ordinary day.** Each touch is a sign that Pop is up. None of them needs a sensor that is not already on the board.

| The radio notices | From | What it suggests |
|---|---|---|
| The orange button pressed, or a message played | The talk path | Pop is using it |
| A knob turned or pressed | The three knobs | Pop is at the radio |
| FM or internet radio switched on or off | The mode | A routine: the morning news |
| Lifted off its stand, or put back | The charger | It went to the garden, and came home |
| Tipped, carried, laid on its back | The tilt sensor, if plugged in | Movement |

**What the family sees is one line, not a log.**

- **"Up and about."** A tick on the family's phones the first time the radio is used each day, with the hour, not the minute.
- **A quiet-day nudge.** If the radio has not been used by a time the family sets, their phones say so: "Pop's radio hasn't been used yet today." That is a prompt to call, and nothing more.
- **No history to scroll.** A week of ticks at most. The point is today.

**What it must not say.** "Pop is OK" is a claim the radio cannot make. A used radio means someone used the radio. A quiet radio means only that. The wording stays on what was noticed.

**Over the mesh, too.** The tick is a few bytes. When the internet is down, the mesh can carry it on a best-efforts basis, which is when a family most wants to know.

**Cost:** firmware and a screen in the family app. No parts.

## Level 2: the room, with plug-in sensors

The sensor sockets decided yesterday make this cheap to add and easy to remove.

| Sensor | What it tells the family | Price | Plugs into | Verdict |
|---|---|---|---|---|
| **Temperature and humidity** | Whether the room is warm enough | A few US dollars as a bought board (*estimate*) | A sensor socket | **First.** The least intrusive, and it answers a real worry |
| **Light** | Curtains opened, lamp on at night | A few US dollars (*estimate*) | A sensor socket | Maybe. It adds little beyond Level 1 |
| **Presence radar** (24 GHz) | Someone is in the room, even sitting still | US$3 to 6 as a module ([LCSC](https://www.lcsc.com/product-detail/Sensor-Modules_HI-LINK-HLK-LD2410-P_C5183133.html), [atomic14](https://www.atomic14.com/esp32/sensors/hlk-ld2410/)) | A card bay or the pin header: it speaks serial, not the sensor bus | **Later, and only if Pop wants it.** It watches a room |
| **Air quality** | Stuffy room, gas heater | Dearer; not priced | A sensor socket | For tinkerers |

**Why temperature first.** Cold homes are a known risk for older people. The World Health Organization gives 18°C as a widely accepted minimum indoors and says older people may need more ([WHO](https://www.ncbi.nlm.nih.gov/books/NBK535294/)), and New Zealand's healthy homes rules use the same figure. The evidence for the exact number is debated, so the radio should report the temperature and let the family judge, not raise an alarm at a line.

**Why the radar waits.** A presence radar sees through a blanket and cannot be fooled by sitting still, which is exactly why it feels like being watched. It is the first thing here that senses Pop when he has not touched anything. It is cheap and it works; whether it is welcome is a question for Pop, not for the parts list.

**It only covers one room.** The radio sits by the bed or the chair. It says nothing about the bathroom or the kitchen, where falls happen. That limit is worth stating plainly to families, and it is a reason not to oversell any of this.

## Level 3: what to leave out

| Idea | Why not |
|---|---|
| **Fall detection** by radar | Kits exist from about US$25, or £24.50 at [The Pi Hut](https://thepihut.com/products/mmwave-human-fall-detection-sensor-mr60fda2-60ghz). But a radio that says it detects falls is an alarm. A missed fall is worse than no detector, because the family stopped checking |
| **Breathing or heart rate** by radar | A medical claim |
| **Listening** for a fall, a cough or a call for help | It needs the microphone on without the button. That is the one promise the radio is built on |
| **A camera** | The same, and more so |
| **Location** | The radio has no GPS, and "never sent" is already a promise |
| **A "Help" button** | Already ruled out. It is not an emergency alarm |

**The line is "noticing", not "detecting".** Levels 1 and 2 report ordinary facts: the radio was used, the room is 16 degrees. Level 3 reports events in Pop's body and asks to be relied on. That is a different product, with a different regulator.

## The rules that would make it acceptable

**What the research says.** Studies of passive monitoring find that older people respond in varied ways, including refusing it, dropping it and working round it; that their priorities (safety, autonomy, privacy, control, contact) are wider than those of family and staff, who stress safety; and that in one study with high acceptance, 60% of users had privacy concerns, and those concerns grew after a year ([Berridge, Ageing & Society](https://www.cambridge.org/core/journals/ageing-and-society/article/active-subjects-of-passive-monitoring-responses-to-a-passive-monitoring-system-in-lowincome-independent-living/76B9ABCC3CF4D71D88117FA4E3860EAC); [review, PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC5321543)). I read these at abstract level only.

So the rules are written from Pop's side.

1. **Off until Pop says yes.** It is switched on at the radio, with Pop there, not quietly from a phone in another town.
2. **The radio says what it shares.** Out loud when it is switched on, and on a card beside it: "This radio tells Chris when it has been used each day."
3. **What is plugged in is what is shared.** A sensor shares nothing once it is unplugged. That is consent you can see, like the red light.
4. **Never the microphone.** No exceptions, in official firmware or in the approved app rules.
5. **A line, not a log.** Today's tick and the room's temperature. No timeline of Pop's day, and a week of history at most.
6. **Sealed to the family.** Encrypted on the radio and opened only on the family's phones. The service passes it on and cannot read it.
7. **Words that do not overclaim.** "Used at 8", "not used yet", "16 degrees". Never "safe", "OK" or "fallen".
8. **It works both ways.** If the family can see Pop's radio was used, Pop's radio can show that Chris's was too. Looking out for each other is easier to accept than being watched.
9. **Not on the kids' mini phone.**

Rule 8 is the one I would test first. It turns monitoring into something mutual, and it costs nothing.

## The law, as far as I can read it

**Medical devices.** New Zealand has its own legal definition, and Medsafe applies it to software by its intended purpose: diagnosis, monitoring or treatment makes a device; general wellness does not ([Medsafe](https://medsafe.govt.nz/Regulatory/DevicesNew/1Definition.asp); summary at [RA Path](https://rapath.github.io/nz/special-topics/samd-digital-health/)). I found nothing specific to fall detectors or activity monitors. My reading is that "the radio was used this morning" and "the room is 16 degrees" are not medical, and that "fall detected" is. Medsafe offers an opinion on categorisation; ask before any health-sounding word goes on the site. New legislation covering health software was pending in the sources I found.

**Privacy.** A family looking out for a parent is ordinarily a personal matter. We are not a family: if we held this information we would be an agency under the Privacy Act 2020 with duties about collection, purpose and consent. Sealing it so the service cannot read it keeps us out of most of that, which is a second reason for rule 6. This is my reading, not advice.

**Rest homes are different.** An organisation watching a resident is not a family, and health information has its own code. Leave monitoring off in rest homes unless the resident asks for it and the home has its own process.

**The alarm question.** The market report found that a medical alarm must come from an accredited supplier to be funded, and that the radio is "not eligible: the radio is not an alarm". Nothing here should blur that.

## From other angles

- **The brand.** "Respecting Pop" and "monitoring Pop" pull against each other. The feature needs a name that sits on the right side: "Up and about", not "Monitoring". It belongs with the family app's care screens, not on the front page.
- **The business.** Families already pay about NZ$850 to 1,350 a year for a medical alarm (market report). A daily tick is worth something to them and costs us almost nothing to run. It fits the family app, which is where the service design already puts paid extras, and it must never become a reason to charge for the radio.
- **The tinkerer.** The same sockets take weather, air and light sensors for people who just like data. That is a hobby, not monitoring, and it needs no rules beyond the ones already decided.
- **The engineering.** Level 1 is small: events the firmware already handles, one sealed message a day, one screen. Level 2 adds a driver per sensor.
- **What could go wrong.** A family that trusts the tick and stops calling. A sibling who switches it on without asking. A quiet-day nudge on the morning Pop slept in, every week, until everyone ignores it.

## Recommendation

1. **Build "Up and about" as software**, off by default, switched on at the radio with Pop, with the nine rules above.
2. **Make it mutual** from the start, and see whether Pop likes seeing that Chris is up.
3. **Offer a temperature and humidity sensor** as the first plug-in after the tilt sensor.
4. **Hold the presence radar** until a trial with Pop says whether it is welcome.
5. **Leave out falls, breathing, listening, cameras and location.** Say so on the site, next to "this is not an emergency alarm".
6. **Ask Medsafe** where the line is, and read the Privacy Commissioner's guidance, before any of it is offered outside the family.

## Risks and open questions

| Risk | Impact | Mitigation |
|---|---|---|
| Families treat a tick as "Pop is safe" | A missed emergency | Wording that reports only what was noticed; "not an alarm" beside it |
| Pop is monitored without agreeing | The project breaks its own promise | Switched on at the radio; said aloud; unplug to stop |
| It only sees one room | False comfort | Say so plainly |
| Nudges on ordinary quiet mornings | The family learns to ignore them | The family sets the time; one nudge a day |
| A health-sounding claim makes it a medical device | Regulation we cannot afford | Ask Medsafe; keep to "noticed", never "detected" |
| A rest home wants to use it on residents | A different legal position | Off in rest homes by default |
| Sensor data held by us | Privacy duties | Sealed to the family; nothing readable on the service |

**Unconfirmed:** the prices of plug-in temperature and light sensors, which I gave from memory; how Medsafe would class an activity tick or a presence radar; the exact reach of the Privacy Act's personal-affairs position; and whether Pop wants any of it, which is the only finding that matters.

## Sources

- Sensors: [LD2410 at LCSC](https://www.lcsc.com/product-detail/Sensor-Modules_HI-LINK-HLK-LD2410-P_C5183133.html) · [LD2410 guide](https://www.atomic14.com/esp32/sensors/hlk-ld2410/) · [Seeed MR60FDA2 fall sensor](https://thepihut.com/products/mmwave-human-fall-detection-sensor-mr60fda2-60ghz)
- Cold homes: [WHO Housing and Health Guidelines](https://www.ncbi.nlm.nih.gov/books/NBK535294/)
- How older people respond to monitoring: [Berridge, Ageing & Society](https://www.cambridge.org/core/journals/ageing-and-society/article/active-subjects-of-passive-monitoring-responses-to-a-passive-monitoring-system-in-lowincome-independent-living/76B9ABCC3CF4D71D88117FA4E3860EAC) · [review of privacy and autonomy](https://pmc.ncbi.nlm.nih.gov/articles/PMC5321543)
- Medical devices: [Medsafe, definition](https://medsafe.govt.nz/Regulatory/DevicesNew/1Definition.asp) · [software as a medical device in NZ](https://rapath.github.io/nz/special-topics/samd-digital-health/)
- In this repo: [service design](../docs/Walkie-Talkie%20Service%20Design.md) · [Stage 2 doc, control service](../docs/Walkie-Talkie%20Beyond%20the%20R1%20Minimum%20Hardware.md#optional-control-service) · [market report](NZ%20addressable%20market%20and%20opportunities.md)
