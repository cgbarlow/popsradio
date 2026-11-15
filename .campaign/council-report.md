---
created: 2026-11-14
council-type: standalone
---

# Council Report

Scope: a review of everything in the repository, with recommendations. Read in full: README, COMMERCIAL, the R1 doc, the Stage 2 hardware doc, the service design, the relay report and the site (`index.html`). The five research notes were checked by their headings, takeaways and gaps.

## Animal Perspectives

### Bear — Vision & Direction
- The purpose is clear and told the same way everywhere: one button, hold to talk, let go to listen, for Grandad. The README, the site and the printed card all say it the same way.
- The project now has two directions. The README calls it "a family project"; the service design builds a business: a price list, a ring-fenced fund, an app subscription sized at 1,000 subscribers for NZ$30,000 a year, a kids' phone and a Christmas rush. The business is written in more detail than the first working radio.
- The locked service design is a good strategic call: a blind relay that is serverless and can be replaced, worked out from a careful relay report.
- The goal that matters is the week with Grandad. Every later stage depends on it, but it is the least defined goal in the repo.

### Cat — Risk & Scope
- **The public promises go further than the evidence.** The site shows "NZ$0 Subscription, ever", and the README says "No subscription, ever" and "prepaid for life". Nothing is built yet, latency is unmeasured and running costs are estimates. Monthly channel plans and an optional app subscription sit next to the "ever". The service design itself says the wording needs a lawyer, and the research notes say the Fair Trading Act angle on "lifetime" claims was not researched.
- **The docs drifted after the design was locked.** The R1 summary still promises 70 to 130 ms on Wi-Fi, but the service design estimates 100 to 180 ms over WebSocket. The R1 diagram says "Paired by the same QR", and the R1 risks table relies on "reset group issues a new QR", but setup is now from the service, not by QR. The Stage 2 pairing flow and setup step still write a "relay address" with a laptop script, the trust table offers a "web admin page on the relay", and the control-service section says "the same Go program with a SQLite file".
- **The cipher is ambiguous, which is a wire-format risk.** The R1 and Stage 2 docs say ChaCha20-Poly1305 with a counter nonce; the service design says XChaCha20-Poly1305. The two use different nonce sizes, so two radios built from different docs would not understand each other.
- **The core's module list differs between docs.** Speech shaping is in the R1 doc, the Stage 2 doc and the README, but not in the service design's summary, decisions table or module table. The EQ band is 2 to 4 kHz at 6 to 10 dB in the R1 doc, but "around 1 to 4 kHz" in the Stage 2 doc.
- The kids' mini phone brings heavy extra duties. It is correctly parked; keep it parked.

### Owl — Process & Structure
- The repo has 48 commits and all of them are documents. The protocol spec doesn't exist yet, although the R1 build plan makes it step 2 and the relay report says to put the first changes "into the protocol spec now". It is the keystone the other work depends on.
- Decisions are recorded as "Updated 15 November 2026" banners above research bodies that still carry the old advice. There is no single decision log; the service design's Decisions table is the nearest thing.
- **The public plan and the doc plan differ.** The site's Stage 1 steps leave out the protocol spec, the laptop test client and the C core, which the docs say come first. Every step is at `done: 0`, so there is nothing to track yet.
- COMMERCIAL.md asks people to open an issue titled "Commercial licence", but there is no issue template. This is minor.
- **Branch hygiene.** A rebased commit (speech shaping) is still unpushed, because the work branch had been merged and then reused.

### Puppy — Opportunities & Momentum
- The site's simulator is a ready-made usability test. Sit Grandad in front of it on a tablet and learn how he gets on with the knob, OPEN and the sounds before any hardware exists.
- The R1 doc has a one-evening Zello smoke test on flashed R1s. That would be the first real evidence for the whole project.
- The R1 doc suggests a NZ$30 ESP32 breadboard early. If it is loud enough, it could make the R1 lock-down work unnecessary.
- The research is unusually good. The relay report, and the "What the first-hand check changed" section in particular, could be published as a post on its own.
- The printable card, the "Grandad decides" stance and the red-light rule are good design work.

### Rabbit — Resources & Stakeholders
- **Stakeholders:** Grandad, Chris as caregiver, other family members, home builders, commercial licensees, a future trustee, a lawyer and RSM. Grandad's input is planned as a single week with "ask him what he thinks", with no defined way to capture it.
- **Lead times.** The core ESP32 parts are import-only. Ordering them now would let Stage 2 breadboarding run alongside the R1 work.
- **Accounts and keys still needed:** a Cloudflare paid plan, R2, an Apple developer account and the Push to Talk entitlement (unconfirmed), and offline custody of the signing key. Legal review is needed before anything is sold.
- **Bus factor of one.** Everything rests on Chris. The end-of-service plan names a trustee role but no trustee.

### Wolf — Cohesion & Balance
- **Attention is unbalanced.** There are about 180 KB of research on relay alternatives and a detailed pricing model, but nothing on how the week with Grandad will be run or judged. The thing the project is for gets the least depth.
- **The setup tooling has a gap.** The control page became part of the family app (Stage 3), but the R1 doc (build step 6, and item 4 of "How to keep the waste small") still says to set up from the control service. Stage 1 and Stage 2 have no defined setup or care tool now.
- The voice is cohesive: plain English, NZ spelling, "Grandad" throughout, and honest "estimate" and "not tested" labels.
- The site shows two stages and the README shows five. That is fine for the audience, but the site's "NZ$0 Subscription, ever" figure exposes the business promise to a family audience without the conditions attached.

## Consensus

**Common themes.** The design is ahead of the evidence: prices, guarantees and a five-stage roadmap are locked before a single latency or cost figure has been measured. The lock on 15 November left drift across the docs, including one real wire-format ambiguity (the cipher). The two artefacts everything else depends on, the protocol spec and a Grandad trial plan, don't exist yet.

**Key tensions.** Ambition against focus: Bear and Puppy see a product with reach, while Cat and Wolf see a family project carrying a business's promises. Locking against learning: Owl wants decisions recorded firmly, but several locked choices (WebSocket over UDP, the cost per channel) are meant to be checked by the Stage 1 trial. The fix is to lock the interfaces and keep the numbers provisional.

**Overall.** The vision is clear, the architecture is well reasoned and the research is strong. The project now needs to stop designing and start measuring. The most valuable next work is the protocol spec and a planned week with Grandad, not more design.

## Recommended Next Steps

1. **Write the protocol spec.** Pin the cipher (XChaCha20-Poly1305 or ChaCha20-Poly1305 with its nonce layout), the frame and routing header, versioning, floor rules, the signed settings list and the C core's module list, including speech shaping. Then point every doc at it instead of restating it.
2. **Sweep the docs for drift after the lock.** That covers the R1 summary latency, the QR references and the "reset group" risk row; the Stage 2 relay-address, admin-page and Go/SQLite lines; the module lists; and the EQ band. Either fix them or mark them superseded where they stand.
3. **Define the setup and care path for Stages 1 and 2.** Decide what replaces the control page before the family app exists: the app's free setup mode built early, or a small command-line tool on the laptop test client.
4. **Write a one-page Grandad trial plan.** Say what to measure (mouth-to-ear delay, stalls, cost per channel, loudness, missed messages) and how to capture his view, and set the pass mark. Run a simulator session with him first.
5. **Soften the public promises until the legal review.** Reword "NZ$0 Subscription, ever" and "for life" on the site and README as an aim rather than a guarantee. In parallel, order the ESP32 parts and push the pending commit.
