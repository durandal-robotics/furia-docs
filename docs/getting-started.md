# Getting Started

## Start Small, Then Compose

You do not need a full mission stack to start. Begin with **host + market + UI**
and add only the services your mission requires.

## Tiered Approach — Start Small, Scale Up

### 🟢 Tier 1: Core C2 APIs (2 services, ~5 minutes)

The absolute minimum is `my-c2-host` + `furia-market-server`. No Postgres is required.

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
open "http://localhost:3030/api/v1/search?q=*"
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

### 🟡 Tier 2: Add Operator UI (+1 app, ~10 minutes)

Run `my-c2-ui` against your host.

```bash
git clone https://github.com/durandal-robotics/my-c2-ui.git
cd my-c2-ui
npm install
npm run dev
```

| Service | Port | Purpose |
|---------|------|---------|
| `my-c2-ui` | 5173 (dev) | Operator UX consuming host + market APIs |

**What you can now do:**
- Inspect live profile/capability state from the host
- Browse/search modules through the market proxy
- Download/install-ready module artifacts from the UI

### 🔴 Tier 3: Mission-Specific Expansion

Add additional services from `furia-core` and related repos (for example:
mission orchestration, policy/IHL, interop bridges) as required by your use case.

```bash
# Example host profile switches
cd ../my-c2-host
FURIA_C2_PROFILE=cuas cargo run
FURIA_C2_PROFILE=drone-swarm cargo run
FURIA_C2_PROFILE=isr cargo run
```

Each profile advertises a capability set and can be extended with additional
runtime services when needed.

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
