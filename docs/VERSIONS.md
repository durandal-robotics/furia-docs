# Platform Statistics

Furia C2 Platform **v0.2.0**

## Overview

| Metric | Value |
|--------|-------|
| **Services** | 151 |
| **Crates** | 111 |
| **Extension manifests** | 64 |
| **C2 profiles** | 25 |
| **Marketplace seeds** | 145 |
| **Workspace version** | v0.2.0 |

## SDK Traits (22)

| Trait | Purpose | Source |
|-------|---------|--------|
| `AirspaceManager` | Airspace deconfliction | `furia-sdk/src/airspacemanager.rs` |
| `AssessmentEngine` | BDA, damage scoring | `furia-sdk/src/assessment.rs` |
| `DecompositionStrategy` | Intent-to-task compilation | `furia-sdk/src/decompositionstrategy.rs` |
| `DispatchAdapter` | Action dispatch, protocol bridging | `furia-sdk/src/dispatch.rs` |
| `EngagementPlanner` | Multi-platform engagement coordination | `furia-sdk/src/engagementplanner.rs` |
| `FusionProvider` | Multi-source sensor fusion | `furia-sdk/src/fusion.rs` |
| `LogisticsProvider` | Supply chain, sustainment | `furia-sdk/src/logistics.rs` |
| `PolicyProvider` | IHL gating, ROE enforcement | `furia-sdk/src/policy.rs` |
| `SensorAdapter` | Track ingestion, classification | `furia-sdk/src/sensor.rs` |
| `SimulationProvider` | Entity simulation, tick loops | `furia-sdk/src/simulation.rs` |

## Service Ports

| Service | Port |
|---------|------|
| `abort-engine` | 3156 |
| `air-defense-counter-air` | 3232 |
| `airspace-service` | 3152 |
| `all-source-intel-fusion` | 3161 |
| `auth-proxy` | 3105 |
| `bandwidth-aware-delivery` | 3380 |
| `battle-rhythm-service` | 3129 |
| `bda-service` | 3102 |
| `bff-service` | 3470 |
| `cas-service` | 3116 |
| `ccir-engine` | 3117 |
| `civil-infrastructure` | 3472 |
| `civil-services` | 3499 |
| `coalition-partner-cps` | 3332 |
| `cognitive-load-management` | 3341 |
| `collection-management` | 3143 |
| `comm-sim-feasibility-sidecar` | 3372 |
| `command-dashboard` | 3460 |
| `commander-decision-cycle` | 3365 |
| `commander-interlock-hud` | 3396 |
| ... (130 with detected ports) | ... |

## CI Status

| Workflow | Status |
|----------|--------|
| Host (my-c2-host) | https://github.com/durandal-robotics/my-c2-host |
| UI (my-c2-ui) | https://github.com/durandal-robotics/my-c2-ui |
| Marketplace (furia-market-server) | https://github.com/durandal-robotics/furia-market-server |
| Docs | [![Docs](https://github.com/durandal-robotics/furia-docs/actions/workflows/deploy.yml/badge.svg)](https://github.com/durandal-robotics/furia-docs/actions/workflows/deploy.yml) |
