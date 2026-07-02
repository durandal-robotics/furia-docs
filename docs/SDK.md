# SDK Reference

The Furia SDK provides traits that extensions implement.
All code snippets below are extracted from the actual `furia-sdk` source.

```rust
pub trait AcousticProvider: Send + Sync {
    /// Initialise the acoustic simulator with a scenario.
    fn init(&mut self, scenario: &Scenario, handle: &ModuleHandle);
```

```rust
pub trait AirspaceManager: Send + Sync {
    fn init(&mut self, handle: &ModuleHandle);
    fn add_volume(&mut self, volume: AirspaceVolume);
    fn check(&self, track: &DroneTrack) -> Vec<AirspaceVolume>;
    fn is_in_no_fly_zone(&self, lat: f64, lon: f64, alt_m: f64) -> bool;
    fn list_volumes(&self) -> Vec<AirspaceVolume>;
```

```rust
pub trait AssessmentEngine: Send + Sync {
    /// Assess after-action events and produce BDA.
    fn assess(
        &self,
        mission_id: &str,
        events: &[SimEvent],
        handle: &ModuleHandle,
    ) -> Result<BattleDamageAssessment, AssessmentError>;
```

```rust
pub trait CbrnProvider: Send + Sync {
    /// Initialise the CBRN simulator with a scenario.
    fn init(&mut self, scenario: &Scenario, handle: &ModuleHandle);
```

```rust
pub trait CivilianDensityProvider: Send + Sync {
    /// Initialise the population model with a scenario.
    fn init(&mut self, scenario: &Scenario, handle: &ModuleHandle);
```

```rust
pub trait DecisionTreeProvider: Send + Sync {
    /// Train a decision tree from labelled examples.
    fn train(&self, examples: &[TrainingExample]) -> Result<DecisionTree, String>;
```

```rust
pub trait DecompositionStrategy: Send + Sync {
    /// Decompose a mission intent into sub-missions with asset assignments.
    fn decompose(
        &self,
        intent: &str,
        handle: &ModuleHandle,
    ) -> Result<Vec<SubMission>, DecompositionError>;
```

```rust
pub trait DispatchAdapter: Send + Sync {
    /// Dispatch an action to the platform. Returns a receipt.
    fn dispatch(
        &self,
        action: &Action,
        handle: &ModuleHandle,
    ) -> Result<DispatchReceipt, crate::sensor::AdapterError>;
```

```rust
pub trait EngagementPlanner: Send + Sync {
    fn init(&mut self, handle: &ModuleHandle);
    fn plan(&self, threats: &[DroneTrack], assessments: &[ThreatAssessment], pairings: &[InterceptorPairing]) -> EngagementPlan;
    fn approve(&mut self, plan_id: &str);
    fn reject(&mut self, plan_id: &str);
```

```rust
pub trait EWSimProvider: Send + Sync {
    /// Initialise the EW simulator with a scenario.
    fn init(&mut self, scenario: &Scenario, handle: &ModuleHandle);
```

```rust
pub trait ExportAdapter: Send + Sync {
    /// Export an entity in the requested format.
    fn export(
        &self,
        entity: &ExportEntity,
        format: &ExportFormat,
        handle: &ModuleHandle,
    ) -> Result<Vec<u8>, ExportError>;
```

```rust
pub trait FusionEngine: Send + Sync {
    /// Correlate tracks from multiple sensors and return relationships.
    fn correlate(
        &self,
        tracks: &[String],
        handle: &ModuleHandle,
    ) -> Result<Vec<TrackCorrelation>, FusionError>;
```

```rust
pub trait IntentProvider: Send + Sync {
    /// Parse natural language intent into structured form.
    fn parse_intent(
        &self,
        input: &str,
        handle: &ModuleHandle,
    ) -> Result<CommanderIntent, IntentParseError>;
```

```rust
pub trait InterceptorPairingProvider: Send + Sync {
    fn init(&mut self, assets: &[InterceptorAsset], handle: &ModuleHandle);
    fn pair(&self, track: &DroneTrack, assessment: &ThreatAssessment) -> Vec<InterceptorPairing>;
    fn batch_pair(&self, tracks: &[DroneTrack], assessments: &[ThreatAssessment]) -> Vec<InterceptorPairing>;
```

```rust
pub trait KillChainOrchestrator: Send + Sync {
    fn init(&mut self, scenario: &Scenario, handle: &ModuleHandle);
    fn process(&self, track: &DroneTrack, assessment: &ThreatAssessment) -> KillChainState;
    fn authorize(&mut self, track_id: &str, authority: KillAuthority);
    fn state(&self, track_id: &str) -> Option<KillChainState>;
```

```rust
pub trait LogisticsProvider: Send + Sync {
    /// Initialise the logistics simulator with a scenario.
    fn init(&mut self, scenario: &Scenario, handle: &ModuleHandle);
```

```rust
pub trait PolicyProvider: Send + Sync {
    /// Evaluate a proposed action against active doctrine and ROE.
    fn evaluate(
        &self,
        ctx: &PolicyContext,
        handle: &ModuleHandle,
    ) -> Result<PolicyDecision, PolicyError>;
```

```rust
pub trait SensorAdapter: Send + Sync {
    /// Ingest raw sensor payload and produce tracks.
    fn ingest(
        &self,
        payload: &[u8],
        handle: &ModuleHandle,
    ) -> Result<Vec<TrackIngest>, AdapterError>;
```

```rust
pub trait SimulationProvider: Send + Sync {
    /// Initialize the simulator with a scenario.
    fn init(&mut self, scenario: &Scenario, handle: &ModuleHandle);
```

```rust
pub trait TerrainAnalyst: Send + Sync {
    /// Initialise the terrain analyst with a scenario.
    fn init(&mut self, scenario: &Scenario, handle: &ModuleHandle);
```

```rust
pub trait ThreatScorer: Send + Sync {
    fn init(&mut self, scenario: &Scenario, handle: &ModuleHandle);
    fn score(&self, track: &DroneTrack, sensitive_zones: &[String]) -> ThreatAssessment;
    fn batch_score(&self, tracks: &[DroneTrack], sensitive_zones: &[String]) -> Vec<ThreatAssessment>;
```

```rust
pub trait UiPlugin: Send + Sync {
    /// Render the plugin in the specified slot with the given props.
    fn render(&self, props: &UiPluginProps, handle: &ModuleHandle) -> UiPluginOutput;
```
