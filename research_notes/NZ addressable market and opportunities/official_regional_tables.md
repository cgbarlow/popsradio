# Official NZ regional data tables for market sizing (aged care, hospitals, 65+/75+/85+, internet access, living alone)

All figures were computed on 15 Nov 2026 from primary files downloaded directly from the source sites. Raw files were saved to the session scratchpad (`/tmp/claude-0/-home-user-walkie-talkie/eb99f3ab-80a4-5c33-ba19-090b93081a94/scratchpad/dl` and `.../dl2`). The parsing scripts are `.../scratchpad/scripts/analyse.py` and `analyse2.py`; their raw outputs are `out1.md` and `out2.md`. The scratchpad is temporary, so copy anything worth keeping.

**Manual mappings used (flagged wherever applied):**
- **Health NZ district to regional council region (M1).** The MoH files still label premises by old DHB name. The 20 Health NZ districts have the same boundaries as the former DHBs. They map to regions as follows:
  - Northland → Northland
  - Waitematā, Auckland and Counties Manukau → Auckland
  - Waikato → Waikato
  - Lakes → Bay of Plenty
  - Bay of Plenty → Bay of Plenty
  - Tairāwhiti → Gisborne
  - Hawke's Bay → Hawke's Bay
  - Taranaki → Taranaki
  - MidCentral and Whanganui → Manawatū-Whanganui
  - Capital & Coast, Hutt Valley and Wairarapa → Wellington
  - Nelson Marlborough → Nelson / Tasman / Marlborough
  - West Coast → West Coast
  - Canterbury and South Canterbury → Canterbury
  - Southern → Otago / Southland

  Facility-level overrides, applied by premises town or postcode:
  - Nelson Marlborough: Blenheim, Picton, Havelock etc. → Marlborough. Richmond, Motueka, Takaka, Murchison etc. → Tasman. Nelson/Stoke → Nelson.
  - Southern: postcode 9600 or above → Southland, otherwise Otago.
  - Lakes: Taupō, Tūrangi and Mangakino → Waikato.
  - Waikato: Taumarunui → Manawatū-Whanganui.
  - MidCentral: Ōtaki → Wellington.

  Every premises in all three hospital/ARC files was assigned; none were unmatched. Small boundary straddles (e.g. Waitomo, Waitaki) are not split.
- **Territorial authority to region (M2).** This applies only to the June 2026 65+ column. TAs that straddle regions were assigned wholly to their main region:
  - Taupō → Waikato
  - Rotorua → Bay of Plenty
  - Waitomo → Waikato
  - Rangitīkei and Tararua → Manawatū-Whanganui
  - Stratford → Taranaki
  - Waitaki → Otago
  - Mackenzie → Canterbury

  Chatham Islands were excluded. This mapping moves at most a few hundred 65+ people between neighbouring regions.

## 1. Aged residential care (ARC): certified facilities and beds by district and region

### Takeaway
The MoH certified-provider file lists **663 certified aged-care premises with 41,569 certified beds** (file last-modified 12 Nov 2026). About 75% of premises (498) are certified for hospital-level care and 248 for dementia care. Auckland (11,451 beds), Canterbury (6,949) and Waikato (4,022) hold just under 54% of beds. The file gives **one bed total per premises, not beds by level of care**. The service-type columns below therefore show the number of facilities certified for each service, and the total beds at those facilities. They are not beds of that service type.

### Cited Findings
- Source file: [MoH Legal Entity Summary – Aged Care (CSV)](https://www.health.govt.nz/system/files/LegalEntitySummaryAgedCare.csv). It has 663 rows, all with "Certification Service Type = Aged Care". Fields include Service Types, Total Beds, premises address, DHB Name and certificate end date. HTTP Last-Modified is Thu 12 Nov 2026; downloaded 15 Nov 2026. Certificates in the file run to 2027–2029.
- Service-type certifications across the 663 premises:

  | Service type | Premises certified |
  |---|---|
  | Rest home care | 617 |
  | Geriatric (hospital-level) | 496 |
  | Medical (hospital-level) | 480 |
  | Dementia care | 248 |
  | Physical disability | 71 |
  | Psychogeriatric | 33 |
  | Intellectual disability | 19 |
  | Sensory | 7 |
  | Psychiatric | 7 |
  | Maternity | 4 |
  | Mental health | 1 |

  Source: [MoH CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryAgedCare.csv).
- The most common mixes are:
  - rest home + geriatric + medical: 277
  - rest home + geriatric + medical + dementia: 174
  - rest home only: 109
  - dementia only: 27
  - rest home + dementia: 20
  - all five, including psychogeriatric: 10

  The largest single premises has 284 beds. Source: [MoH CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryAgedCare.csv).

**Table 1a – ARC by Health NZ district (old DHB label in file).** Each cell is facilities / total beds. A facility appears in every service column it is certified for.

| District | Facilities | Beds | Rest home | Hosp-geriatric | Hosp-medical | Dementia | Psychogeriatric | Res. disability (phys/intel/sens/psych) | Any hospital-level |
|---|---|---|---|---|---|---|---|---|---|
| Northland | 26 | 1,518 | 25 / 1,474 | 21 / 1,365 | 20 / 1,298 | 12 / 911 | 1 / 55 | 3 / 183 | 21 / 1,365 |
| Waitematā | 72 | 4,455 | 66 / 4,197 | 56 / 4,057 | 52 / 3,812 | 27 / 2,251 | 3 / 308 | 9 / 568 | 56 / 4,057 |
| Auckland | 69 | 4,114 | 64 / 3,899 | 47 / 3,505 | 43 / 3,339 | 20 / 1,705 | 2 / 143 | 9 / 772 | 48 / 3,546 |
| Counties Manukau | 46 | 2,882 | 42 / 2,728 | 35 / 2,610 | 33 / 2,448 | 13 / 929 | 2 / 194 | 7 / 591 | 35 / 2,610 |
| Waikato | 58 | 3,810 | 57 / 3,780 | 54 / 3,674 | 54 / 3,674 | 28 / 2,103 | 2 / 160 | 3 / 271 | 54 / 3,674 |
| Lakes | 13 | 903 | 13 / 903 | 10 / 814 | 10 / 814 | 5 / 517 | 1 / 94 | 2 / 268 | 10 / 814 |
| Bay of Plenty | 37 | 2,220 | 36 / 2,184 | 29 / 1,963 | 27 / 1,843 | 14 / 1,011 | 0 / 0 | 2 / 74 | 29 / 1,963 |
| Tairāwhiti | 5 | 343 | 5 / 343 | 5 / 343 | 5 / 343 | 3 / 272 | 0 / 0 | 0 / 0 | 5 / 343 |
| Hawke's Bay | 27 | 1,552 | 24 / 1,411 | 17 / 1,299 | 16 / 1,226 | 9 / 730 | 2 / 102 | 1 / 46 | 17 / 1,299 |
| Taranaki | 26 | 1,510 | 24 / 1,441 | 18 / 1,282 | 16 / 1,181 | 10 / 671 | 1 / 41 | 4 / 287 | 18 / 1,282 |
| MidCentral | 32 | 1,746 | 31 / 1,720 | 24 / 1,483 | 24 / 1,483 | 15 / 905 | 1 / 26 | 5 / 376 | 24 / 1,483 |
| Whanganui | 11 | 590 | 10 / 564 | 8 / 516 | 8 / 516 | 4 / 229 | 1 / 87 | 0 / 0 | 8 / 516 |
| Capital & Coast | 32 | 2,230 | 29 / 2,148 | 24 / 1,910 | 24 / 1,910 | 11 / 1,000 | 4 / 214 | 3 / 202 | 24 / 1,910 |
| Hutt Valley | 14 | 1,086 | 13 / 1,001 | 11 / 942 | 11 / 942 | 6 / 607 | 1 / 85 | 1 / 68 | 11 / 942 |
| Wairarapa | 12 | 546 | 10 / 494 | 8 / 431 | 8 / 431 | 4 / 129 | 0 / 0 | 1 / 78 | 8 / 431 |
| Nelson Marlborough | 24 | 1,740 | 23 / 1,687 | 19 / 1,544 | 19 / 1,544 | 10 / 879 | 2 / 115 | 2 / 258 | 19 / 1,544 |
| West Coast | 4 | 227 | 4 / 227 | 4 / 227 | 4 / 227 | 1 / 68 | 0 / 0 | 0 / 0 | 4 / 227 |
| Canterbury | 85 | 6,323 | 75 / 5,848 | 63 / 5,439 | 62 / 5,377 | 34 / 3,002 | 6 / 489 | 11 / 918 | 63 / 5,439 |
| South Canterbury | 11 | 626 | 11 / 626 | 8 / 553 | 8 / 553 | 3 / 246 | 1 / 79 | 2 / 133 | 8 / 553 |
| Southern | 59 | 3,148 | 55 / 2,989 | 35 / 2,368 | 36 / 2,375 | 19 / 1,334 | 3 / 321 | 10 / 703 | 36 / 2,375 |
| **NZ total** | **663** | **41,569** | 617 / 39,664 | 496 / 36,325 | 480 / 35,336 | 248 / 19,499 | 33 / 2,513 | 75 / 5,796 | 498 / 36,373 |

Source: [MoH CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryAgedCare.csv), summed by the "DHB Name" field.

**Table 1b – ARC by regional council region** (uses mapping M1).

| Region | Facilities | Beds | Rest home | Hosp-geriatric | Dementia | Psychogeriatric | Res. disability | Any hospital-level |
|---|---|---|---|---|---|---|---|---|
| Northland | 26 | 1,518 | 25 / 1,474 | 21 / 1,365 | 12 / 911 | 1 / 55 | 3 / 183 | 21 / 1,365 |
| Auckland | 187 | 11,451 | 172 / 10,824 | 138 / 10,172 | 60 / 4,885 | 7 / 645 | 25 / 1,931 | 139 / 10,213 |
| Waikato | 62 | 4,022 | 61 / 3,992 | 57 / 3,868 | 30 / 2,209 | 2 / 160 | 3 / 271 | 57 / 3,868 |
| Bay of Plenty | 45 | 2,861 | 44 / 2,825 | 35 / 2,533 | 17 / 1,422 | 1 / 94 | 4 / 342 | 35 / 2,533 |
| Gisborne | 5 | 343 | 5 / 343 | 5 / 343 | 3 / 272 | 0 / 0 | 0 / 0 | 5 / 343 |
| Hawke's Bay | 27 | 1,552 | 24 / 1,411 | 17 / 1,299 | 9 / 730 | 2 / 102 | 1 / 46 | 17 / 1,299 |
| Taranaki | 26 | 1,510 | 24 / 1,441 | 18 / 1,282 | 10 / 671 | 1 / 41 | 4 / 287 | 18 / 1,282 |
| Manawatū-Whanganui | 43 | 2,362 | 41 / 2,310 | 33 / 2,049 | 19 / 1,134 | 2 / 113 | 5 / 376 | 33 / 2,049 |
| Wellington | 59 | 3,886 | 53 / 3,667 | 43 / 3,283 | 21 / 1,736 | 5 / 299 | 5 / 348 | 43 / 3,283 |
| Tasman | 8 | 531 | 8 / 531 | 6 / 464 | 3 / 286 | 0 / 0 | 0 / 0 | 6 / 464 |
| Nelson | 8 | 648 | 7 / 595 | 6 / 547 | 4 / 309 | 1 / 53 | 1 / 97 | 6 / 547 |
| Marlborough | 8 | 561 | 8 / 561 | 7 / 533 | 3 / 284 | 1 / 62 | 1 / 161 | 7 / 533 |
| West Coast | 4 | 227 | 4 / 227 | 4 / 227 | 1 / 68 | 0 / 0 | 0 / 0 | 4 / 227 |
| Canterbury | 96 | 6,949 | 86 / 6,474 | 71 / 5,992 | 37 / 3,248 | 7 / 568 | 13 / 1,051 | 71 / 5,992 |
| Otago | 44 | 2,132 | 40 / 1,973 | 25 / 1,536 | 14 / 772 | 2 / 195 | 5 / 352 | 26 / 1,543 |
| Southland | 15 | 1,016 | 15 / 1,016 | 10 / 832 | 5 / 562 | 1 / 126 | 5 / 351 | 10 / 832 |
| **NZ total** | **663** | **41,569** | 617 / 39,664 | 496 / 36,325 | 248 / 19,499 | 33 / 2,513 | 75 / 5,796 | 498 / 36,373 |

Source: [MoH CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryAgedCare.csv), with mapping M1. The hospital-medical column is omitted here; it is almost identical to hospital-geriatric (see Table 1a).

### Inferences
- **Certified beds per 1,000 people aged 75+.** Nationally this is about 99: 41,569 beds against about 418,700 people aged 75+ at mid-2026 (the interpolated figure in Table 3). Most residents are 75+, so this ratio is the usual planning metric.
- **Facility counts as a B2B target list.** The 663 premises are the natural B2B list (activities coordinators, nurse-call adjuncts). About 187 are in Auckland, 96 in Canterbury and 62 in Waikato. The CSV includes the operator legal name, premises address and website, so it can be used as a sales list directly.
- **Bed counts by care level.** Beds at hospital-certified facilities (36,373) are not hospital-level beds. Most dual-certified premises can use beds at either rest-home or hospital level. Contracted-bed or occupancy data by level is needed for that split.

### Gaps
- There is no beds-by-level-of-care split in the MoH file; it gives one total per premises. The HNZ00202368 OIA release or Health NZ/TAS ARC occupancy data would be needed.
- The file gives no occupancy or resident counts. Certified beds are capacity, not residents.

## 2. Public and private (NGO) hospitals: certified facilities and beds by district and region

### Takeaway
The MoH certified-provider files for public hospitals (89 premises, 9,523 beds) and NGO/private hospitals (75 premises, 1,899 beds) can be parsed. However, **the public-hospital file is clearly incomplete**. Several major base hospitals are absent, including Waikato, Tauranga, Rotorua, Taranaki Base (New Plymouth) and Te Nīkau Grey. Its totals are a floor and must not be used as regional public-bed totals. The NGO file gives a usable list of **39 private surgical hospitals (1,362 beds)** and **19 certified inpatient hospices (174 beds)**. No residential-disability certified-provider CSV could be found.

### Cited Findings
- Source files (HTTP Last-Modified Thu 12 Nov 2026; downloaded 15 Nov 2026):
  - [Legal Entity Summary – Public Hospital (CSV)](https://www.health.govt.nz/system/files/LegalEntitySummaryPublicHospital.csv): 89 premises
  - [Legal Entity Summary – NGO Hospital (CSV)](https://www.health.govt.nz/system/files/LegalEntitySummaryNGOHospital.csv): 75 premises
  - [Legal Entity Summary – Fertility (CSV)](https://www.health.govt.nz/system/files/LegalEntitySummaryFertility.csv): 8 premises, not relevant

  The HTML index page (health.govt.nz "certified providers") returned a Cloudflare challenge (HTTP 403), so file names were found by trial. Names tried that returned 404:
  - `...PrivateHospital.csv`
  - `...ResidentialDisability.csv`
  - `...Hospice.csv`
  - `...MentalHealth.csv`
  - `...Disability.csv`
  - and similar variants
- Examples showing the public file is incomplete, all from the [Public Hospital CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryPublicHospital.csv):
  - Waikato district has 12 premises and 337 beds in total. They include Thames (52 beds), Henry Rongomau Bennett Centre (125 mental health beds), Tokoroa, Te Kuiti and Taumarunui. There is no Waikato Hospital.
  - Bay of Plenty has only Whakatāne Hospital (96) and Bethlehem Birthing Centre (12); Tauranga Hospital is missing.
  - Lakes has only Taupō Hospital (19).
  - Taranaki has only Hāwera Hospital (14).
  - West Coast has only Buller Health (7) and Kahurangi Dementia Unit (17).
- The large hospitals that are listed include:
  - Auckland City Hospital: 1,187 beds
  - Whangārei Hospital: 372
  - Dunedin Hospital: 361
  - Nelson Hospital: 187
  - Southland Hospital: 168

  Source: [Public Hospital CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryPublicHospital.csv).

**Table 2a – Public hospitals as listed (INCOMPLETE; a floor only), by region (mapping M1).** Cells are premises / beds. Categories are derived from the Service Types field:
- **Acute:** includes medical or surgical services.
- **MH-only:** mental health, psychiatric or psychogeriatric only.
- **Maternity-only:** maternity services only.

| Region | All | Acute | Maternity-only | MH/psychogeriatric-only | Other |
|---|---|---|---|---|---|
| Northland | 8 / 474 | 4 / 448 | 0 / 0 | 4 / 26 | 0 / 0 |
| Auckland | 19 / 3,653 | 8 / 3,323 | 3 / 35 | 6 / 233 | 2 / 62 |
| Waikato | 12 / 342 | 6 / 172 | 1 / 5 | 5 / 165 | 0 / 0 |
| Bay of Plenty | 2 / 108 | 1 / 96 | 1 / 12 | 0 / 0 | 0 / 0 |
| Gisborne | 1 / 115 | 1 / 115 | 0 / 0 | 0 / 0 | 0 / 0 |
| Hawke's Bay | 3 / 412 | 3 / 412 | 0 / 0 | 0 / 0 | 0 / 0 |
| Taranaki | 1 / 14 | 1 / 14 | 0 / 0 | 0 / 0 | 0 / 0 |
| Manawatū-Whanganui | 6 / 556 | 5 / 548 | 1 / 8 | 0 / 0 | 0 / 0 |
| Wellington | 6 / 1,157 | 4 / 1,010 | 0 / 0 | 2 / 147 | 0 / 0 |
| Tasman | 3 / 23 | 1 / 8 | 1 / 5 | 1 / 10 | 0 / 0 |
| Nelson | 3 / 226 | 1 / 187 | 0 / 0 | 2 / 39 | 0 / 0 |
| Marlborough | 2 / 81 | 1 / 75 | 0 / 0 | 0 / 0 | 1 / 6 |
| West Coast | 2 / 24 | 1 / 7 | 0 / 0 | 1 / 17 | 0 / 0 |
| Canterbury | 14 / 1,670 | 9 / 1,425 | 3 / 40 | 1 / 168 | 1 / 37 |
| Otago | 6 / 500 | 4 / 492 | 2 / 8 | 0 / 0 | 0 / 0 |
| Southland | 1 / 168 | 1 / 168 | 0 / 0 | 0 / 0 | 0 / 0 |
| **Total listed** | **89 / 9,523** | 51 / 8,500 | 12 / 113 | 22 / 805 | 4 / 105 |

Source: [Public Hospital CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryPublicHospital.csv). By district (old DHB label): Auckland 1,367 beds; Waitematā 1,188; Counties Manukau 1,098; Canterbury 1,535; Capital & Coast 746; Southern 668; MidCentral 405; Hawke's Bay 412; Hutt Valley 322; Nelson Marlborough 330; Northland 474. Full district table is in `out1.md`.

**Table 2b – NGO/private hospitals by region (mapping M1).** Categories are derived:
- **Hospice:** name contains "hospice".
- **Private surgical:** Service Types include Surgical.
- **Mental health:** e.g. Ashburn Clinic, Dunedin, 66 beds.
- **Maternity:** e.g. Birthcare Auckland (45); Clutha Health First (17); Winton (6).
- **Other medical/rehab:** ABI Auckland (36) and ABI Wellington (26) brain-injury rehab; Pūmau Ki Te Aroha (24); Dunstan Hospital (28).

| Region | All | Private surgical | Hospice | Maternity | Mental health | Other med/rehab |
|---|---|---|---|---|---|---|
| Northland | 2 / 29 | 1 / 21 | 1 / 8 | 0 / 0 | 0 / 0 | 0 / 0 |
| Auckland | 25 / 660 | 14 / 471 | 5 / 56 | 4 / 83 | 1 / 14 | 1 / 36 |
| Waikato | 8 / 213 | 3 / 140 | 1 / 12 | 3 / 37 | 0 / 0 | 1 / 24 |
| Bay of Plenty | 2 / 28 | 1 / 22 | 1 / 6 | 0 / 0 | 0 / 0 | 0 / 0 |
| Gisborne | 1 / 7 | 1 / 7 | 0 / 0 | 0 / 0 | 0 / 0 | 0 / 0 |
| Hawke's Bay | 4 / 78 | 2 / 64 | 1 / 8 | 0 / 0 | 1 / 6 | 0 / 0 |
| Taranaki | 2 / 44 | 1 / 39 | 1 / 5 | 0 / 0 | 0 / 0 | 0 / 0 |
| Manawatū-Whanganui | 4 / 69 | 2 / 54 | 2 / 15 | 0 / 0 | 0 / 0 | 0 / 0 |
| Wellington | 8 / 223 | 5 / 171 | 2 / 26 | 0 / 0 | 0 / 0 | 1 / 26 |
| Tasman | 0 / 0 | 0 / 0 | 0 / 0 | 0 / 0 | 0 / 0 | 0 / 0 |
| Nelson | 2 / 32 | 1 / 22 | 1 / 10 | 0 / 0 | 0 / 0 | 0 / 0 |
| Marlborough | 2 / 13 | 1 / 9 | 1 / 4 | 0 / 0 | 0 / 0 | 0 / 0 |
| West Coast | 0 / 0 | 0 / 0 | 0 / 0 | 0 / 0 | 0 / 0 | 0 / 0 |
| Canterbury | 5 / 252 | 4 / 245 | 1 / 7 | 0 / 0 | 0 / 0 | 0 / 0 |
| Otago | 6 / 191 | 2 / 71 | 1 / 9 | 1 / 17 | 1 / 66 | 1 / 28 |
| Southland | 4 / 60 | 1 / 26 | 1 / 8 | 2 / 26 | 0 / 0 | 0 / 0 |
| **Total** | **75 / 1,899** | 39 / 1,362 | 19 / 174 | 10 / 163 | 3 / 86 | 4 / 114 |

Source: [NGO Hospital CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryNGOHospital.csv).
- Certified hospices with beds, from the [NGO Hospital CSV](https://www.health.govt.nz/system/files/LegalEntitySummaryNGOHospital.csv):

  | Hospice | Beds |
  |---|---|
  | Harbour Hospice North Shore | 15 |
  | Mercy Hospice | 13 |
  | Arohanui Hospice | 10 |
  | Nelson Tasman Hospice | 10 |
  | Otago Community Hospice | 9 |
  | Hospice Southland | 8 |
  | North Haven Hospice | 8 |
  | Te Omanga Hospice | 8 |
  | Hospice South Canterbury | 7 |
  | Hibiscus Hospice | 6 |
  | Te Rangimarie Hospice | 5 |
  | Hospice Whanganui | 5 |
  | Hospice Marlborough | 4 |
  | others | — |

  Total: 19 premises, 174 beds.

### Inferences
- **Usable data.** For hospital-ward sizing, only the private surgical (1,362 beds) and hospice (174 beds) counts from the NGO file are reliable as listed. They are small, short-stay segments.
- **Public bed totals.** Use the Health NZ annual report or an OIA for public totals. The MoH public file's omissions look like large premises that are missing, possibly certificates in renewal or listed under a different entity file. The NZ total of 9,523 is therefore far below true public capacity, probably well over 10,000.
- **Possible definition gap.** The hospice count (19) is lower than the number of NZ hospice services (about 30+). Some hospices may have no inpatient unit, or may be certified under another file.

### Gaps
- A residential disability certified-provider CSV was not found (name guesses 404'd; the index page was Cloudflare-blocked).
- There are no complete public-hospital bed totals. Waikato, Tauranga, Rotorua, Taranaki Base and Grey hospitals are absent from the file, so it cannot give a full public-bed table.
- Mental-health inpatient totals are partial: 805 beds at MH-only public premises plus MH wards inside general hospitals, which are not separable.

## 3. Population aged 65+, 75+ and 85+ by region: June 2026 estimates and 2033/2043 projections

### Takeaway
At 30 June 2026 (provisional), NZ had **930,520 people aged 65+** (17.4% of 5,357,300). This is up from 901,790 in 2025 and 873,860 in 2024. Using Stats NZ's 2023-base medium projections, 65+ reaches **about 1.13 million by 2033 and 1.33 million by 2043**. 75+ rises from 370,400 (2023) to 540,600 (2033) and 723,500 (2043). 85+ rises from 92,100 to 149,400 and 226,900. All 16 regions are now filled from official files.

### Cited Findings
- National 65+ at 30 June: **873,860 (2024), 901,790 (2025 P), 930,520 (2026 P)**. Totals were 5,289,900, 5,321,000 and 5,357,300. Source: [Stats NZ, Subnational population estimates: At 30 June 2026 (xlsx, Table 2)](https://www.stats.govt.nz/assets/Uploads/Subnational-population-estimates/Subnational-population-estimates-At-30-June-2026/Download-data/subnational-population-estimates-at-30-june-2026-provisional.xlsx); release page [here](https://www.stats.govt.nz/information-releases/subnational-population-estimates-at-30-june-2026/).
- The June 2026 release notes that TAs whose growth slowed relative to 2025 "generally had higher proportions of people aged 65 years or older". National growth was 0.7% in the year to June 2026. Source: [Stats NZ release page](https://www.stats.govt.nz/information-releases/subnational-population-estimates-at-30-june-2026/).
- The June 2026 file gives only broad age groups (0–14, 15–39, 40–64, 65+) and only for TAs and Auckland local boards. The regional 65+ column below is a TA aggregation (mapping M2). The TA-aggregated NZ sum (930,370) differs from the published total (930,520) only by Chatham Islands and area outside TAs.
- Five-year age groups by region (2023 estimate, then 2028–2053 projections) come from Stats NZ's dataset *Subnational population projections, by age and sex, 2023(base)–2053 (2025 update)*, released 25 Sep 2025. They were downloaded as CSV via the [Figure.NZ mirror (table 4MT2ckNlROUfSs4T)](https://figure.nz/table/4MT2ckNlROUfSs4T).
- The Figure.NZ mirror was checked against [Stats NZ's own projections xlsx, Table 4](https://www.stats.govt.nz/assets/Uploads/Subnational-population-projections/Subnational-population-projections-2023base-2053/Download-data/subnational-population-projections-2023base-2053.xlsx), and the two match. Sample 65+ values:
  - Northland: 42,900 (2023), 56,300 (2033), 65,200 (2043)
  - Auckland: 228,400, 321,100, 403,900
  - West Coast: 7,600, 10,500, 11,800
  - NZ: 848,000, 1,125,500, 1,332,400

  The Stats NZ xlsx itself gives only 65+ (no 75+/85+) for regions.

**Table 3 – Older population by regional council region** (people; medium projection).
- Column A: June 2026 provisional estimate, aggregated from TAs (M2).
- 2023: estimated resident population (ERP) at 30 June 2023.
- 2028, 2033 and 2043: projections.

| Region | 65+ Jun 2026 (A) | 65+ 2023 | 75+ 2023 | 85+ 2023 | 65+ 2033 | 75+ 2033 | 85+ 2033 | 65+ 2043 | 75+ 2043 | 85+ 2043 |
|---|---|---|---|---|---|---|---|---|---|---|
| Northland | 46,920 | 42,910 | 17,930 | 4,000 | 56,250 | 26,400 | 6,550 | 65,220 | 34,970 | 10,130 |
| Auckland | 253,760 | 228,400 | 98,080 | 25,240 | 321,140 | 150,520 | 42,900 | 403,880 | 213,330 | 67,650 |
| Waikato | 95,775 | 87,710 | 37,960 | 8,970 | 115,650 | 54,870 | 14,320 | 137,770 | 73,860 | 22,010 |
| Bay of Plenty | 71,460 | 65,930 | 30,310 | 7,470 | 81,180 | 40,300 | 11,820 | 93,460 | 50,530 | 16,180 |
| Gisborne | 9,220 | 8,540 | 3,480 | 870 | 10,180 | 4,600 | 990 | 10,920 | 5,660 | 1,490 |
| Hawke's Bay | 36,515 | 34,170 | 15,230 | 3,690 | 41,430 | 20,010 | 5,390 | 45,020 | 24,570 | 7,340 |
| Taranaki | 26,610 | 24,440 | 10,780 | 2,900 | 31,650 | 15,270 | 4,020 | 36,770 | 20,010 | 6,090 |
| Manawatū-Whanganui | 53,800 | 49,780 | 22,140 | 5,440 | 61,270 | 29,350 | 7,450 | 66,590 | 36,920 | 10,590 |
| Wellington | 90,630 | 82,900 | 36,870 | 9,270 | 109,980 | 51,710 | 14,880 | 130,230 | 70,180 | 21,470 |
| Tasman | 15,220 | 13,710 | 5,790 | 1,260 | 19,190 | 9,770 | 2,850 | 22,420 | 13,180 | 4,750 |
| Nelson | 12,520 | 11,620 | 5,420 | 1,420 | 14,830 | 7,710 | 2,440 | 16,240 | 9,540 | 3,330 |
| Marlborough | 12,720 | 11,970 | 5,360 | 1,160 | 14,340 | 7,110 | 2,150 | 15,000 | 8,300 | 2,710 |
| West Coast | 8,720 | 7,640 | 2,940 | 620 | 10,520 | 4,610 | 970 | 11,760 | 6,190 | 1,700 |
| Canterbury | 128,110 | 116,000 | 51,260 | 13,080 | 160,310 | 80,910 | 22,610 | 191,230 | 108,730 | 36,110 |
| Otago | 48,080 | 43,410 | 18,740 | 4,630 | 54,810 | 26,660 | 7,320 | 61,580 | 33,920 | 11,160 |
| Southland | 20,310 | 18,760 | 8,130 | 2,160 | 22,670 | 10,780 | 2,750 | 24,230 | 13,510 | 4,110 |
| **New Zealand** | **930,520** (published) | 847,900 | 370,400 | 92,100 | 1,125,500 | 540,600 | 149,400 | 1,332,500 | 723,500 | 226,900 |

Sources: the [June 2026 xlsx](https://www.stats.govt.nz/assets/Uploads/Subnational-population-estimates/Subnational-population-estimates-At-30-June-2026/Download-data/subnational-population-estimates-at-30-june-2026-provisional.xlsx) for column A, and the [Figure.NZ / Stats NZ projections CSV](https://figure.nz/table/4MT2ckNlROUfSs4T) for the rest. Values were summed from five-year groups (65–69 … 90+), Sex = Total, Medium projection. The source rounds values, so sums can differ from Stats NZ's published totals by ±100. 2028 values (65+/75+/85+) for NZ are 994,100 / 450,900 / 113,700; regional 2028 values are in `out2.md`.

**Derived (ESTIMATE, not official): 75+ and 85+ at mid-2026.** These are linear interpolations between 2023 ERP and the 2028 projection (60% of the way).

| Region | 75+ | 85+ |
|---|---|---|
| Northland | 20,300 | 4,600 |
| Auckland | 112,600 | 29,600 |
| Waikato | 42,700 | 10,100 |
| Bay of Plenty | 33,300 | 8,600 |
| Gisborne | 3,800 | 900 |
| Hawke's Bay | 16,700 | 4,000 |
| Taranaki | 12,000 | 3,100 |
| Manawatū-Whanganui | 24,200 | 5,800 |
| Wellington | 41,100 | 10,500 |
| Tasman | 7,000 | 1,700 |
| Nelson | 6,100 | 1,600 |
| Marlborough | 6,000 | 1,400 |
| West Coast | 3,400 | 700 |
| Canterbury | 59,900 | 15,100 |
| Otago | 20,900 | 5,200 |
| Southland | 8,800 | 2,200 |
| **NZ** | **418,700** | **105,100** |

### Inferences
- **Growth of the oldest groups.** 75+ grows about 46% from 2023 to 2033, and 85+ about 62%. The core "grandad" segment is therefore growing much faster than 65+ overall (about 33%).
- **Fastest-growing regions for 75+ (2023→2043).** Tasman grows about 128%, Canterbury 112%, Auckland 118%, West Coast 111% and Northland 95%. Marlborough (55%), Hawke's Bay (61%) and Gisborne (63%) grow slowest.
- **Older and slower regions.** The June 2026 65+ shares are highest in the smaller South Island and provincial regions, for example Tasman at about 25.5% (15,220 / 59,700), Marlborough at about 25.3% (12,720 / 50,300) and the West Coast at about 25.2% (8,720 / 34,640). Auckland's share is 13.8%.

### Gaps
- There are no official 75+/85+ regional estimates for June 2025 or June 2026. They exist in Aotearoa Data Explorer (dataset "Subnational population estimates (RC, SA2), by age and sex"), but ADE's data API is at api.data.stats.govt.nz, which the proxy blocked (CONNECT 403). The mid-2026 75+/85+ figures above are interpolations.
- There are no population figures by Health NZ district. Stats NZ publishes health-district estimates on ADE, which was not reachable. District figures would have to be built from TAs, which do not nest cleanly.

## 4. Household internet access by region (Census 2023), and by age

### Takeaway
At the 2023 Census, **90.45% of households that answered had internet access**. That leaves **about 155,600 stated households without internet**, nationally 9.5%. The offline rate is highest on the **West Coast (17.4%)**, in **Northland (14.3%)**, **Gisborne (14.1%)** and **Southland (14.1%)**. It is lowest in Wellington (7.1%) and Auckland (7.8%). No regional breakdown by age of occupant could be retrieved.

### Cited Findings
**Table 4 – Census 2023 household access to the internet, by region.**
- Base: households in occupied private dwellings.
- "Stated" excludes the 8.5% of households with no information.
- "Without internet" = stated households minus households with internet access.

| Region | Households (total) | Stated | With internet | % with internet | Without internet | % without | No telecom access at all |
|---|---|---|---|---|---|---|---|
| Northland | 70,476 | 60,090 | 51,519 | 85.74 | 8,571 | 14.3 | 834 (1.39%) |
| Auckland | 539,490 | 497,835 | 459,063 | 92.21 | 38,772 | 7.8 | 7,317 (1.47%) |
| Waikato | 177,543 | 159,597 | 142,314 | 89.17 | 17,283 | 10.8 | 1,968 (1.23%) |
| Bay of Plenty | 118,452 | 105,102 | 94,527 | 89.94 | 10,575 | 10.1 | 1,233 (1.17%) |
| Gisborne | 17,124 | 14,988 | 12,879 | 85.93 | 2,109 | 14.1 | 258 (1.72%) |
| Hawke's Bay | 62,964 | 53,460 | 47,718 | 89.26 | 5,742 | 10.7 | 516 (0.97%) |
| Taranaki | 48,108 | 43,545 | 38,400 | 88.18 | 5,145 | 11.8 | 456 (1.05%) |
| Manawatū-Whanganui | 95,187 | 86,655 | 75,729 | 87.39 | 10,926 | 12.6 | 1,065 (1.23%) |
| Wellington | 194,406 | 181,404 | 168,555 | 92.92 | 12,849 | 7.1 | 1,614 (0.89%) |
| Tasman | 21,864 | 20,028 | 17,823 | 88.99 | 2,205 | 11.0 | 165 (0.82%) |
| Nelson | 20,577 | 19,527 | 17,763 | 90.97 | 1,764 | 9.0 | 171 (0.88%) |
| Marlborough | 19,590 | 18,108 | 15,981 | 88.25 | 2,127 | 11.8 | 192 (1.06%) |
| West Coast | 14,205 | 12,444 | 10,284 | 82.64 | 2,160 | 17.4 | 207 (1.66%) |
| Canterbury | 248,550 | 233,454 | 211,473 | 90.58 | 21,981 | 9.4 | 2,196 (0.94%) |
| Otago | 91,563 | 86,112 | 77,958 | 90.53 | 8,154 | 9.5 | 768 (0.89%) |
| Southland | 40,185 | 36,996 | 31,785 | 85.91 | 5,211 | 14.1 | 462 (1.25%) |
| **New Zealand** | **1,780,527** | **1,629,543** | **1,473,933** | **90.45** | **155,610** | **9.5** | **19,428 (1.19%)** |

Source: Stats NZ 2023 Census dataset CEN23_FHH_016, *Access to telecommunication systems, total household income, and tenure of household (RC, TALB, SA2, Health), 2013, 2018, 2023*. It was downloaded as CSV via [Figure.NZ table fhzBDP7BiRC9ObS8](https://figure.nz/table/fhzBDP7BiRC9ObS8) (Tenure = Total, Census year 2023). Percentages are "% of total stated", as published. The Stats NZ dataset (ADE) is [here](https://explore.data.stats.govt.nz/vis?lc=en&df%5Bds%5D=nsiws-disseminate&df%5Bid%5D=CEN23_FHH_016&df%5Bag%5D=STATSNZ&df%5Bvs%5D=1.0).
- The same dataset also has Health district geography. Only the regional cut was downloaded here. Source: [Figure.NZ dataset notes](https://figure.nz/chart/A5Avu4x4uN0aC9Nn).

### Inferences
- **Regional demand for non-Wi-Fi options.** Regions with high offline rates and old populations (West Coast, Northland, Gisborne, Southland, Manawatū-Whanganui) are where a Wi-Fi-only device will most often need a bundled 4G router or SIM fallback.
- **Offline households in volume terms.** In volume terms, Auckland (38.8k), Canterbury (22.0k) and Waikato (17.3k) have the most offline households.
- **Apparent offline rate is an upper bound.** "Without internet" here includes households that answered but did not tick internet. The true offline rate among older-only households is likely higher than the regional average (see the national evidence in `connectivity_and_digital_inclusion.md`), but this was not verified by region.

### Gaps
- No Census 2023 internet access by age of occupant (e.g. households where everyone is 65+, or people aged 65+ in households without internet) by region was retrieved. The relevant ADE crosstabs (telecommunications by household composition or age) need the ADE API, which was blocked, and no Figure.NZ mirror was found.

## 5. Older people living alone by region (Census 2023)

### Takeaway
Census 2023 counted **389,352 one-person households** (21.9% of all households). The regional count is official, but **a 65+ split by region was not retrieved**. If the national share applies uniformly (49.4% of people living alone were 65+), about 192,000 older people live alone. On that basis Auckland has about 47k, Canterbury about 29k, Wellington about 22k and Waikato about 19k. This is an ESTIMATE that likely understates older regions and overstates Auckland.

### Cited Findings
**Table 5 – One-person households, Census 2023, by region**
- Count: official. % share: computed over *total* households, including not-stated.
- Est. 65+ living alone: ESTIMATE, equal to 49.4% × one-person households, using the national share of people living alone who are 65+ from `demographics_by_region.md` (192,201 of 389,352).

| Region | One-person households | Share of all households | Est. 65+ living alone (ESTIMATE) |
|---|---|---|---|
| Northland | 16,806 | 23.8% | ~8,300 |
| Auckland | 95,868 | 17.8% | ~47,400 |
| Waikato | 38,127 | 21.5% | ~18,800 |
| Bay of Plenty | 25,878 | 21.8% | ~12,800 |
| Gisborne | 3,909 | 22.8% | ~1,900 |
| Hawke's Bay | 14,718 | 23.4% | ~7,300 |
| Taranaki | 11,727 | 24.4% | ~5,800 |
| Manawatū-Whanganui | 25,119 | 26.4% | ~12,400 |
| Wellington | 44,886 | 23.1% | ~22,200 |
| Tasman | 4,911 | 22.5% | ~2,400 |
| Nelson | 5,436 | 26.4% | ~2,700 |
| Marlborough | 4,836 | 24.7% | ~2,400 |
| West Coast | 4,437 | 31.2% | ~2,200 |
| Canterbury | 59,034 | 23.8% | ~29,200 |
| Otago | 22,626 | 24.7% | ~11,200 |
| Southland | 10,965 | 27.3% | ~5,400 |
| **New Zealand** | **389,352** | **21.9%** | **~192,200** (official national: 192,201) |

Source: Stats NZ 2023 Census dataset CEN23_FHH_038, *Household composition by number of usual residents and number of bedrooms, 2013, 2018, 2023*. It was downloaded as CSV via [Figure.NZ table aqBoWDmTQQMvhPBz](https://figure.nz/table/aqBoWDmTQQMvhPBz) (Number of bedrooms = Total, 2023). The national one-person count (389,352) matches the Stats NZ living-alone figure cited in `demographics_by_region.md`.
- Figure.NZ's own charts give the one-person share as a % of *stated* households, for example West Coast 33.25% and Otago 25.4%. These are higher than the shares above because the base excludes not-stated households. Sources: [Figure.NZ Otago household composition](https://figure.nz/chart/eWp6Sa9MWEyPq9JD); [West Coast](https://figure.nz/chart/FU5D2Kf8uLAwYKC4).

### Inferences
- **Direction of the bias.** Older regions probably have a higher 65+ share among people living alone than the national 49.4%. The estimate column therefore likely understates the West Coast, Tasman, Marlborough, Northland and Bay of Plenty, and overstates Auckland.
- **A cross-check.** A second estimate applies the national 25.3% living-alone rate to regional 65+ ERP 2023 (Table 3). For example, Auckland comes out at about 57.8k and Canterbury at about 29.3k. The Auckland gap shows how uncertain the split is. Treat ±20% as the error band.

### Gaps
- An official count of 65+ living alone by region (Census 2023 "living arrangements" or "individuals in one-person households by age" crosstab) was not retrieved. It sits in ADE, which needs the blocked API host, and no Figure.NZ mirror was found in search.
