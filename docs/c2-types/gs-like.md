# Ground Control Station — `profile-gs-like`

Full ground control station for UAV operations — mission planning, tactical graphics, routing, logistics.

## Services

| Service | Port | Purpose |
|---------|------|---------|
| mission-planner | 3370 | Mission planning |
| mission-orchestrator | 3003 | Mission lifecycle |
| wargaming-engine | 3385 | COA wargaming |

## Extensions

| Extension | Kind | Purpose |
|-----------|------|---------|
| durandal-mission-compiler | decomposition | Intent compilation |
| durandal-tactical-graphics | simulation | Tactical symbology |
| durandal-routing | simulation | Route planning |
| durandal-logistics | logistics | Sustainment |

## Quickstart

```bash
furia-market install profile-gs-like
# (Optional) Add environment config
furia-market install profile-env-permissive
```

## Compose

```bash
# Ground Control Station in denied environment
furia-market install profile-gs-like
furia-market install profile-env-denied
```
