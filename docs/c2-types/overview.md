# C2 Types Overview

Furia uses profiles to select capability sets from the same ecosystem.
In the public starter host, profiles are controlled with `FURIA_C2_PROFILE`.

## How Profiles Work

```bash
# Run host + UI
cd ~/Work/my-c2-host && FURIA_C2_PROFILE=general cargo run
# (new terminal)
cd ~/Work/my-c2-ui && npm run dev
```

## Profile Structure

| Profile | Use Case | Notes |
|---------|----------|-------|
| `general` | Baseline C2 startup | Default profile |
| `cuas` | Counter-UAS | Enables C-UAS capability group |
| `drone-swarm` | Swarm operations | Enables swarm capability group |
| `isr` | ISR-focused operations | Enables ISR capability group |

## Environment Composition

Profiles compose by host configuration and module activation:

```bash
FURIA_C2_PROFILE=cuas cargo run
FURIA_C2_PROFILE=drone-swarm cargo run
FURIA_C2_PROFILE=isr cargo run
```

## Verification Approach

Profile behavior is verified through:
- host health/capability responses (`/health`, `/api/c2/health`)
- marketplace query/download flow through host proxy
- UI integration against profile-advertised capabilities