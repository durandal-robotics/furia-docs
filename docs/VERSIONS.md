# Versions

Furia C2 Platform **v0.2.0**

## SDK Traits

| Trait | Methods | Source |
|-------|---------|--------|
| `AcousticProvider` | init, configure_sonar, tick_acoustics | `acoustic.rs` |
| `AirspaceManager` | init, add_volume, check | `airspace_manager.rs` |
| `AssessmentEngine` | assess, version, health | `assessor.rs` |
| `CbrnProvider` | init, release_agent, tick_dispersion | `cbrn.rs` |
| `CivilianDensityProvider` | init, tick_population, region_density | `civilian_density.rs` |
| `DecisionTreeProvider` | train, evaluate, version | `decision_tree.rs` |
| `DecompositionStrategy` | decompose, score_coa | `decomposition.rs` |
| `DispatchAdapter` | dispatch, validate_target | `dispatch.rs` |
| `EWSimProvider` | init, configure_jammer, tick_jammers | `ew_sim.rs` |
| `EngagementPlanner` | init, plan, approve | `engagement_planner.rs` |
| `ExportAdapter` | export, supported_formats, version | `export.rs` |
| `FusionEngine` | correlate, version, health | `fusion.rs` |
| `IntentProvider` | parse_intent, version, health | `intent.rs` |
| `InterceptorPairingProvider` | init, pair, batch_pair | `interceptor_pairing.rs` |
| `KillChainOrchestrator` | init, process, authorize | `kill_chain.rs` |
| `LogisticsProvider` | init, tick_consumption, vehicle_state | `logistics.rs` |
| `PolicyProvider` | evaluate, intent_feedback, version | `policy.rs` |
| `SensorAdapter` | ingest, classify | `sensor.rs` |
| `SimulationProvider` | init, tick, entity_state | `simulation.rs` |
| `TerrainAnalyst` | init, mobility_class, assess_route | `terrain.rs` |
| `ThreatScorer` | init, score, batch_score | `threat_scorer.rs` |
| `UiPlugin` | render, metadata, version | `ui.rs` |

## Service Ports

| Service | Port |
|---------|------|
| `military-messaging` | 3380 |
| `mission-orchestrator` | 3003 |
| `sapient-adapter` | 3395 |
| `support-infrastructure` | 3000 |
| `voice-assistant` | 3390 |
| ... (5 total) | ... |
