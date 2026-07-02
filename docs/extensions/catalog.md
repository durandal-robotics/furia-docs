# Extension Catalog

**64 extensions** across **15 SDK trait kinds**. Every extension is packaged as a WASM module
with a `furia-mod.toml` manifest, signed with Ed25519, and available in the marketplace.

## Extension Kinds

| Kind | Extensions | Description |
|------|-----------|-------------|
| airspace-manager | 1 | Airspace management, deconfliction, killbox coordination |
| assessment | 9 | BDA, damage scoring, causal analysis, decision analytics |
| decision-tree | 1 | Bayesian decision tree for COA selection |
| decomposition | 4 | Intent-to-task compilation, mission planning, MEDEVAC/CAS |
| dispatch | 3 | ATAK/TAK CoT, action dispatch, protocol bridging |
| engagement-planner | 2 | Multi-platform synchronized engagement, interceptor pairing |
| ew-sim | 2 | Electronic warfare simulation, jamming, spectrum effects |
| fusion | 2 | Multi-source fusion, COP, geospatial analysis, temporal graph |
| logistics | 1 | Supply chain, fuel, ammo, sustainment tracking |
| policy | 3 | IHL gating, ROE enforcement, force protection, mission lint |
| sensor | 8 | Track ingestion, classification, sensor management, STT/NER |
| simulation | 23 | Entity simulation, tick loops, scenario execution, environment modeling |
| terrain | 2 | Terrain analysis, elevation, line of sight, mobility |
| threat-scorer | 1 | C-UAS threat scoring, prioritization, risk assessment |
| ui-plugin | 2 | Voice pipeline, audio stream management, hotword detection |

## By Kind

### Airspace-Manager (1)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-airspace` | Airspace volume management, deconfliction, transit corridors, ACO/ATO ingestion, MUM-T deconfliction, and collision warnings | none |

### Assessment (9)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-bda` | Battle Damage Assessment domain model — damage scoring, change detection, confidence tiers | none |
| `durandal-capability` | NATO/French/Ukrainian military capability ontology for heterogeneous drone swarms | none |
| `durandal-causal-bda` | Causal Battle Damage Assessment — cause-effect reasoning for battle damage assessment with temporal causality tracking | none |
| `durandal-csar` | CSAR / Personnel Recovery domain models — beacon tracking, extraction planning, recovery vehicle scoring, survival assistance | none |
| `durandal-force-protection` | Force protection — ADW state machine, FPCON levels, counter-battery, passive defense, threat warning display | none |
| `durandal-ipb` | Intelligence Preparation of the Battlefield — threat templates, situation templates, MCOO, environment effects, COA development | none |
| `durandal-mission-lint` | Mission plan lint engine — physical, RoE/IHL, guardrail, and RETEX rules | none |
| `durandal-targeting` | Deliberate targeting lifecycle per JP 3-60 — target lifecycle state machine, list management, nomination, and BDA feedback | none |
| `furia-ihl` | IHL rules engine — proportionality, distinction, precaution, necessity evaluation for targeting decisions | none |

### Decision-Tree (1)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-tree-learner` | Bayesian decision tree learner for pre-computed contingency planning | none |

### Decomposition (4)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-compiler` | Intent-to-task compiler — parses commander intent into executable S1 task graphs | furia-sdk |
| `durandal-mission-compiler` | Typed lowering from Furia MissionPlan to S1 TaskGraph | none |
| `furia-builtin-basic-decomposition` | Basic mission decomposition into sub-missions using template patterns | none |
| `furia-opord-frago` | AI-generated OPORD, FRAGO, WARNORD using local LLM — bridges to durandal-opord-frago-llm Python inference server | furia-sdk |

### Dispatch (3)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-tak` | TAK/CoT encoding utilities for Durandal Furia Control | none |
| `furia-builtin-tak-adapter` | ATAK CoT message dispatch, sensor ingestion, and command routing | furia-builtin-basic-decomposition |
| `furia-wsmp-client` | WSMP protocol client — register and call SOA services through the Furia interoperability gateway | furia-sdk |

### Engagement-Planner (2)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-cas` | CAS (Close Air Support) domain models — 9-line brief, danger-close calc, FSCL management, terminal attack control | none |
| `durandal-collaborative-engagement` | Collaborative Engagement — multi-platform synchronized strikes, cooperative sensor-to-shooter handoff, and coordinated TOT planning | none |

### Ew-Sim (2)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-ew` | Electronic Warfare — EA planning, EOB, EP, ES tasking, EW kill-chain integration | none |
| `durandal-spectrum` | Spectrum management — RF propagation models, frequency allocation, interference prediction | none |

### Fusion (2)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-cop` | Common Operating Picture fusion engine — temporal alignment, cross-domain correlation, staleness monitoring | none |
| `furia-graph` | Temporal entity graph — CoT history, BDA chains, multi-hop relationship queries over PostGIS | furia-sdk |

### Logistics (1)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-logistics` | Logistics and sustainment — power tracking, endurance estimation, RTB planning, payload inventory | none |

### Policy (3)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-auth` | Authentication and authorization primitives for Durandal Furia Control | none |
| `durandal-command-log` | Hash-chained JSONL append-only command/audit log — immutable record of commander decisions | furia-sdk |
| `furia-builtin-safe-ihl` | International Humanitarian Law (IHL) rules engine — proportionality, distinction, precaution, ROE compliance | none |

### Sensor (8)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-bft` | Blue Force Tracking domain model — friendly unit positions, hierarchy, and fratricide prevention | none |
| `durandal-dem-nav-bridge` | Adapter for dem-nav GNSS-denied route segment scoring (stub + optional HTTP jobs) | none |
| `durandal-iff` | NATO Identification Friend or Foe — Mk XIIA Mode 4/5 interrogation, NCTI, affiliation resolution | none |
| `durandal-pnt` | Positioning, Navigation, and Timing (PNT) — multi-sensor fusion, integrity monitoring, spoofing detection, NAVWAR planning | none |
| `durandal-sensor-mgmt` | Sensor task allocation, cueing, track handoff, and conflict resolution | none |
| `durandal-sensors` | Sensor preset catalog — specifications, modes, and performance characteristics for UAV sensors | furia-sdk |
| `durandal-voice-classifier` | Speech-to-text classifier for C2 voice commands — intent classification and slot extraction | furia-sdk |
| `durandal-voice-ner` | Named entity recognition for C2 voice commands — callsigns, grid references, altitudes | furia-sdk |

### Simulation (23)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-adversarial-coa` | Adversarial Course of Action analysis and prediction | none |
| `durandal-climate` | Climate profiles, solar astronomy, and domain-randomization noise for Durandal | none |
| `durandal-comm-sim-bridge` | Adapter between Furia mission feasibility and durandal-comm-sim (stub/HTTP) | none |
| `durandal-comms-equipment` | Communications equipment presets for unmanned vehicles | none |
| `durandal-compute` | ML compute scheduler — priority-based resource sequencing for onboard inference | furia-sdk |
| `durandal-doctrine` | Military doctrine, role taxonomy, and unit organization for Durandal | none |
| `durandal-emergency` | Emergency Procedures Engine — damage classification, automated response, comms loss timer, checklists | none |
| `durandal-hardware` | Hardware preset catalog — sensors, avionics, weapons, comms for unmanned vehicles | none |
| `durandal-medevac` | Medical evacuation coordination — 9-line requests, casualty tracking, LZ selection, evacuation routing | none |
| `durandal-mildew` | Strategic, operational, and tactical deception campaign modeling — decoys, feints, false targets, masking | none |
| `durandal-mission-templates` | Reusable mission template definitions — BlockTemplate, MissionTypeTemplate, slot instantiation | none |
| `durandal-opfor` | OPFOR Threat Modeling — adversary OOB management, doctrinal behavior templates, pattern-of-life learning, threat prediction, Red Air/Surface behavior models | none |
| `durandal-scenarios` | Pre-built training scenarios and variant generation for Durandal | none |
| `durandal-simulation` | Simulation engine — entity management, tick loop, sensor fusion, and scenario execution | furia-sdk |
| `durandal-weapons` | Weapon and munition presets for unmanned vehicle payloads | none |
| `durandal-world-bridge` | World-model bridge — seed authoritative areas, ingest world state updates for simulation | furia-sdk |
| `furia-builtin-environmental` | Multi-domain environmental effects — civilian density, CBRN dispersion, acoustic propagation | none |
| `furia-builtin-ew-sim` | Realistic EW simulation — jammer effectiveness, ESM detection, spectrum deconfliction, comms degradation | none |
| `furia-builtin-logistics` | Logistics simulation — fuel burn, ammunition, maintenance, supply chain, convoy movement, RTB planning | none |
| `furia-builtin-terrain` | Slope, cross-country mobility, line-of-sight, cover, concealment | furia-builtin-environmental |
| `furia-decision-tree` | Bayesian decision tree for COA selection — contingency planning and pre-computed branching | furia-sdk |
| `furia-wargamer-engine` | Wargaming engine — COA comparison, bias-injected what-if simulation, Monte Carlo outcome projection | furia-sdk |
| `furia-wargamer-templates` | Pre-built wargaming templates and scenario definitions for the Furia wargame engine | none |

### Terrain (2)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-geospatial` | Multi-layer geospatial raster maps for cost-based mission planning | none |
| `durandal-routing` | Terrain-aware route planning with threat avoidance and A* pathfinding | none |

### Threat-Scorer (1)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-tewa` | Hungarian/Munkres solver for optimal weapon-target pairing with threat evaluation scoring | none |

### Ui-Plugin (2)

| Extension | Description | Dependencies |
|-----------|-------------|--------------|
| `durandal-tactical-graphics` | Tactical graphics, control measures, and battle tracking symbology | none |
| `durandal-voice-server` | Voice pipeline — audio stream management, hotword detection, WebSocket daemon | furia-sdk |

