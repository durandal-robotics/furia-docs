# Screenshot Gallery

Live captures from Furia services. PNGs captured via Playwright, SVGs rendered from live API responses.
Generated automatically by CI every build.

## API Gateway

![Swagger UI](../screenshots/swagger-ui.png)
*Swagger UI — 23 documented endpoints across 7 tag groups*

![Health Status](../screenshots/health.png)
*Service health, C2 profile, loaded providers, platform status*

![Health Dashboard](../screenshots/health.png)
*Health endpoint — live capture from running interop-gateway*

## Marketplace

![All Extensions](../screenshots/marketplace-search-all.png)
*98 modules in the marketplace (crate seeds + profiles)*

![All Extensions](../screenshots/marketplace-search.png)
*Marketplace search — all modules listed with names and descriptions*

![Simulation Extensions](../screenshots/marketplace-simulation-extensions.png)
*Filter by kind: 20+ simulation extensions*

![Policy Extensions](../screenshots/marketplace-policy-extensions.png)
*Filter by kind: 10+ policy extensions*

![Sensor Extensions](../screenshots/marketplace-sensor-extensions.png)
*Filter by kind: 8+ sensor extensions*

## Extension Details

![IHL Module](../screenshots/marketplace-ihl-detail.png)
*furia-builtin-safe-ihl — policy, IHL safety gating*

![BDA Module](../screenshots/marketplace-bda-detail.png)
*durandal-bda — assessment, battle damage scoring*

![Voice Module](../screenshots/marketplace-voice-detail.png)
*durandal-voice-classifier — sensor, STT for C2 voice commands*

![Graph Module](../screenshots/marketplace-graph-detail.png)
*furia-graph — fusion, temporal entity graph*

![Module Detail](../screenshots/module-detail.png)
*Extension detail view with version, traits, security requirements*

## C2 Profiles

### Counter-UAS (C-UAS)

![C-UAS Profile](../screenshots/marketplace-c-uas.png)
*profile-c-uas — found in marketplace with 5 extension dependencies*

### C4ISR Headquarters

![Furia HQ Profile](../screenshots/marketplace-furia-hq.png)
*profile-furia-hq — full HQ with COP, intel, planning, BDA*

![Furia HQ](../screenshots/profile-furia-hq.png)
*Health endpoint when Furia HQ profile is active*

### Tactical Frontline

![Frontline Profile](../screenshots/marketplace-furia-frontline.png)
*profile-furia-frontline — dismounted C2 with BFT, MEDEVAC*

### FPV + ISR Reconnaissance

![FPV ISR Profile](../screenshots/marketplace-fpv-isr.png)
*profile-fpv-isr — single-operator drone ISR*

### Deep ISR Reconnaissance

![Deep ISR Profile](../screenshots/marketplace-isr-deep.png)
*profile-isr-deep — multi-asset beyond-LOS reconnaissance*

### Search & Strike

![Search & Strike Profile](../screenshots/marketplace-search-strike.png)
*profile-search-strike — find and engage with IHL gating*

### Manned-Unmanned Teaming

![MUM-T Profile](../screenshots/marketplace-mum-t.png)
*profile-mum-t — helicopter + UAV teaming*

### Ground Control Station

![GCS Profile](../screenshots/marketplace-ground-station.png)
*profile-gs-like — full ground control station*

### Maritime Domain Awareness

![Maritime Profile](../screenshots/marketplace-maritime.png)
*profile-maritime — vessel tracking, BDA, routing*

### C2 Messaging

![Messaging Profile](../screenshots/marketplace-c2-messaging.png)
*profile-c2-messaging — SitRep, OPORD, MEDEVAC*

![Messaging Status](../screenshots/messaging-status-ui.png)
*Military messaging service health*

![Messaging Inbox](../screenshots/messaging-inbox.png)
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

## All Screenshots (30)

| `health.png` | ![](health.png) | 142 KB |
| `health-json.png` | ![](health-json.png) | 84 KB |
| `marketplace-bda-detail.png` | ![](marketplace-bda-detail.png) | 39 KB |
| `marketplace-c-uas.png` | ![](marketplace-c-uas.png) | 23 KB |
| `marketplace-c2-messaging.png` | ![](marketplace-c2-messaging.png) | 22 KB |
| `marketplace-fpv-isr.png` | ![](marketplace-fpv-isr.png) | 23 KB |
| `marketplace-furia-frontline.png` | ![](marketplace-furia-frontline.png) | 23 KB |
| `marketplace-furia-hq.png` | ![](marketplace-furia-hq.png) | 24 KB |
| `marketplace-graph-detail.png` | ![](marketplace-graph-detail.png) | 39 KB |
| `marketplace-ground-station.png` | ![](marketplace-ground-station.png) | 23 KB |
| `marketplace-ihl-detail.png` | ![](marketplace-ihl-detail.png) | 45 KB |
| `marketplace-isr-deep.png` | ![](marketplace-isr-deep.png) | 23 KB |
| `marketplace-maritime.png` | ![](marketplace-maritime.png) | 23 KB |
| `marketplace-mum-t.png` | ![](marketplace-mum-t.png) | 23 KB |
| `marketplace-search.png` | ![](marketplace-search.png) | 1827 KB |
| `marketplace-search-strike.png` | ![](marketplace-search-strike.png) | 23 KB |
| `marketplace-search-ui.png` | ![](marketplace-search-ui.png) | 1012 KB |
| `marketplace-voice-detail.png` | ![](marketplace-voice-detail.png) | 37 KB |
| `messaging-inbox.png` | ![](messaging-inbox.png) | 10 KB |
| `messaging-status-ui.png` | ![](messaging-status-ui.png) | 13 KB |
| `module-detail.png` | ![](module-detail.png) | 64 KB |
| `profile-furia-hq.png` | ![](profile-furia-hq.png) | 142 KB |
| `swagger-atak.png` | ![](swagger-atak.png) | 269 KB |
| `swagger-cot.png` | ![](swagger-cot.png) | 269 KB |
| `swagger-health.png` | ![](swagger-health.png) | 269 KB |
| `swagger-ui.png` | ![](swagger-ui.png) | 269 KB |
| `tauri-cop.png` | ![](tauri-cop.png) | 481 KB |
| `tauri-entry.png` | ![](tauri-entry.png) | 472 KB |
| `tauri-marketplace.png` | ![](tauri-marketplace.png) | 472 KB |
| `tauri-training.png` | ![](tauri-training.png) | 472 KB |
