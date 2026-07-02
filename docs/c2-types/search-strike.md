# Search & Strike — `profile-search-strike`

Find and engage with IHL safety gating — BDA, collaborative engagement, mission lint.

## Services

| Service | Port | Purpose |
|---------|------|---------|
| bda-service | 3005 | Battle damage assessment |
| decision-engine | 3333 | COA scoring |
| policy-service | 3004 | IHL gating |

## Extensions

| Extension | Kind | Purpose |
|-----------|------|---------|
| durandal-bda | assessment | BDA scoring |
| durandal-collaborative-engagement | engagement | Multi-platform strikes |
| furia-builtin-safe-ihl | policy | IHL safety |
| furia-builtin-basic-decomposition | decomposition | Mission breakdown |

## Quickstart

```bash
furia-market install profile-search-strike
# (Optional) Add environment config
furia-market install profile-env-permissive
```

## Compose

```bash
# Search & Strike in denied environment
furia-market install profile-search-strike
furia-market install profile-env-denied
```
