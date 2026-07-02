# Building Your Own C2

Furia is a **C2 platform** — you build your C2 by selecting profiles, configuring extensions, and deploying services. This guide covers everything from picking a profile to writing custom extensions.

## Quickstart: Run Any C2 Type

```bash
# 1. Pick your C2 type
furia-market install profile-c-uas        # Counter-UAS
furia-market install profile-furia-hq     # C4ISR Headquarters
furia-market install profile-search-strike # Find and engage

# 2. (Optional) Add environment configuration
furia-market install profile-env-contested  # EW active

# 3. Run the stack
open FuriaC4ISR.app
```

## Architecture Overview

```
┌─────────────────────────────────────────────────────┐
│                   Tauri Desktop App                  │
│  ┌──────────┐ ┌──────────┐ ┌──────────────────────┐ │
│  │   COP    │ │Mission   │ │    Marketplace       │ │
│  │  (Map)   │ │Planner   │ │    (Extensions)      │ │
│  └──────────┘ └──────────┘ └──────────────────────┘ │
├─────────────────────────────────────────────────────┤
│                 152 Backend Services                 │
│  ┌──────────┐ ┌──────────┐ ┌──────────────────────┐ │
│  │ Interop  │ │Mission   │ │    Policy Service     │ │
│  │ Gateway  │ │Orch.     │ │    (IHL, ROE)         │ │
│  └──────────┘ └──────────┘ └──────────────────────┘ │
├─────────────────────────────────────────────────────┤
│              63 WASM Extensions                      │
│  ┌──────────┐ ┌──────────┐ ┌──────────────────────┐ │
│  │ IHL Gate │ │ BDA      │ │    Voice STT         │ │
│  │ (Policy) │ │(Assess)  │ │    (Sensor)          │ │
│  └──────────┘ └──────────┘ └──────────────────────┘ │
├─────────────────────────────────────────────────────┤
│                  PostGIS Database                     │
│  ┌──────────────────────────────────────────────┐    │
│  │  Missions · Tracks · BDA Chains · COT History │    │
│  │  Spatial Indexes · pgRouting Graph            │    │
│  └──────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────┘
```

## The SDK (furia-sdk)

The SDK lives in `furia-core/crates/furia-sdk/` and provides the traits
that extensions implement:

```rust
use furia_sdk::prelude::*;

// Implement a policy provider (IHL gating)
struct MyPolicyProvider;

#[async_trait]
impl PolicyProvider for MyPolicyProvider {
    async fn evaluate(
        &self,
        ctx: &PolicyContext,
        handle: &ModuleHandle,
    ) -> Result<PolicyDecision, PolicyError> {
        // Your IHL logic here
        Ok(PolicyDecision::Allow)
    }
}
```

### Available SDK Traits

| Trait | Kind | Purpose |
|-------|------|---------|
| `PolicyProvider` | `policy` | IHL gating, ROE enforcement |
| `SimulationProvider` | `simulation` | Entity simulation, tick loops |
| `SensorAdapter` | `sensor` | Track ingestion, classification |
| `DecompositionStrategy` | `decomposition` | Intent-to-task compilation |
| `DispatchAdapter` | `dispatch` | Action dispatch, protocol bridging |
| `AssessmentEngine` | `assessment` | BDA, damage scoring |
| `FusionProvider` | `fusion` | Multi-source fusion |
| `LogisticsProvider` | `logistics` | Supply chain, sustainment |

## Profiles

Profiles are meta-extensions that bundle multiple services and extensions
into a C2 configuration:

```toml
# meta/my-c2/furia-mod.toml
[module]
id = "profile-my-c2"
name = "My Custom C2"
kind = "meta"
description = "Custom C2 for my mission"

[dependencies]
policy-service = ">=0.1.0"
interop-gateway = ">=0.1.0"
furia-builtin-safe-ihl = ">=0.1.0"
```

## Deployment Options

### macOS (Local Development)

```bash
./scripts/build-dmg.sh
open FuriaC4ISR.dmg
```

### Docker Compose (Development)

```bash
docker compose -f deploy/full-stack/docker-compose.yml up -d
```

### K3s (Edge Production)

```bash
curl -sfL https://get.k3s.io | sh
kubectl apply -f deploy/k3s/
```

## Service Communication

```
┌──────────────┐         ┌──────────────┐         ┌──────────────┐
│  HTTP/REST   │────────▶│    Zenoh     │────────▶│     DDS      │
│  Management  │         │  Real-time   │         │  NATO STANAG │
│  43 services │         │  46 services │         │   1 service  │
└──────────────┘         └──────────────┘         └──────────────┘
```

Services communicate via three buses:
- **HTTP** — Management, configuration, operator interaction (43 services)
- **Zenoh** — Real-time C2 data, tracks, events, state (46 services)
- **DDS** — NATO real-time compliance, STANAG 4586/4607 (1 service)

## Data Flow

```
CoT Event → Interop Gateway → Graph DB → COP
  (ATAK)      (3226)          (PostGIS)  (Tauri UI)

Mission → Mission Orchestrator → Policy Service → Kill Chain
  (Plan)      (3003)              (3004)           (3005)

Extension → Market Server → Module Loader → Provider Registry
  (WASM)     (3030)          (3031)          (Runtime)
```

## Next Steps

- [UI Components](../ui-components/overview.md) — App layout, panels, shells
- [Building an Extension](../tutorials/building-an-extension.md) — Step-by-step
- [Extension Catalog](../extensions/catalog.md) — All 64 extensions
- [C2 Profiles](../c2-types/overview.md) — All 25 configurations