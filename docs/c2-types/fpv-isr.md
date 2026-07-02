# FPV + ISR Reconnaissance — `profile-fpv-isr`

Single-operator FPV drone ISR with GNSS-denied navigation, geospatial analysis, and BDA.

## Services

| Service | Port | Purpose |
|---------|------|---------|
| sensor-management | 3060 | Sensor tasking |
| geospatial-service | 3090 | Geospatial analysis |
| bda-service | 3005 | Battle damage assessment |

## Extensions

| Extension | Kind | Purpose |
|-----------|------|---------|
| durandal-pnt | sensor | PNT, GNSS fallback |
| durandal-dem-nav-bridge | simulation | DEM navigation |
| durandal-sensor-mgmt | sensor | Sensor management |
| durandal-geospatial | fusion | Geospatial intelligence |

## Quickstart

```bash
furia-market install profile-fpv-isr
# (Optional) Add environment config
furia-market install profile-env-permissive
```

## Compose

```bash
# FPV + ISR Reconnaissance in denied environment
furia-market install profile-fpv-isr
furia-market install profile-env-denied
```
