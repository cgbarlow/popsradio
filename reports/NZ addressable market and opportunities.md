# Families, not institutions, unlock Grandad's radio market

New Zealand's total addressable market (TAM) for Grandad's radio is about **NZ$60 million for its core users: roughly 260,000 households where someone aged 75+ lives at home**, each buying a NZ$229 starter pair. Widen the market to every household with someone aged 65+ (about 554,000) and it is about **NZ$127 million**. Add the kids' mini phone (about NZ$45 million) and every institutional segment, and the total is roughly **NZ$130–200 million of one-off hardware and channel sales**. The market the product can actually serve is smaller. Only about 72% of over-75 households are estimated to have home Wi-Fi the radio can use, which gives a serviceable market (SAM) of about **187,000 older households, or NZ$43 million**. A realistic five-year obtainable share (SOM) is **about 2,000–7,500 older households (base case about 4,700, or NZ$1.1 million)**, plus a few thousand kids' units and small institutional pilots: **roughly NZ$0.8–3 million in total**. The main finding is structural. Rest homes, retirement villages, home-support providers, social landlords, Māori and Pacific providers and NGOs are mostly *different payers for the same older people*, not extra markets. Together the segments that genuinely add to the total (aged residential care, disability residential, hospices, hospitals) add only about NZ$7 million. Strategy should therefore centre on families buying direct. B2B buyers are best treated as distribution channels, pilot partners and grant applicants, with seniors' social housing and retirement villages the strongest of them. Regionally, Auckland, Canterbury, Waikato and Wellington hold 60% of the core market. Tasman, Marlborough and the West Coast are the oldest regions per head. The West Coast, Northland, Gisborne and Southland have the weakest home connectivity, so a Wi-Fi-only radio reaches the fewest people there.

## One population, many payers: how the market was sized

### The product's prices are only partly set, so the sizing uses explicit assumptions

The repository fixes the channel price list but not a retail price for the radio itself. Channels cost **NZ$35, NZ$75 or NZ$99 once for 1, 3 or 5 channels, or NZ$2, NZ$4 or NZ$5 a month**. Every set includes its channels for life, and parts cost **NZ$35–50 a radio** ([Service Design](../Walkie-Talkie%20Service%20Design.md#prices-kept-simple); [README](../README.md)). The radio price therefore has to be assumed. The consumer research puts the defensible window for a pair at **NZ$199–249**. That sits above toy UHF twin packs (NZ$80–90, e.g. the Uniden UH45 twin at NZ$89.99 at [JB Hi-Fi NZ](https://jbhifi.co.nz/products/uniden-uh45-80-channel-uhf-handheld-radio-with-kid-zone-camo-blue-2-pack)) and below a single Opel BigButton senior phone (NZ$169 at [Harvey Norman NZ](https://www.harveynorman.co.nz/phone-and-gps/mobile-phones/opel-mobile-bigbutton-m-4g-128mb-mobile-phone-black-open-network-5566442.html)), a Spacetalk watch plus its fees, or an Echo Show 8 (NZ$399 at [PB Tech](https://www.pbtech.co.nz/product/SPKAMZ113284/Amazon-Echo-Show-8-2025-Smart-Display-with-Alexa)). The sizing uses the midpoint of that window and is easy to rescale. Multiply any consumer figure by 0.87 for a NZ$199 pair, or by 1.09 for NZ$249.

| Price assumption (incl. GST) | Value | Basis | Status |
|---|---|---|---|
| Consumer starter pair: 2 radios + 1 channel for life | **NZ$229** | Midpoint of NZ$199–249 substitute window | Assumption |
| Organisational per-user package: 1 radio + 1 lifetime channel | **NZ$134** | NZ$99 volume radio price (assumed) + NZ$35 list channel | Assumption + repo price list |
| Organisational monthly alternative | NZ$99 + NZ$2/month | Repo monthly channel price | Assumption + repo price list |
| Small-site kit: 5 radios + 1 channel | **NZ$530** | 5 × NZ$99 + NZ$35 | Assumption |
| Full-channel site kit: 10 radios + 1 channel (channel cap is 10) | **NZ$1,025** | 10 × NZ$99 + NZ$35 | Assumption |
| Kids' mini phone: 1 unit + 1 channel | **NZ$149** | Below Tin Can's NZ$190 NZ pre-order price | Assumption |
| Channel upgrade, 1 → 3 channels | NZ$40 once or NZ$2/month | Repo worked example | Repo price list |

Unit economics are tight at these prices. A NZ$229 pair is **NZ$199.13 before GST**. Take off **NZ$70–100 of parts** and the **NZ$25 lifetime-channel provision** the design ring-fences ([Service Design](../Walkie-Talkie%20Service%20Design.md#no-subscription-ever-whole-of-life-costs)), and **about NZ$74–104** is left. That has to cover assembly, certification, packaging, warranty, freight, payment fees, support and margin, none of which is estimated yet. Through a chain retailer the gap closes fast. JB Hi-Fi NZ's blended gross margin was **17.41%** in FY26 ([Inside Retail NZ](https://insideretail.co.nz/2026/08/17/jb-hi-fis-sales-soar-margins-expand-in-new-zealand/)). Even at that rate, the maker's share of a NZ$229 pair falls to about NZ$165 before GST, leaving roughly NZ$40–70 after parts and provision. That is why the TAM figures are expressed at retail value, and why selling direct to consumers comes first.

### Three tiers, one rule against double counting

Every category is sized in three tiers, each with its arithmetic shown. **TAM** counts every plausible user at the assumed price. **SAM** filters TAM by whether the product can work for them today, chiefly 2.4 GHz WPA2 Wi-Fi without a sign-in page ([Service Design minimum requirements](../Walkie-Talkie%20Service%20Design.md#the-guarantee-and-minimum-requirements)), and by whether they can use it. **SOM** is a five-year cumulative share calibrated against real NZ adoption benchmarks.

The rule that shapes the totals is this. Village residents, home-support clients, social-housing tenants, kaumātua and befriending-service clients all live in private dwellings. They are already inside the household count, so their segments appear as *overlapping channels* and are excluded from the additive total. Only people outside private households add to the total: rest-home residents, disability group-home residents, hospital and hospice patients. Children, schools and workplaces are separate populations and also add.

Every figure is flagged with one of three labels. *Official* means published by Stats NZ, the Ministry of Health or another agency, or by the named body for its own operations. *Estimate* means derived here, with the method stated. *Verify* means it came only from a search extract or a dated or secondary source, and must be checked before it goes into a pitch.

## Families buying for 260,000 older households form the core market

### The funnel from 930,520 over-65s to a few thousand likely buyers

Stats NZ's provisional estimate is **930,520 people aged 65+ at 30 June 2026**, or 17.4% of the population, up from 901,790 a year earlier ([Stats NZ subnational estimates, June 2026](https://www.stats.govt.nz/information-releases/subnational-population-estimates-at-30-june-2026/)). Of these, **75+ is about 418,700 and 85+ about 105,100**. Those two figures are interpolations between the 2023 estimates and Stats NZ's 2028 projections, not published counts ([Stats NZ projections via Figure.NZ](https://figure.nz/table/4MT2ckNlROUfSs4T)). The Ministry of Health certified-provider file lists **663 aged-care premises with 41,569 certified beds** ([MoH certified aged-care providers CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryAgedCare.csv)). Occupancy is now above **92%** ([Ministerial Advisory Group report, Aug 2026](https://www.health.govt.nz/system/files/2026-08/MAGroup-Report-Aged-Care-NZ-v2.pdf)). That implies about 38,200 people in residential care, and over 70% of residents are 80+ ([MoH MAG key facts](https://www.health.govt.nz/system/files/2026-08/aged-care-ministerial-advisory-group-report-key-facts-figures.pdf)).

The household count comes from the Census. The 2023 Census found **192,201 people aged 65+ living alone, 25.3% of older people in households** ([Stats NZ household highlights](https://www.stats.govt.nz/information-releases/2023-census-household-family-and-extended-family-highlights/)). One radio serves a home, so the unit of the consumer market is the household, not the person.

| Step | People / households | Arithmetic | Status |
|---|---|---|---|
| 65+ population, June 2026 | 930,520 | Stats NZ | Official (provisional) |
| less ARC residents | −38,200 | 41,569 beds × 92% occupancy | Official beds × official-range occupancy |
| 65+ in private dwellings | 892,300 | | Estimate |
| of whom living alone | ~215,800 | 192,201 × (930,520 ÷ 828,600 Census 65+) | Estimate |
| **65+ households (broad TAM)** | **~554,000** | 215,800 + (892,300 − 215,800) ÷ 2 | Estimate |
| **Broad TAM value** | **NZ$126.9m** | 554,000 × NZ$229 | Estimate |
| 75+ in private dwellings | ~384,300 | 418,700 − (41,569 × 92% × 90% aged 75+) | Estimate |
| **75+ households (core TAM)** | **~260,000** | assumes ~35% live alone, the rest mainly in couples | Estimate |
| **Core TAM value** | **NZ$59.5m** (520,000 radios) | 260,000 × NZ$229 | Estimate |
| with usable home Wi-Fi (72%) | ~187,000 | see connectivity evidence below | Estimate |
| **SAM value** | **NZ$42.9m** | 187,000 × NZ$229 | Estimate |
| lacking "essential" digital skills (~65%) | ~122,000 | priority SAM: the people phones fail | Estimate |
| **Priority SAM value** | **NZ$27.9m** | 122,000 × NZ$229 | Estimate |
| **SOM, 5 years cumulative** | **1,900–7,500 (base 4,700)** | 1%–4% of SAM (base 2.5%) | Estimate (judgement) |
| **SOM value** | **NZ$0.43–1.71m (base NZ$1.07m)** | × NZ$229 | Estimate |

A broad SAM across all 65+ households is about **446,000 households, or NZ$102 million**. That adds the 294,000 households aged 65–74 at an assumed 88% connectivity, but most of them are still comfortable with smartphones. **The 75+ core is the market the product is designed for.**

### Wi-Fi is the gate, and the evidence for it is dated

The 72% connectivity factor is the most important estimate in the report, and the least certain. Nationally, **90.45% of households had internet access at the 2023 Census** ([Stats NZ Census 2023 via Figure.NZ](https://figure.nz/table/fhzBDP7BiRC9ObS8)). No 2023 figure exists by age. The last age split, from the 2013 Census, showed only **49% of people aged 75+ lived in a household with internet, against 75% of 65–74s** ([MSD Social Report 2016](https://socialreport.msd.govt.nz/social-connectedness/telephone-and-internet-access-in-the-household.html)). Later research put 75+ access at **60%** ([Digital Council](https://www.digital.govt.nz/assets/Digital-government/Digital-inclusion/Digital-Inclusion-Research/Publication-of-Digital-Council-Research-Report-Addressing-the-digital-divide-The-economic-case-for-increasing-digital-inclusion-PDF.pdf)), and more recent survey work found **25% of 75–84s and 50% of over-85s do not use the internet** ([SilverTech evaluation, PMC 2025](https://pmc.ncbi.nlm.nih.gov/articles/PMC12227816/)).

Household access rose from 77% to 90% between 2013 and 2023 ([Infometrics](https://economics.infometrics.co.nz/article/2024-10-first-detailed-insights-from-the-2023-census)). That supports about 70–80% for 75+ households by 2026. The report uses 72%, the lower end, because some "internet" households rely on a phone's mobile data and have no Wi-Fi router. A Census 2023 crosstab of telecommunications by household age would replace this estimate, and is the top verification task.

### Connectivity barriers can also be sales triggers

The offline remainder, roughly **73,000 over-75 households**, can be reached at a price. Skinny Jump offers pre-pay 4G broadband to seniors for whom cost is a barrier at **NZ$5 for 35GB a month with a free modem**, through libraries and community partners ([Skinny Jump](https://www.skinny.co.nz/jump/about)). One provider reported it "temporarily paused", with a June 2026 return expected ([Whangārei Libraries](https://www.wdc.govt.nz/library/Visit/Library-services/Computers-and-internet/Skinny-Jump)), so its status needs verifying. Contract 4G wireless broadband starts at **NZ$45 a month** ([Canstar](https://www.canstar.co.nz/internet/cheapest-wireless-broadband-nz/)). That is about NZ$540 a year, more than twice the radio's price, so families will add broadband for the radio alone only rarely.

The copper switch-off is the bigger lever. Chorus now targets **nationwide copper retirement by 2028** ([Scoop Business, Apr 2026](https://business.scoop.co.nz/2026/04/19/chorus-accelerates-copper-network-shutdown/)). Rural households are moving to Starlink, which had **85,000 NZ subscribers and 27% of the rural broadband market by June 2025** ([NZ Herald](https://www.nzherald.co.nz/business/starlink-becomes-nzs-largest-rural-internet-provider-as-some-local-players-suffer-tech-insider/premium/UFCCHFU64FEMLGTKRJI6Q4NMAQ/)). Every older landline household that loses copper gains a Wi-Fi router. That turns a connectivity barrier into a marketing moment: "Nana's landline is going; here's how she keeps in touch."

### Need is real and growing faster than the 65+ total

The need case is strong. **39.4% of over-75s report hearing impairment** ([NZMJ scoping review](https://nzmj.org.nz/journal/vol-134-no-1535/hearing-loss-and-hearing-service-experiences-among-older-maori-and-whanau-a-scoping-review)), which makes loud, clear audio a requirement. **About 83,000 New Zealanders live with dementia** ([NZCCSS snapshot, May 2026](https://nzccss.org.nz/wp-content/uploads/2026/05/Snapshot-Aged-Care.pdf)). **About 79% of over-80s and about half of 70–79s lacked "essential" digital skills** in a 2021 survey ([MSD OIA citing Business NZ/BNA](https://www.msd.govt.nz/documents/about-msd-and-our-work/publications-resources/official-information-responses/2022/march/11-3-2022-information-on-processes-used-by-the-office-over-the-last-three-years-to-consult-with-those-living-in-retirement-lifestyle-villages-r-rep217800-.pdf)). That digital-skills gap is the strongest argument for a one-button device, and it is the basis of the 65% priority filter. Over 11% of over-65s report feeling lonely at least some of the time ([ODT on NZGSS 2023](https://www.odt.co.nz/canterbury/fostering-connection-to-beat-loneliness-ik8ebru4)). That is about 100,000 people, overlapping heavily with the 216,000 who live alone.

The core segment is also the fastest-growing. Stats NZ's medium projection takes **75+ from 370,400 in 2023 to 540,600 in 2033 (+46%) and 723,500 in 2043**, and **85+ from 92,100 to 149,400 to 226,900** ([Stats NZ projections via Figure.NZ](https://figure.nz/table/4MT2ckNlROUfSs4T)). Holding care beds flat, the core TAM rises to **about NZ$78 million by 2033** (estimate). One counter-trend matters: each new 75+ cohort arrives more smartphone-literate. The per-head need shrinks even as the head count climbs.

### Benchmarks explain why the obtainable share is a few percent

The SOM of 1–4% of SAM over five years rests on two benchmarks.

The first is medical alarms, the nearest equivalent one-button device for older New Zealanders. In 2021 MSD funded **more than 50,000 alarm clients** through the Disability Allowance, and St John held about 31,000 of them ([MSD OIA, Sep 2021](https://www.msd.govt.nz/documents/about-msd-and-our-work/publications-resources/official-information-responses/2021/september/20210921-market-share-statistics-for-each-of-the-accredited-alarm-companies..pdf); verify). That is roughly 12% of today's 75+ population. But alarms are a subsidised safety need costing **NZ$16–29 a week** ([Work and Income](https://www.workandincome.govt.nz/eligibility/health-and-disability/medical-alarms.html)). A social-connection radio is an unsubsidised want.

The second is Spacetalk, the category leader in kids' and seniors' wearables. It reached only **60.6k paid mobile subscribers group-wide** by FY26, mostly in Australia, and its ARR fell 11% ([Spacetalk FY26 ASX results](https://announcements.asx.com.au/asxpdf/20260828/pdf/073cvg7rfnrqcl.pdf); verify).

Gifting conditions are flat. NZ core retail spending in December 2025 was **NZ$4.702 billion, down 0.2%** ([Worldline NZ](https://worldline.com/en-nz/home/top-navigation/media-relations/press-releases/pr-2025_12_17_01)). A family project selling direct should plan on low single-digit penetration.

The base SOM of 4,700 households means about 9,400 radios. It also tests the service design's maintenance model. The design assumes **about 1,000 family-app subscribers at NZ$2.99 a month** to fund NZ$30,000 a year of upkeep ([Service Design](../Walkie-Talkie%20Service%20Design.md#the-family-app)). That threshold is reached only if more than one in five buying households subscribes.

### The kids' mini phone is a NZ$45 million TAM entering second

Stats NZ counted **325,440 children aged 5–9 at 30 June 2025** ([Figure.NZ / Stats NZ](https://figure.nz/chart/4fkSxIN59bzBoMuF)). Children typically get a first phone at 11–12 ([Scoop, 2degrees/Netsafe survey](https://www.scoop.co.nz/stories/SC2404/S00046/telco-online-safety-organisation-uk-grime-artist-trio-teaming-up-to-teach-kiwi-kids-about-smartphone-safety.htm)). Almost a quarter have one by about age 8 and 64% by about 11 ([NZ Herald, Census At School](https://nzherald.co.nz/nz/school-census-most-kids-have-their-own-phones-by-age-11/7VPOW2XXESDNCALCVWK4WQEC5Q)). That leaves a pre-phone window of roughly ages 5–10: about 390,000 children in about 300,000 households (estimate). At NZ$149 a unit, the TAM is **NZ$44.7 million**. Assuming 93% of family households have Wi-Fi, the SAM is **about 279,000 households, or NZ$41.6 million**. Because each year's cohort is only about 65,000 children, the steady-state flow is about NZ$7.5 million a year of new households.

The obstacle is timing. **Tin Can opened NZ pre-orders at NZ$190, shipping by 30 November 2026** ([Tin Can NZ store](https://tincan.kids/en-nz/products/tin-can); verify). It will reach NZ shelves before Grandad's radio has finished Stage 1. A SOM of 0.5–2% of SAM is about **1,400–5,600 households, or NZ$0.21–0.83 million** (estimate). Children's privacy rules and toy and battery safety duties come on top, as the service design itself notes. The school phone ban, which an ERO review found to be working ([1News, Nov 2025](https://www.1news.co.nz/2025/11/20/review-finds-school-phone-ban-is-working-could-smartwatches-be-next)), favours a home device over a wearable. That is an argument for a "home phone" pitch, not a "school workaround" pitch.

## Care settings add only about NZ$7 million, but institutions open doors

Every organisational segment uses the NZ$134 per-user package, or a site kit, so they can be compared directly. The table makes the central point visible. Aged residential care, the largest *additive* institutional segment, is worth NZ$5.6 million at full fit-out. The larger-looking segments (home support, villages, kaumātua households) are other routes to people already counted in the consumer market. Kaumātua households are 65,900 Māori aged 65+ (2023) × 1.123 growth to 2026 × 0.621 households per person ≈ 46,000, valued at the NZ$229 consumer pair; hospice loan pools are also valued as pairs. The additive care-setting segments (ARC, disability residential, hospitals, hospices) total about NZ$7.1 million; schools, ECE and the illustrative workplace figure add about NZ$18.8 million more.

| Segment | What is counted | TAM units | TAM NZ$m | SAM units | SAM NZ$m | SOM, 5 yrs | Adds to total? | Key status |
|---|---|---|---|---|---|---|---|---|
| Aged residential care | Certified beds | 41,569 | 5.57 | ~11,500 | 1.54 | 450–900 radios (30–60 facilities) | Yes | Beds official; SAM estimate |
| Disability residential (DSS) | Residents | 7,293 | 0.98 | ~3,650 | 0.49 | 150–400 | Yes | Official count |
| Hospitals (older persons', MH, rehab wards) | Target beds | ~2,500 | 0.34 | ~0 until Wi-Fi solved | ~0 | Pilot only | Yes | Estimate |
| Hospices | 174 inpatient beds + ~1,000 loan pairs | ~1,200 | 0.25 | ~600 | 0.12 | 50–150 | Yes | Beds official; pool estimate |
| Schools | Schools × 10-radio kit | 2,536 | 2.60 | ~290 (specialist + keen) | 0.30 | 25–75 schools | Yes | Verify count |
| ECE services | Services × 5-radio kit | 4,409 | 2.34 | Not sized (weak fit) | — | Minimal | Yes | Verify count |
| Workplaces (accommodation & food, illustrative) | Enterprises × 5-radio kit | 26,070 | 13.8 | Niche only, not sized | — | Minimal | Yes | Verify count |
| Retirement villages | Units | 43,598 | 5.84 | 10,900–15,300 | 1.46–2.04 | 300–1,000 | No: overlaps households | Industry (JLL) |
| Home and community support | Concurrent clients | 48,000 | 6.43 | ~34,600 | 4.63 | 200–600 | No | Official count |
| Seniors' social housing | Dedicated units | 10,000–15,000 | 1.3–2.0 | 5,000–9,000 | 0.67–1.21 | 400–1,200 | No | Estimate |
| Kaumātua (Māori 65+) households | Households | ~46,000 | 10.5 | ~33,000 | 7.6 | Via providers | No | Estimate from official base |
| Befriending NGOs | Clients | ≥1,250 (Caring Caller alone) | ≥0.17 | Most | — | Pilot, 20–50 per region | No | Verify |

### Aged residential care is a family-paid route, not a capital purchase

ARC is the biggest additive institutional segment, and its size is official. The **663 certified premises hold 41,569 beds**: Auckland 11,451, Canterbury 6,949, Waikato 4,022. **617 premises are certified for rest-home care and 248 for dementia** ([MoH CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryAgedCare.csv)). The SAM halves it twice. First, only about half of residents can use even a one-button radio: rest-home-level residents are about 42% and dementia and psychogeriatric about 18% ([MoH MAG key facts](https://www.health.govt.nz/system/files/2026-08/aged-care-ministerial-advisory-group-report-key-facts-figures.pdf)). Second, an assumed 60% of facilities can offer a Wi-Fi network without a sign-in page, or allow a room router. InternetNZ-funded research found facilities "seldom provided" resident Wi-Fi ([InternetNZ](https://internetnz.nz/news-and-articles/digital-divide-still-exists-in-new-zealand-for-older-people-living-in-residential-aged-care/)), so even 60% may be generous. The calculation is 38,200 residents × 50% × 60% ≈ 11,500 radios, or NZ$1.5 million.

Operators are short of money for discretionary spending. Health NZ caps rest-home prices ([Treasury OIA](https://www.treasury.govt.nz/sites/default/files/2025-10/oia-20250657.pdf)), and the 2025/26 uplift was 4% ([Scoop/Beehive](https://www.scoop.co.nz/stories/PA2510/S00002/aged-care-funding-and-service-improvements.htm)). Two arguments work with operators. One is staff time. About **45% of care workers are on visas**, and the sector is about **1,550 registered nurses short** ([NZ Doctor](https://www.nzdoctor.co.nz/article/undoctored/aged-care-association-calls-urgent-national-workforce-plan-following-latest); [Infometrics/NZNO](https://www.nzno.org.nz/Portals/0/publications/Report%20-%20Infometrics%20report%20how%20many%20more%20nurses%20does%20New%20Zealand%20need%20August%202025%20FINAL.pdf)). COVID-era NZ research found residents could not place video calls without staff help ([Journal of Long-Term Care](https://journal.ilpnetwork.org/articles/10.31389/jltc.153)). The other is the family-paid model: the family buys the pair, and the facility simply allows it on its Wi-Fi.

The radio must be pitched alongside nurse call, never instead of it. Nurse call is a compliance-critical system, supplied by NZ specialists such as Miracle Electronics' CareCall to the Ngā Paerewa standard ([Miracle Electronics](https://miracle-electronics.com/)).

### Retirement villages and seniors' housing are the best-fitting landlords

JLL counts **491 villages with 43,598 units**, home to about 14.7% of over-75s. Penetration is highest in Bay of Plenty at **21.0%** and lowest in Southland at 6.6% ([JLL via RVA](https://www.retirementvillages.org.nz/common/Uploaded%20files/Document%20Library/JLLinsightsretirementvillagesmarketreview.pdf)). The largest operators are already digital. Ryman has Wi-Fi in all villages and myRyman tablets in about 3,500 rooms ([HINZ](https://www.hinz.org.nz/news/457447/myRyman-electronic-care-system-deployed-to-3500-residents-rooms.htm)). Summerset's operations chief says new residents "all got a smartphone" ([Newsroom](https://newsroom.co.nz/2025/09/15/retirement-villages-meet-demand-of-tech-savvy-seniors/)). The radio's niche in villages is therefore frailer residents, serviced apartments, and couples split between a villa and the care centre. That is why the SAM takes only 25–35% of units.

Heritage Lifecare recently added 926 care beds by buying NZACS ([NZ Herald](https://www.nzherald.co.nz/business/companies/aged-care/heritage-lifecare-buys-new-zealand-aged-care-services-in-major-expansion/premium/6DSC5KGYYRD2HBD2GNPHE2GA3M/)). Radius runs at 96.7% occupancy and offers free resident Wi-Fi at some homes ([Forsyth Barr](https://www.forsythbarr.co.nz/assets/publications/RAD-2026-08-13-2026-ASM-A-Much-Bigger-Radius-of-Care.pdf); [Eldernet](https://www.eldernet.co.nz/provider/radius-waipuna/residential-care)). Both are plausible early partners on the care side.

Seniors' social housing fits better still. Its tenants are clustered, mostly live alone, and have one landlord who can buy for many units. Clusters of 10–40 units map neatly onto the 10-radio channel cap. Examples include **Haumaru Housing's 1,475 older-person units in Auckland** ([Scoop](https://www.scoop.co.nz/stories/AK2409/S00417/new-chair-for-specialist-older-persons-rental-housing-provider-haumaru-housing-comes-at-a-critical-time.htm)), Ōtautahi Community Housing Trust's 2,450 units in Christchurch ([OCHT](https://ocht-org-nz.squarespace.com/community-housing); verify older share), Te Toi Mahana's ~1,900 Wellington homes ([WCC](https://wellington.govt.nz/community-support-and-resources/community-support/social-housing/community-housing-provider)) and Kāpiti's 118 older persons' units ([KCDC](https://www.kapiticoast.govt.nz/media/5hrfm5ma/review-of-older-persons-housing-stage-2-report.pdf)). No national count of dedicated seniors' units exists. The 8,000–12,000 council and community-housing figure is a bottom-up estimate, and the 10,000–15,000 range in the table adds Kāinga Ora homes reserved for older tenants. Wi-Fi is again the blocker, so landlord-provided Wi-Fi, or a bundled hotspot, is part of the offer.

### Home support, Māori and Pacific providers and NGOs reach the same people through trusted hands

Health NZ-funded home support reached **about 72,000 older people in 2024/25, about 48,000 at any one time** ([MoH MAG key facts](https://www.health.govt.nz/system/files/2026-08/aged-care-ministerial-advisory-group-report-key-facts-figures.pdf)). Contracts are consolidating, though. In August 2026 Health NZ declined to renew three Auckland providers serving about 4,500 people ([Enliven Northern](https://www.enlivennorthern.org.nz/about-us/news/healthnz-decision-puts-more-than-1200-home-support-workers-jobs-at-risk)). That makes a single pilot with a large surviving provider the realistic entry point.

Māori aged 65+ numbered **65,900 in June 2023** ([Figure.NZ / Stats NZ](https://figure.nz/chart/w4vKCUNAR47iOzZj-0zF9f9Hj3jKE6LZv)). Older Māori report more hearing loss: **32% against 28% for all 65+** ([NZMJ](https://nzmj.org.nz/journal/vol-134-no-1535/hearing-loss-and-hearing-service-experiences-among-older-maori-and-whanau-a-scoping-review)). Whānau Ora now runs through **four commissioning agencies from 1 July 2025** ([RNZ](https://www.rnz.co.nz/news/political/559554/te-puni-kokiri-reveals-new-whanau-ora-commissioning-agencies)), and Healthpoint lists **368 kaupapa Māori and 86 Pacific providers** ([Healthpoint](https://healthpoint.co.nz/community-health-and-social-services/kaupapa-maori-community-health-social/?services=200)). Whānau channels linking kaumātua, mokopuna and whānau overseas are a natural fit. So are papakāinga clusters such as Ngāti Whakaue's Manawa Gardens ([Te Rau Ora](https://terauora.com/poipoia-kaumatua/)). Winning them depends on te reo prompts, co-design and data-sovereignty assurances, not price.

Befriending NGOs are partners rather than buyers. St John Caring Caller has **more than 800 volunteers and over 1,250 clients** ([St John](https://www.stjohn.org.nz/news--info/news--articles/st-john-launches-hindi-caring-caller-service/)). Age Concern has **34 member councils** ([Age Concern NZ](https://ageconcern.org.nz/?p=1270)).

Overseas buyers enlarge the purchasing pool without adding users. Treasury puts the **NZ-born diaspora at about 915,000** ([Treasury AN25/10 via IDEAS](https://ideas.repec.org/p/nzt/nztans/an25-10.html)), many of them adult children of NZ grandparents.

### Disability, hospices, hospitals, schools and workplaces are niches

DSS funded **7,293 people in residential care at 31 December 2024, 6,154 of them in community group homes** ([MSD Cabinet paper](https://www.msd.govt.nz/documents/about-msd-and-our-work/publications-resources/information-releases/cabinet-papers/2025/stabilising-disability-support-services-funded-residential-care/paper-stabilising-disability-support-services-funded-residential-care.pdf)). IDEA Services supports more than 3,000 people with intellectual disabilities ([IHC](https://ihc.org.nz/idea-services)).

Hospices reached **20,181 people in 2024/25** ([Hospice NZ](https://www.hospice.org.nz/a_year_in_review_25)), but certified inpatient capacity is only **19 premises with 174 beds** ([MoH NGO hospital CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryNGOHospital.csv)). Hospices are cutting beds under funding pressure ([1News, May 2026](https://www.1news.co.nz/2026/05/16/hospices-turning-away-dying-patients-as-funding-shortfall-bites/)). That points to donor-funded loan pools of pairs for patients cared for at home, not to purchases from operating budgets.

Public hospitals are the weakest fit, despite **86 Health NZ hospital sites** ([Health NZ](https://www.healthnz.govt.nz/about-us/what-we-do/programmes-and-initiatives/public-hospitals)). Patient Wi-Fi varies by site. Wellington and Hutt hospitals required **login with the NHI number from the patient's wristband** ([Wellington.Scoop](https://wellington.scoop.co.nz/?p=97183)), which the radio cannot get past by design. The ward TAM of about 2,500 beds is an estimate, and its SAM is effectively nil until Health NZ IT allowlists devices.

Schools number **2,536, including 36 specialist schools** ([Education Counts](https://www.educationcounts.govt.nz/statistics/number-of-schools); verify). Licensed ECE services number **4,409** ([Education Counts](https://www.educationcounts.govt.nz/statistics/services); verify).

The **617,334 enterprises** ([Figure.NZ / Stats NZ](https://figure.nz/chart/IW0xisEu03j4YW09-kvSu2UMTHjeSwClL); verify) look large but are guarded by cheap licence-free UHF CB radios. On those, an ECOXGEAR twin pack is NZ$68.69 excluding GST ([PB Tech](https://www.pbtech.co.nz/product/HEAECR0008/ECOXGEAR-EcoX-UHF-CB-Handheld-radios-1W-2-Pk-Black)), and Teams Walkie Talkie is free to Teams users ([UC Today](https://uctoday.com/what-is-teams-walkie-talkie)). The workplace TAM is illustrative only. Real openings are churches, op-shops, community halls, marae and small motels with older volunteers or owners.

## Auckland and Canterbury lead on size; the provinces lead on need

### Older population, care capacity and connectivity by region

| Region | 65+ Jun 2026 | 75+ mid-2026 | 85+ mid-2026 | 75+ 2033 | ARC facilities | ARC beds | Beds per 1,000 aged 75+ | Households with internet 2023 | 65+ living alone |
|---|---|---|---|---|---|---|---|---|---|
| Northland | 46,920 | 20,300 | 4,600 | 26,400 | 26 | 1,518 | 75 | 85.7% | ~8,300 |
| Auckland | 253,760 | 112,600 | 29,600 | 150,520 | 187 | 11,451 | 102 | 92.2% | ~47,400 |
| Waikato | 95,775 | 42,700 | 10,100 | 54,870 | 62 | 4,022 | 94 | 89.2% | ~18,800 |
| Bay of Plenty | 71,460 | 33,300 | 8,600 | 40,300 | 45 | 2,861 | 86 | 89.9% | ~12,800 |
| Gisborne | 9,220 | 3,800 | 900 | 4,600 | 5 | 343 | 90 | 85.9% | ~1,900 |
| Hawke's Bay | 36,515 | 16,700 | 4,000 | 20,010 | 27 | 1,552 | 93 | 89.3% | ~7,300 |
| Taranaki | 26,610 | 12,000 | 3,100 | 15,270 | 26 | 1,510 | 126 | 88.2% | ~5,800 |
| Manawatū-Whanganui | 53,800 | 24,200 | 5,800 | 29,350 | 43 | 2,362 | 98 | 87.4% | ~12,400 |
| Wellington | 90,630 | 41,100 | 10,500 | 51,710 | 59 | 3,886 | 95 | 92.9% | ~22,200 |
| Tasman | 15,220 | 7,000 | 1,700 | 9,770 | 8 | 531 | 76 | 89.0% | ~2,400 |
| Nelson | 12,520 | 6,100 | 1,600 | 7,710 | 8 | 648 | 106 | 91.0% | ~2,700 |
| Marlborough | 12,720 | 6,000 | 1,400 | 7,110 | 8 | 561 | 94 | 88.3% | ~2,400 |
| West Coast | 8,720 | 3,400 | 700 | 4,610 | 4 | 227 | 67 | 82.6% | ~2,200 |
| Canterbury | 128,110 | 59,900 | 15,100 | 80,910 | 96 | 6,949 | 116 | 90.6% | ~29,200 |
| Otago | 48,080 | 20,900 | 5,200 | 26,660 | 44 | 2,132 | 102 | 90.5% | ~11,200 |
| Southland | 20,310 | 8,800 | 2,200 | 10,780 | 15 | 1,016 | 115 | 85.9% | ~5,400 |
| **New Zealand** | **930,520** | **418,700** | **105,100** | **540,600** | **663** | **41,569** | **99** | **90.45%** | **~192,200** |
| *Status* | *Official (provisional; TA-aggregated)* | *Estimate (interpolated)* | *Estimate* | *Official projection* | *Official* | *Official* | *Estimate* | *Official* | *Estimate (national share applied)* |

Sources: 65+ June 2026 from the [Stats NZ June 2026 subnational estimates xlsx](https://www.stats.govt.nz/assets/Uploads/Subnational-population-estimates/Subnational-population-estimates-At-30-June-2026/Download-data/subnational-population-estimates-at-30-june-2026-provisional.xlsx), with territorial authorities assigned to their main region. 75+, 85+ and 2033 from [Stats NZ projections via Figure.NZ](https://figure.nz/table/4MT2ckNlROUfSs4T). ARC from the [MoH aged-care CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryAgedCare.csv), with Health NZ districts mapped to regions. Internet access from [Census 2023 CEN23_FHH_016 via Figure.NZ](https://figure.nz/table/fhzBDP7BiRC9ObS8). Living alone is 49.4% of each region's one-person households from [CEN23_FHH_038 via Figure.NZ](https://figure.nz/table/aqBoWDmTQQMvhPBz). That method probably understates older regions and overstates Auckland.

### Consumer TAM, SAM and SOM by region (older relatives, NZ$229 pair)

The regional method repeats the national funnel. It subtracts each region's ARC residents aged 75+ (beds × 0.828), converts people to households at the national ratio (0.677), and scales each region's 2023 household internet rate by 0.796, so that the national figure equals the 72% assumption. The base SOM is 2.5% of SAM over five years. Every column apart from the inputs is an estimate.

| Region | 65+ households | Broad TAM NZ$m | 75+ households | Core TAM NZ$m | Usable Wi-Fi share | SAM households | SAM NZ$m | 75+ households offline | SOM base households | SOM NZ$m | Core TAM 2033 NZ$m |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Northland | 28,300 | 6.5 | 12,900 | 3.0 | 68% | 8,800 | 2.0 | 4,100 | 220 | 0.05 | 3.9 |
| Auckland | 151,000 | 34.6 | 69,800 | 16.0 | 73% | 51,200 | 11.7 | 18,600 | 1,280 | 0.29 | 21.9 |
| Waikato | 57,200 | 13.1 | 26,600 | 6.1 | 71% | 18,900 | 4.3 | 7,700 | 470 | 0.11 | 8.0 |
| Bay of Plenty | 42,700 | 9.8 | 20,900 | 4.8 | 72% | 15,000 | 3.4 | 5,900 | 375 | 0.09 | 5.9 |
| Gisborne | 5,500 | 1.3 | 2,400 | 0.5 | 68% | 1,600 | 0.4 | 750 | 40 | 0.01 | 0.7 |
| Hawke's Bay | 21,800 | 5.0 | 10,400 | 2.4 | 71% | 7,400 | 1.7 | 3,000 | 185 | 0.04 | 2.9 |
| Taranaki | 15,700 | 3.6 | 7,300 | 1.7 | 70% | 5,100 | 1.2 | 2,200 | 130 | 0.03 | 2.2 |
| Manawatū-Whanganui | 32,100 | 7.3 | 15,100 | 3.4 | 70% | 10,500 | 2.4 | 4,600 | 260 | 0.06 | 4.2 |
| Wellington | 54,100 | 12.4 | 25,600 | 5.9 | 74% | 19,000 | 4.3 | 6,700 | 475 | 0.11 | 7.5 |
| Tasman | 9,100 | 2.1 | 4,400 | 1.0 | 71% | 3,100 | 0.7 | 1,300 | 80 | 0.02 | 1.4 |
| Nelson | 7,400 | 1.7 | 3,800 | 0.9 | 72% | 2,700 | 0.6 | 1,000 | 70 | 0.02 | 1.1 |
| Marlborough | 7,600 | 1.7 | 3,700 | 0.9 | 70% | 2,600 | 0.6 | 1,100 | 65 | 0.02 | 1.0 |
| West Coast | 5,300 | 1.2 | 2,200 | 0.5 | 66% | 1,400 | 0.3 | 750 | 35 | 0.01 | 0.7 |
| Canterbury | 75,600 | 17.3 | 36,600 | 8.4 | 72% | 26,400 | 6.0 | 10,200 | 660 | 0.15 | 11.6 |
| Otago | 28,600 | 6.6 | 12,900 | 3.0 | 72% | 9,300 | 2.1 | 3,600 | 235 | 0.05 | 3.9 |
| Southland | 12,000 | 2.8 | 5,400 | 1.2 | 68% | 3,700 | 0.8 | 1,700 | 90 | 0.02 | 1.5 |
| **New Zealand** | **~554,000** | **126.9** | **~260,000** | **59.5** | **72%** | **~187,000** | **42.8** | **~73,000** | **~4,700** | **1.07** | **78.4** |

Regional totals differ from the national figures by rounding.

### Institutional segments by region

| Region | ARC TAM NZ$m (beds × NZ$134) | ARC SAM radios | ARC SAM NZ$m | Hospice inpatient beds | Schools (Jul 2025) | Notable landlord / provider anchors |
|---|---|---|---|---|---|---|
| Northland | 0.20 | 420 | 0.06 | 8 | 153 | Kaumātua providers; Foundation North |
| Auckland | 1.53 | 3,160 | 0.42 | 56 | 558 | Haumaru (1,475 units); 6,779-unit village pipeline |
| Waikato | 0.54 | 1,110 | 0.15 | 12 | 306 | 2,201-unit village pipeline |
| Bay of Plenty | 0.38 | 790 | 0.11 | 6 | 163 | Highest village penetration (21%); Rotorua 152 units |
| Gisborne | 0.05 | 95 | 0.01 | 0 | n/a | Lowest landline share (31%) |
| Hawke's Bay | 0.21 | 430 | 0.06 | 8 | n/a | |
| Taranaki | 0.20 | 415 | 0.06 | 5 | n/a | Highest beds per 75+ |
| Manawatū-Whanganui | 0.32 | 650 | 0.09 | 15 | n/a | |
| Wellington | 0.52 | 1,075 | 0.14 | 26 | 246 | Te Toi Mahana (~1,900); Urban Plus; Kāpiti 118 units |
| Tasman | 0.07 | 145 | 0.02 | 0 | n/a | Fastest 75+ growth to 2033 (+40%) |
| Nelson | 0.09 | 180 | 0.02 | 10 | n/a | |
| Marlborough | 0.08 | 155 | 0.02 | 4 | n/a | |
| West Coast | 0.03 | 65 | 0.01 | 0 | n/a | Lowest internet (82.6%) |
| Canterbury | 0.93 | 1,920 | 0.26 | 7 | 292 | OCHT (2,450 units); Age Concern Canterbury AVS |
| Otago | 0.29 | 590 | 0.08 | 9 | 145 | Dunedin ~1,000 council units (verify) |
| Southland | 0.14 | 280 | 0.04 | 8 | 81 | Lowest village penetration (6.6%) |
| **NZ** | **5.57** | **~11,500** | **1.54** | **174** | **2,536** | |

Sources: [MoH aged-care CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryAgedCare.csv) and [MoH NGO hospital CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryNGOHospital.csv) (official). School counts are from [Figure.NZ / MoE](https://figure.nz/chart/saoJkKqFYUFIMu8O) (verify). The eight unlisted regions together have 592 schools, by subtraction. Landlord anchors are from the sources cited in the previous section and [Village Guide](https://www.villageguide.co.nz/resource-centre/most-popular-retirement-village-locations).

The regional picture splits three ways.

**Auckland, Canterbury, Waikato and Wellington are about 60% of the core TAM** (NZ$36.4 million of NZ$59.5 million), and they have the best connectivity. That makes them the default launch regions.

**Tasman, Marlborough and the West Coast are the oldest per head**, at about 25% aged 65+ ([Stats NZ June 2026 release](https://www.stats.govt.nz/information-releases/subnational-population-estimates-at-30-june-2026/)), but they are small in absolute terms. Tasman's 75+ population grows fastest, by 40% to 2033.

**Northland, Gisborne, Southland and the West Coast have usable-Wi-Fi shares of 66–68%.** Their offline older households will need a bundled 4G router, Skinny Jump, or the copper switch-off trigger before the radio can work. They are also the regions with low landline shares: 35% of Northland households and 31% of Gisborne households had one in 2023 ([Figure.NZ](https://figure.nz/chart/aqr9KjNxvA6jeX1u)).

Canterbury is the strongest single pilot region. It has the second-largest core market, 116 ARC beds per 1,000 people aged 75+, OCHT's 2,450-unit portfolio, an active Age Concern visiting service with 206 volunteers ([Age Concern Canterbury](https://issuu.com/ageconcerncanterbury/docs/keeping_on_may_2023/s/25299187)), and Rātā Foundation as a possible co-funder.

## Ranked opportunities favour direct sales and seniors' housing

The ranking weighs four things: SAM size, fit with the product as designed, how quickly a sale or pilot can close, and whether someone other than the family will pay.

| Rank | Opportunity | SAM | Fit | Speed to revenue | Who pays | Verdict |
|---|---|---|---|---|---|---|
| 1 | Families buying for a 75+ parent living alone, with Wi-Fi | NZ$42.9m | Strong | Fast (direct, Christmas) | Adult children, incl. diaspora | Lead market |
| 2 | Seniors' social housing (Haumaru, OCHT, Te Toi Mahana, council units) | NZ$0.7–1.2m | Strong | Medium (pilot, then board) | Landlord + Lottery / Age-friendly grants | Best reference customer |
| 3 | Retirement villages: frailer residents, serviced apartments, split couples | NZ$1.5–2.0m | Moderate–strong | Medium; Ryman/Summerset build in-house | Operator or resident | Channel to B2C buyers |
| 4 | Aged residential care: family-paid, staff-time pitch | NZ$1.5m | Moderate | Slow (capped funding, Wi-Fi checks) | Families; activities budgets | Pilot with Heritage, Radius or Oceania |
| 5 | Māori and Pacific providers, kaumātua housing | ~NZ$7.6m (overlap) | Strong culturally | Slow (relationship-led) | Commissioning agencies, iwi trusts | Co-design partner |
| 6 | Befriending NGOs (Age Concern, St John Caring Caller) | Small | Strong conceptually | Medium (grant-funded pilots) | Grants | Referral channel |
| 7 | Home-support providers | NZ$4.6m (overlap) | Moderate | Slow (thin margins, consolidation) | Provider | One large-provider pilot |
| 8 | Kids' mini phone | NZ$41.6m | Strong for the category | Late (Tin Can first; child-safety duties) | Parents | Second product, after Stage 3 |
| 9 | Disability residential (IDEA Services) and EMS | NZ$0.5m | Moderate | Slow (assessor-led) | Provider; EMS loan | Niche |
| 10 | Hospice loan pools | ~NZ$0.1m | Moderate | Medium | Donors, bequests | Small, high-goodwill |
| 11 | Specialist schools and school offices | NZ$0.3m | Moderate | Fast, low value | Operations grant | Opportunistic |
| 12 | Workplaces (motels, churches, halls, marae) | Niche | Weak–moderate | Fast, low value | Business | Don't compete with UHF CB |
| 13 | Public hospital wards | ~0 | Blocked | Very slow (IT approval) | Ward or foundation | Defer |

The kids' product has the second-largest SAM yet ranks eighth. Its value depends on beating an incumbent that ships first, and on taking on child-data and toy-safety obligations the project has not started. Seniors' housing ranks above much larger segments for the opposite reason. A single landlord decision covers hundreds of isolated tenants. The cluster structure suits the 10-radio channel. And one successful pilot gives the consumer story the credible institutional endorsement it otherwise lacks.

### Funding pathways are pilot-sized, not roll-out-sized

| Pathway | What it funds | Fit for the radio | Status | Source |
|---|---|---|---|---|
| EMS, run by DSS within MSD and delivered by Enable NZ and Accessable | Loaned equipment, explicitly incl. "communication devices", for disabilities lasting 6+ months | Only if an assessor justifies a disability-related communication need, e.g. cognitive or dexterity impairment | Official criteria; how to join the supplier catalogue needs verifying | [Enable NZ](https://www.enable.co.nz/about-us/what-we-do/equipment-for-disabled-people/government-funded) |
| MSD Disability Allowance | Medical alarms from accredited suppliers only | Not eligible: the radio is not an alarm | Official | [Work and Income](https://www.workandincome.govt.nz/eligibility/health-and-disability/medical-alarms.html) |
| Office for Seniors Age-friendly Fund | NZ$5,000–20,000 for social connection and digital confidence projects | Strong: NZ$20,000 buys about 150 NZ$134 radio-and-channel packages | 2026 round closed 30 Sep 2026 | [Office for Seniors](https://www.officeforseniors.govt.nz/our-work/age-friendly-communities/apply-for-an-age-friendly-community-grant) |
| Lottery Grants Board | Community grants; NZ$311m allocated to committees for 2026/27 | Strong for provider-led pilots | Official | [DIA Community Matters](https://www.communitymatters.govt.nz/lottery-grants-board-committee-allocations) |
| Selwyn Foundation Ageing Well grants | Research and community innovation for ageing well | Good for a co-designed pilot | Official | [Selwyn Foundation](https://selwynfoundation.org.nz/careers/about-us/news/new-grants-to-support-research-and-community-innovation-for-ageing-well-launched-by-the-selwyn-foundation) |
| Whānau Ora commissioning agencies | Provider services and innovation, regionally | Whānau channels, kaumātua housing | Restructured July 2025; funding levels need verifying | [RNZ](https://www.rnz.co.nz/news/political/559554/te-puni-kokiri-reveals-new-whanau-ora-commissioning-agencies) |
| Skinny Jump | NZ$5/month broadband for eligible seniors | Removes the Wi-Fi barrier for low-income users | 2026 pause; current status needs verifying | [Skinny](https://www.skinny.co.nz/jump/about) |
| Health NZ procurement | Ward purchases below tender thresholds; not a Pharmac device | Hospital pilots only after IT approval | No relevant open fund found | [Pharmac](https://www.pharmac.govt.nz/news-and-resources/news/future-of-national-medical-device-procurement) |

Regional trusts (Foundation North, Trust Waikato, Rātā) and council positive-ageing budgets are plausible co-funders, but no figures were retrieved for them. Current Callaghan Innovation and MBIE R&D grant availability also needs checking before any business case relies on it.

## Wi-Fi, margins and Tin Can are the risks that matter

### Competitors are all one category away

No one in NZ sells a one-button Wi-Fi push-to-talk device for older people, but every substitute already sits on a shelf the radio would share. Senior phones cost NZ$109–199 and need a plan. Spacetalk watches cost NZ$189–285 plus about NZ$17 a month for the app and SIM ([PB Tech](https://www.pbtech.co.nz/product/WTHSLK000030/Spacetalk-Adventurer-2-Kids-Smartwatch---Dusk---4G-Phone); [Spark](https://www.spark.co.nz/online/shop/mobile-plans/pay-monthly/wearable-plan/)). Smart displays cost NZ$399. Kitcal's NZ-designed seniors' tablet uses a mobile-data subscription and needs no Wi-Fi ([Assistive NZ](https://assistive.co.nz/product/kitcal-tablet-for-seniors)), so it competes directly for the offline households the radio cannot reach. ElliQ is US-only ([ElliQ FAQ](https://elliq.com/pages/faqs)). Medical alarms at NZ$16–29 a week are complements: the radio's whole lifetime cost is less than a month of an alarm. The positioning that follows is "no monthly fee, no screen, just press and talk". The product must keep its "not an emergency device" line so it does not fall under alarm accreditation.

### The risks, ranked by how much they move the numbers

Connectivity is the largest risk. Moving the 75+ Wi-Fi share from 72% to 60% or 80% shifts the SAM by about NZ$7 million down or NZ$5 million up. Captive portals in rest homes, villages and hospitals could wipe out most of the institutional SAM.

Margin is second. At NZ$70–100 of parts per pair, a chain-retail launch leaves too little for warranty and support, and a slide to the NZ$199 floor removes about NZ$26 more per pair before GST.

Third is competition and timing. Tin Can reaches NZ in November 2026, and its own Christmas 2025 outage, noted in the repository's relay research, shows how a gifting rush punishes weak infrastructure.

Fourth is the shrinking need per head. Smartphone-literate cohorts are ageing into 75+, so the 79% skills gap among over-80s will narrow. The 46% growth in the 75+ population to 2033 offsets this only partly.

Fifth are institutional headwinds: capped ARC prices, the hospice funding crisis, home-support contract consolidation, and uncertainty in the Whānau Ora budget.

Last are legal and cultural duties: review of the "forever" channel promise under the Fair Trading Act and Consumer Guarantees Act, children's data rules for the kids' product, and Māori data-sovereignty expectations.

### Figures that need verifying before external use

Several load-bearing inputs came only from search extracts or dated sources. Before any figure in this report goes into a pitch deck or grant application, these need checking against primary data.

| Figure | Why it matters | How to verify |
|---|---|---|
| 72% usable Wi-Fi among 75+ households | Drives every SAM | Census 2023 telecommunications × household age crosstab (Aotearoa Data Explorer) |
| 75+/85+ mid-2026 by region (interpolated) | Drives core TAM | Stats NZ subnational estimates by age, 30 June 2026 (Aotearoa Data Explorer) |
| 65+ living alone by region | Targeting | Census 2023 living-arrangements crosstab |
| ~260,000 75+ households (35% living alone assumed) | Core TAM unit | Census 2023 household composition by age |
| MSD-funded alarms (50,000+ in 2021) | SOM benchmark | [MSD OIA, Dec 2025](https://msd.govt.nz/documents/about-msd-and-our-work/publications-resources/official-information-responses/2025/december/18122025-medical-alarms-funded-in-the-period-1-august-2024-to-31-august-2025-by-accredited-alarm-company.pdf) appendix |
| Tin Can NZ price and ship date | Kids' price ceiling | tincan.kids NZ store |
| Seniors' social-housing stock (8,000–15,000) | Segment size | NZCCSS / LGNZ / Kāinga Ora OIA |
| School, ECE and enterprise counts | Small segments | Education Counts; Stats NZ business demography Feb 2025 |
| Public hospital beds (MoH file incomplete) | Hospital TAM | Health NZ annual report or OIA |
| Skinny Jump availability | Offline-household fix | Skinny or partner libraries |
| Radio retail price, assembly, certification, warranty costs | Every NZ$ figure | Stage 2 costing |

## Conclusion

The NZ market for Grandad's radio is worth having. It is concentrated in roughly 187,000 connected over-75 households and grows by almost half within a decade. Its shape is what should change the plan. Because institutions mostly pay for people who are already in the household count, chasing rest homes, hospitals or home-support contracts as "bigger" markets is a category error. Their combined additive TAM, about NZ$7 million, is roughly an eighth of the core consumer TAM, and they carry the heaviest Wi-Fi and procurement friction. Institutions earn their place in a different way: as trust and distribution. A seniors' housing landlord, a village operator or an Age Concern pilot gives a family buyer the reassurance a new brand cannot, and a Lottery or Age-friendly grant pays for it.

Two implications follow. First, the business is limited less by TAM than by unit economics and connectivity. The base-case SOM of about 4,700 households barely clears the service design's 1,000-subscriber maintenance threshold. Direct sales, a NZ$229-or-higher price point, and a copper-switch-off marketing hook therefore matter more than any new segment. Second, the regional data argues for an urban launch with a provincial fix. Launch in Auckland, Canterbury, Waikato and Wellington, where Wi-Fi is most common. Meanwhile, design a bundled-connectivity option for Northland, Gisborne, Southland and the West Coast, where older people are most isolated and least connected, and where the radio would matter most if it could get online.
