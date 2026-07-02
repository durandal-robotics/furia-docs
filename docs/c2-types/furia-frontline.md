# Tactical Frontline — `profile-furia-frontline`

Tactical C2 for dismounted units — BFT, MEDEVAC/CASEVAC, route analysis, tactical graphics.

## Services

| Service | Port | Purpose |
|---------|------|---------|
| friendly-force-tracking | 3360 | Blue force tracking |
| full-spectrum-csar | 3456 | Personnel recovery |
| route-analysis | 3100 | Route planning |

## Extensions

| Extension | Kind | Purpose |
|-----------|------|---------|
| durandal-bft | sensor | Blue force tracking |
| durandal-medevac | decomposition | MEDEVAC 9-line |
| durandal-csar | decomposition | Combat search and rescue |
| durandal-tactical-graphics | simulation | Tactical symbology |

## Quickstart

```bash
furia-market install profile-furia-frontline
# (Optional) Add environment config
furia-market install profile-env-permissive
```

## Compose

```bash
# Tactical Frontline in denied environment
furia-market install profile-furia-frontline
furia-market install profile-env-denied
```
