# Getting Started

## Don't Be Overwhelmed by "152 Services"

You don't need 152 services. You need **3**.

Furia has 152 services because it can generate C2 systems for **25 different
mission types** (C-UAS, C4ISR HQ, Frontline, ISR, MUM-T, maritime, etc.).
Each mission type uses a different combination. You only run the services
for YOUR mission.

## Tiered Approach — Start Small, Scale Up

### 🟢 Tier 1: Core C2 (3 services, 5 minutes)

The absolute minimum: API gateway + extension system. No Postgres needed.

```bash
git clone https://github.com/vlordier/furia-control.git
cd furia-control
just setup

# See what's running:
open http://localhost:3226/swagger-ui/   # API Gateway (23 endpoints)
open http://localhost:3030/api/v1/search?q=*  # Marketplace (98 modules)
```

| Service | Port | Purpose |
|---------|------|---------|
| `interop-gateway` | 3226 | API, Swagger, CoT, ATAK, STANAG |
| `furia-market-server` | 3030 | Extension registry, search, publish |
| `furia-module-loader` | 3031 | WASM sandbox, module lifecycle |

**What you can do with 3 services:**
- Browse the API documentation (Swagger UI)
- Query the marketplace for extensions
- Install and load WASM modules
- Start building your own extension

**No Postgres needed.** Runs in memory mode (`FURIA_STORAGE_DRIVER=memory`).

### 🟡 Tier 2: C4ISR HQ (+4 services, 10 minutes)

Add persistence, mission planning, and IHL gating.

```bash
export DATABASE_URL=postgres://furia:furia@localhost:5432/furia-c4isr
just postgres
cargo run --release -p mission-orchestrator &
cargo run --release -p policy-service &
cargo run --release -p military-messaging &
```

| Service | Port | Purpose |
|---------|------|---------|
| `postgis` | 5432 | PostgreSQL + PostGIS |
| `mission-orchestrator` | 3003 | Mission lifecycle, persistence |
| `policy-service` | 3004 | IHL gating, ROE enforcement |
| `military-messaging` | 3380 | SitRep, OPORD, MEDEVAC 9-line |

**What you can now do:**
- Create missions that persist across restarts
- Enforce ROE with IHL gating
- Send and receive C2 messages
- Track mission history with BDA chains

### 🔴 Tier 3: Full Platform (All 152 services)

Install a C2 profile to activate the right services for your mission.

```bash
# Counter-UAS
cargo run --release -p furia-market -- install profile-c-uas

# Or C4ISR Headquarters
cargo run --release -p furia-market -- install profile-furia-hq

# Or Tactical Frontline
cargo run --release -p furia-market -- install profile-furia-frontline
```

Each profile activates exactly the services you need — not all 152.

## Other Quickstart Paths

### Desktop App (macOS DMG)

```bash
cd furia-control
scripts/build-dmg.sh
open FuriaC4ISR.dmg
```

### Docker Compose

```bash
docker compose -f deploy/full-stack/docker-compose.yml up -d
```

## Build an Extension

```bash
# See: docs/tutorials/building-an-extension.md
furia-market dev my-extension
```

## Learn More

- [Architecture Overview](developer-guide/building-your-own-c2.md)
- [Assurance & Proofs](developer-guide/assurance-and-proofs.md)
- [SDK Reference](SDK.md)
- [Extension Catalog](extensions/catalog.md)
- [C2 Profiles](c2-types/overview.md)
- [Troubleshooting](developer-guide/troubleshooting.md)

## Standalone Repositories

For delivery-focused builds, use the split repositories:

- `durandal-robotics/my-c2-host`
- `durandal-robotics/my-c2-ui`
- `durandal-robotics/furia-market-server`

This lets teams ship host/UI/market independently while keeping SDK compatibility.

## Naming

| Prefix | Meaning |
|--------|---------|
| `furia-` | Current SDK crates and tools |
| `durandal-` | Legacy domain crates (gradually migrating) |
