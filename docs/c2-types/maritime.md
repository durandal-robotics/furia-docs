# Maritime Domain Awareness — `profile-maritime`

Maritime domain awareness — vessel tracking, BDA, route planning, IFF, and climate effects.

## Services

| Service | Port | Purpose |
|---------|------|---------|
| bda-service | 3005 | Damage assessment |
| geospatial-service | 3090 | Geospatial analysis |
| route-analysis | 3100 | Route planning |

## Extensions

| Extension | Kind | Purpose |
|-----------|------|---------|
| durandal-bda | assessment | BDA |
| durandal-geospatial | fusion | Geospatial intel |
| durandal-routing | simulation | Route planning |
| durandal-iff | sensor | IFF |
| durandal-climate | environmental | Climate effects |

## Quickstart

```bash
furia-market install profile-maritime
# (Optional) Add environment config
furia-market install profile-env-permissive
```

## Compose

```bash
# Maritime Domain Awareness in denied environment
furia-market install profile-maritime
furia-market install profile-env-denied
```
