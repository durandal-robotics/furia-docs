# Getting Started

## Don't Be Overwhelmed by "152 Services"

You don't need 152 services. You need **3**.

Furia has 152 services because it can generate C2 systems for **25 different
mission types** (C-UAS, C4ISR HQ, Frontline, ISR, MUM-T, maritime, etc.).
Each mission type uses a different combination. You only run the services
for YOUR mission.

## Tiered Approach — Start Small, Scale Up

### 🟢 Tier 1: Core C2 (2 services, 5 minutes)

The absolute minimum: C2 host + marketplace. No Postgres needed.

```bash
git clone https://github.com/durandal-robotics/my-c2-host.git
git clone https://github.com/durandal-robotics/furia-market-server.git

# terminal 1
cd my-c2-host
cargo run

# terminal 2
cd ../furia-market-server
cargo run

# See what's running:
open http://localhost:3226/health
open http://localhost:3226/api/c2/health
open http://localhost:3030/api/v1/search?q=*  # Marketplace
```

| Service | Port | Purpose |
|---------|------|---------|
| `my-c2-host` | 3226 | C2 host API, profile/capability health, market proxy |
| `furia-market-server` | 3030 | Extension registry, search, publish |

**What you can do with 2 services:**
- Validate host health/capability surfaces
- Query the marketplace for extensions
- Inspect module versions/details/download artifacts
- Start building your own host/UI integration

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

### Desktop App (my-c2-ui)

```bash
git clone https://github.com/durandal-robotics/my-c2-ui.git
cd my-c2-ui
npm install
npm run dev
```

### Local release build (my-c2-host)

```bash
cd my-c2-host
FURIA_C2_PROFILE=cuas cargo build --release
./target/release/my-c2-host
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
