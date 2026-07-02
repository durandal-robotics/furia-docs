# Furia C2 Platform

**152 services · 63 extensions · 25 C2 profiles · 27 CI workflows**

Furia is a modular C2 (Command & Control) **platform** that generates complete
C2 systems for any mission type. Not one C2 — **any C2 you need**.

## 25 C2 Types Available

<div class="grid cards" markdown>

- **:material-drone: Counter-UAS** `profile-c-uas`
  Airspace management, EW, IFF, threat scoring
- **:material-headquarters: C4ISR Headquarters** `profile-furia-hq`
  COP, intel, planning, BDA, force tracking
- **:material-soldier: Frontline C2** `profile-furia-frontline`
  BFT, MEDEVAC, route analysis, tactical graphics
- **:material-cctv: FPV+ISR** `profile-fpv-isr`
  Single-operator drone ISR
- **:material-binoculars: Deep ISR** `profile-isr-deep`
  Multi-asset beyond-LOS recon
- **:material-target: Search & Strike** `profile-search-strike`
  Find and engage with IHL gating
- **:material-helicopter: MUM-T** `profile-mum-t`
  Helicopter + UAV teaming
- **:material-monitor-dashboard: GCS** `profile-gs-like`
  Full ground control station
- **:material-ship: Maritime** `profile-maritime`
  Vessel tracking, BDA, routing
- **:material-signal-cellular-outline: Denied Env** `profile-denied-environment`
  GNSS-denied, comms-contested ops
- **:material-email-newsletter: C2 Messaging** `profile-c2-messaging`
  SitRep, OPORD, FRAGO, MEDEVAC
- **:material-fire: Fires: Targeting** `profile-fires-targeting`
  Kill-chain, JFA, JTA, TST (8 services)
- **:material-chart-donut: Fires: BDA** `profile-fires-bda`
  Damage assessment (5 services)
- **:material-chart-line: Planning: Mission** `profile-planning-mission`
  Mission planning (6 services)
- **:material-brain: Planning: Decision** `profile-planning-decision`
  Decision engine (4 services)
- **:material-eye: Intel: ISR** `profile-intel-isr`
  Sensor fusion + tracking (5 services)
- **:material-shield-lock: Intel: Cyber** `profile-intel-cyber`
  Incident response (4 services)

</div>

## How It Works

```bash
# 1. Pick your C2 type
furia-market install profile-c-uas

# 2. (Optional) Compose with an environment
furia-market install profile-env-contested

# 3. Run it
open FuriaC4ISR.app

# Or from source
cargo run --release -p interop-gateway
```

Every C2 type is built from the same codebase — different profiles select different
service combinations. All 25 profiles are tested in CI and available as a DMG.

## Quickstart

```bash
# Install Furia C4ISR
open FuriaC4ISR.dmg  # → drag to Applications

# Or build from source
./scripts/build-dmg.sh
```

## Architecture

```
┌─────────────┐     ┌──────────────┐     ┌──────────────┐
│  Tauri UI   │────▶│  Services    │────▶│   PostGIS    │
│  (SolidJS)  │     │  (152 svcs)  │     │  (Spatial)   │
└─────────────┘     └──────────────┘     └──────────────┘
                           │
                    ┌──────▼──────┐
                    │  Extensions │
                    │  (63 WASM)  │
                    └─────────────┘
```

## CI Pipeline

Every push builds and tests all 25 C2 types in parallel:

```
Code → Build 25 profiles → Assemble DMG → E2E Tests → Artifact
```

See the [full CI pipeline](https://github.com/vlordier/furia-control/actions) for latest builds.