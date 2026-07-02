# C4ISR Headquarters — `profile-furia-hq`

Full C4ISR headquarters with COP, intelligence, planning, BDA, force tracking, and C2 messaging.

## Services

| Service | Port | Purpose |
|---------|------|---------|
| interop-gateway | 3226 | API gateway, CoT, ATAK, STANAG |
| policy-service | 3004 | IHL gating, ROE enforcement |
| mission-orchestrator | 3003 | Mission lifecycle |
| military-messaging | 3380 | C2 messaging |

## Extensions

| Extension | Kind | Purpose |
|-----------|------|---------|
| durandal-bft | sensor | Blue force tracking |
| durandal-bda | assessment | Battle damage assessment |
| durandal-tactical-graphics | simulation | MIL-STD-2525 symbology |
| furia-builtin-safe-ihl | policy | IHL safety gating |

## Quickstart

```bash
furia-market install profile-furia-hq
# (Optional) Add environment config
furia-market install profile-env-permissive
```

## Compose

```bash
# C4ISR Headquarters in denied environment
furia-market install profile-furia-hq
furia-market install profile-env-denied
```
