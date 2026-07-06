# C2 Types Overview

Furia generates 25 different C2 configurations from the same codebase.
Each profile selects the right combination of services, extensions, and UI.

## How Profiles Work

```bash
# Install a profile
furia-market install profile-furia-hq

# Compose with environment
furia-market install profile-furia-hq
furia-market install profile-env-denied

# Run host + UI
cd ~/Work/my-c2-host && FURIA_C2_PROFILE=general cargo run
# (new terminal)
cd ~/Work/my-c2-ui && npm run dev
```

## Profile Structure

| Profile | Services | Extensions | Use Case |
|---------|----------|------------|----------|
| `profile-c-uas` | 3 | 5 | Counter-drone defense |
| `profile-furia-hq` | 4 | 7 | C4ISR Headquarters |
| `profile-furia-frontline` | 3 | 7 | Tactical C2 |
| `profile-fpv-isr` | 3 | 6 | FPV drone ISR |
| `profile-isr-deep` | 4 | 7 | Deep reconnaissance |
| `profile-search-strike` | 3 | 7 | Find and engage |
| `profile-mum-t` | 3 | 6 | Manned-unmanned teaming |
| `profile-gs-like` | 3 | 8 | Ground control station |
| `profile-maritime` | 3 | 5 | Maritime awareness |
| `profile-denied-environment` | 2 | 6 | GNSS-denied ops |
| `profile-c2-messaging` | 1 | 5 | Military messaging |
| `profile-fires-targeting` | 10 | 8 | Targeting lifecycle |
| `profile-fires-bda` | 5 | 5 | Battle damage assessment |
| `profile-fires-cuas` | 3 | 3 | C-UAS director |
| `profile-fires-roe` | 4 | 4 | Rules of engagement |
| `profile-fires-support` | 6 | 6 | Fires support |
| `profile-planning-mission` | 6 | 6 | Mission planning |
| `profile-planning-decision` | 4 | 4 | Decision support |
| `profile-planning-orders` | 3 | 3 | Military orders |
| `profile-planning-sim` | 5 | 5 | Wargaming |
| `profile-intel-isr` | 5 | 5 | ISR fusion |
| `profile-intel-analysis` | 4 | 4 | Intel analysis |
| `profile-intel-cyber` | 4 | 4 | Cyber operations |
| `profile-env-permissive` | 1 | 1 | Clear environment |
| `profile-env-denied` | 2 | 4 | Denied environment |
| `profile-env-contested` | 2 | 5 | Contested environment |

## Environment Composition

Profiles compose. Install a mission profile + environment config:

```bash
# Counter-drone in contested spectrum
furia-market install profile-c-uas
furia-market install profile-env-contested

# Deep ISR behind enemy lines
furia-market install profile-isr-deep
furia-market install profile-env-denied

# Full HQ with messaging
furia-market install profile-furia-hq
furia-market install profile-c2-messaging
```

## All Profiles Verified

Every profile is tested in CI:
- Services compile and respond
- Dependencies resolve in marketplace
- E2E tests verify API endpoints
- UI screenshots capture the operator experience