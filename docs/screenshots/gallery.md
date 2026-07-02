# Screenshot Gallery

Live captures from Furia services. PNGs captured via Playwright, SVGs rendered from live API responses.
Generated automatically by CI every build.

## API Gateway

![Swagger UI](../screenshots/swagger-ui.png)
*Swagger UI — 23 documented endpoints across 7 tag groups*

![Health Status](../screenshots/health.svg)
*Service health, C2 profile, loaded providers, platform status*

![Health Dashboard](../screenshots/health.png)
*Health endpoint — live capture from running interop-gateway*

## Marketplace

![All Extensions](../screenshots/marketplace-search-all.svg)
*98 modules in the marketplace (crate seeds + profiles)*

![All Extensions](../screenshots/marketplace-search.png)
*Marketplace search — all modules listed with names and descriptions*

![Simulation Extensions](../screenshots/marketplace-simulation-extensions.svg)
*Filter by kind: 20+ simulation extensions*

![Policy Extensions](../screenshots/marketplace-policy-extensions.svg)
*Filter by kind: 10+ policy extensions*

![Sensor Extensions](../screenshots/marketplace-sensor-extensions.svg)
*Filter by kind: 8+ sensor extensions*

## Extension Details

![IHL Module](../screenshots/module-ihl-detail.svg)
*furia-builtin-safe-ihl — policy, IHL safety gating*

![BDA Module](../screenshots/module-bda-detail.svg)
*durandal-bda — assessment, battle damage scoring*

![Voice Module](../screenshots/module-voice-detail.svg)
*durandal-voice-classifier — sensor, STT for C2 voice commands*

![Graph Module](../screenshots/module-graph-detail.svg)
*furia-graph — fusion, temporal entity graph*

![Module Detail](../screenshots/module-detail.png)
*Extension detail view with version, traits, security requirements*

## C2 Profiles

### Counter-UAS (C-UAS)

![C-UAS Profile](../screenshots/profile-c-uas-market.svg)
*profile-c-uas — found in marketplace with 5 extension dependencies*

### C4ISR Headquarters

![Furia HQ Profile](../screenshots/profile-furia-hq-market.svg)
*profile-furia-hq — full HQ with COP, intel, planning, BDA*

![Furia HQ](../screenshots/profile-furia-hq.png)
*Health endpoint when Furia HQ profile is active*

### Tactical Frontline

![Frontline Profile](../screenshots/profile-furia-frontline-market.svg)
*profile-furia-frontline — dismounted C2 with BFT, MEDEVAC*

### FPV + ISR Reconnaissance

![FPV ISR Profile](../screenshots/profile-fpv-isr-market.svg)
*profile-fpv-isr — single-operator drone ISR*

### Deep ISR Reconnaissance

![Deep ISR Profile](../screenshots/profile-isr-deep-market.svg)
*profile-isr-deep — multi-asset beyond-LOS reconnaissance*

### Search & Strike

![Search & Strike Profile](../screenshots/profile-search-strike-market.svg)
*profile-search-strike — find and engage with IHL gating*

### Manned-Unmanned Teaming

![MUM-T Profile](../screenshots/profile-mum-t-market.svg)
*profile-mum-t — helicopter + UAV teaming*

### Ground Control Station

![GCS Profile](../screenshots/profile-gs-like-market.svg)
*profile-gs-like — full ground control station*

### Maritime Domain Awareness

![Maritime Profile](../screenshots/profile-maritime-market.svg)
*profile-maritime — vessel tracking, BDA, routing*

### C2 Messaging

![Messaging Profile](../screenshots/profile-c2-messaging-market.svg)
*profile-c2-messaging — SitRep, OPORD, MEDEVAC*

![Messaging Status](../screenshots/messaging-status.svg)
*Military messaging service health*

![Messaging Inbox](../screenshots/messaging-inbox.svg)
*Message inbox — received SitRep messages*

## Adding More Screenshots

Screenshots are captured by the CI pipeline. To capture locally:

```bash
# 1. Start services
open FuriaC4ISR.app
# or: cargo run --release -p interop-gateway &
#     cargo run --release -p furia-market-server &

# 2. Run capture
python3 docs/mkdocs/scripts/capture-screenshots.py

# 3. Rebuild docs
cd docs/mkdocs && python3 -m mkdocs build
```