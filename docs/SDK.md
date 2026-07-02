# SDK Reference

The Furia SDK (`furia-sdk`) provides traits that extensions implement.
Each trait corresponds to an extension kind and is loaded by the
module sandbox at runtime.

## Available Traits

### PolicyProvider — `policy` kind

Evaluates operational decisions against IHL rules, ROE, and geographic constraints.

```rust
#[async_trait]
pub trait PolicyProvider: Send + Sync {
    async fn evaluate(&self, ctx: &PolicyContext, handle: &ModuleHandle)
        -> Result<PolicyDecision, PolicyError>;
    fn intent_feedback(&self, intent: &str) -> Vec<PolicyConstraint>;
    fn version(&self) -> &'static str;
    fn health(&self) -> ModuleHealth;
}
```

**Example:** Zone-based restriction policy — denies actions in civilian areas.
See `examples/hello-c2-ext/` for a working implementation.

---

### SimulationProvider — `simulation` kind

Manages entity simulation, tick loops, and scenario execution.

```rust
#[async_trait]
pub trait SimulationProvider: Send + Sync {
    async fn init(&mut self, config: &ProviderInitConfig) -> Result<(), SimulationError>;
    async fn tick(&mut self, dt: f64) -> Result<SimulationState, SimulationError>;
    fn entity_state(&self, id: &str) -> Option<EntityState>;
    fn version(&self) -> &'static str;
    fn health(&self) -> ModuleHealth;
}
```

**Example:** OPFOR behavior model — simulates adversarial unit movements and reactions.

---

### SensorAdapter — `sensor` kind

Ingests sensor tracks and classifies them into C2 track types.

```rust
#[async_trait]
pub trait SensorAdapter: Send + Sync {
    async fn ingest(&self, payload: &[u8], handle: &ModuleHandle)
        -> Result<Vec<TrackIngest>, AdapterError>;
    async fn classify(&self, track: &TrackIngest, handle: &ModuleHandle)
        -> Result<TrackClassification, AdapterError>;
    fn version(&self) -> &'static str;
    fn health(&self) -> ModuleHealth;
}
```

**Example:** ATAK CoT adapter — ingests Cursor on Target XML and classifies into platform tracks.

---

### DecompositionStrategy — `decomposition` kind

Converts commander intent into executable mission plans and task graphs.

```rust
#[async_trait]
pub trait DecompositionStrategy: Send + Sync {
    fn decompose(&self, intent: &str, handle: &ModuleHandle)
        -> Result<Vec<SubMission>, DecompositionError>;
    fn score_coa(&self, mission_id: &str, handle: &ModuleHandle)
        -> Result<CoAScore, DecompositionError>;
    fn version(&self) -> &'static str;
    fn health(&self) -> ModuleHealth;
}
```

**Example:** OPORD/FRAGO LLM generator — uses a local LLM to produce formatted military orders.

---

### DispatchAdapter — `dispatch` kind

Dispatches actions to external systems and validates targets.

```rust
#[async_trait]
pub trait DispatchAdapter: Send + Sync {
    async fn dispatch(&self, action: &Action, handle: &ModuleHandle)
        -> Result<DispatchReceipt, AdapterError>;
    async fn validate_target(&self, target: &TrackIngest, handle: &ModuleHandle)
        -> Result<TargetValidation, AdapterError>;
    fn version(&self) -> &'static str;
    fn health(&self) -> ModuleHealth;
}
```

---

### AssessmentEngine — `assessment` kind

Evaluates battle damage and produces BDA reports.

```rust
#[async_trait]
pub trait AssessmentEngine: Send + Sync {
    async fn assess(&self, strike: &StrikeReport, handle: &ModuleHandle)
        -> Result<BdaReport, AssessmentError>;
    fn version(&self) -> &'static str;
    fn health(&self) -> ModuleHealth;
}
```

---

### FusionProvider — `fusion` kind

Fuses multi-source sensor data into a coherent track picture.

```rust
#[async_trait]
pub trait FusionProvider: Send + Sync {
    async fn fuse(&self, tracks: &[TrackIngest], handle: &ModuleHandle)
        -> Result<Vec<FusedTrack>, FusionError>;
    fn version(&self) -> &'static str;
    fn health(&self) -> ModuleHealth;
}
```

---

### LogisticsProvider — `logistics` kind

Tracks fuel, ammunition, and sustainment status.

```rust
#[async_trait]
pub trait LogisticsProvider: Send + Sync {
    async fn estimate(&self, mission: &MissionPlan, handle: &ModuleHandle)
        -> Result<LogisticsEstimate, LogisticsError>;
    fn version(&self) -> &'static str;
    fn health(&self) -> ModuleHealth;
}
```

## Implementing a Trait

```rust
use furia_sdk::prelude::*;

struct MyPolicy;

#[async_trait]
impl PolicyProvider for MyPolicy {
    async fn evaluate(&self, ctx: &PolicyContext, handle: &ModuleHandle)
        -> Result<PolicyDecision, PolicyError>
    {
        Ok(PolicyDecision::Allow)
    }

    fn intent_feedback(&self, _intent: &str) -> Vec<PolicyConstraint> {
        vec![]
    }

    fn version(&self) -> &'static str { "0.1.0" }
    fn health(&self) -> ModuleHealth { ModuleHealth::Healthy }
}
```

## See Also

- [Building an Extension](tutorials/building-an-extension.md) — step-by-step tutorial
- [Extension Catalog](extensions/catalog.md) — all 64 published extensions
- [C2 Templates](c2-templates.md) — 7 templates that use these traits
