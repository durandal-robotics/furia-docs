# MUM-T (Manned-Unmanned Teaming) — `profile-mum-t`

Helicopter + UAV teaming with collaborative engagement, IFF, and airspace deconfliction.

## Services

| Service | Port | Purpose |
|---------|------|---------|
| sics-adapter | 3270 | SCORPION/SICS integration |
| airspace-service | 3050 | Airspace management |
| friendly-force-tracking | 3360 | Blue force tracking |

## Extensions

| Extension | Kind | Purpose |
|-----------|------|---------|
| durandal-airspace | policy | Airspace deconfliction |
| durandal-iff | sensor | IFF interrogation |
| durandal-force-protection | policy | Force protection |
| durandal-collaborative-engagement | engagement | Multi-platform coordination |

## Quickstart

```bash
furia-market install profile-mum-t
# (Optional) Add environment config
furia-market install profile-env-permissive
```

## Compose

```bash
# MUM-T (Manned-Unmanned Teaming) in denied environment
furia-market install profile-mum-t
furia-market install profile-env-denied
```
