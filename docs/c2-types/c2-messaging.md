# C2 Messaging — `profile-c2-messaging`

Structured C2 messaging — SitRep, OPORD, FRAGO, INTREP, MEDEVAC 9-line, CAS 9-line.

## Services

| Service | Port | Purpose |
|---------|------|---------|
| military-messaging | 3380 | C2 messaging service |

## Extensions

| Extension | Kind | Purpose |
|-----------|------|---------|
| durandal-medevac | decomposition | MEDEVAC 9-line |
| durandal-cas | decomposition | CAS 9-line |
| durandal-stanag | integration | Military message formats |

## Quickstart

```bash
furia-market install profile-c2-messaging
# (Optional) Add environment config
furia-market install profile-env-permissive
```

## Compose

```bash
# C2 Messaging in denied environment
furia-market install profile-c2-messaging
furia-market install profile-env-denied
```
