# Building Your Own C2

Furia is a **C2 platform** — you build your C2 by selecting profiles, configuring extensions, and deploying services. This guide covers everything from picking a profile to writing custom extensions.

## Quickstart: Run Any C2 Type

```bash
# 1) Run marketplace
git clone https://github.com/durandal-robotics/furia-market-server.git
cd furia-market-server
cargo run

# 2) Run host (new terminal)
git clone https://github.com/durandal-robotics/my-c2-host.git
cd my-c2-host
FURIA_C2_PROFILE=cuas cargo run

# 3) Run UI (new terminal)
git clone https://github.com/durandal-robotics/my-c2-ui.git
cd my-c2-ui
npm install
npm run dev
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

### Host build (local/release)

```bash
cd my-c2-host
FURIA_C2_PROFILE=drone-swarm cargo build --release
./target/release/my-c2-host
```

### UI build (local/release)

```bash
cd my-c2-ui
npm run build:cuas
```

## Service Communication

```
┌──────────────┐         ┌──────────────┐         ┌──────────────┐
│  HTTP/REST   │────────▶│    Zenoh     │────────▶│     DDS      │
│  Control API │         │  Real-time   │         │  NATO STANAG │
│ (host + UI)  │         │   streams    │         │  (optional)  │
└──────────────┘         └──────────────┘         └──────────────┘
```

Services communicate via three buses:
- **HTTP** — Management, configuration, and operator interaction
- **Zenoh** — Real-time C2 data, tracks, events, and state
- **DDS** — NATO compliance paths (optional, profile-dependent)

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
- [Assurance & Proofs](assurance-and-proofs.md) — Required proof lanes before release

## Recommended Multi-Repo Delivery Layout

Use this split for productized deployments:

- `my-c2-host` → service host/composer and profile boot wiring
- `my-c2-ui` → operator UI app and build artifacts
- `furia-market-server` → extension marketplace API + catalog lifecycle
- `furia-core` / `furia-ui` / `furia-sdk-examples` / `furia-plugin-example` → shared contracts and examples

This keeps each product independently releasable while preserving ecosystem compatibility.