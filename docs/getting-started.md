# Getting Started

Choose your path based on what you want to do.

## 🚀 I Want to Run a C2 System

### Option 1: One-Command Setup (macOS)

```bash
git clone https://github.com/vlordier/furia-control.git
cd furia-control
just setup
```

This clones furia-core, builds the gateway, starts Postgres (or falls back to
in-memory mode), and launches the API. Open `http://localhost:3226/swagger-ui/`.

### Option 2: Desktop App (macOS DMG)

```bash
cd furia-control
scripts/build-dmg.sh
open FuriaC4ISR.dmg
```

### Option 3: Docker Compose

```bash
docker compose -f deploy/full-stack/docker-compose.yml up -d
```

## 🔧 I Want to Build an Extension

```bash
# Install prerequisites
cargo install furia-market

# Scaffold a new extension
furia-market dev my-custom-policy

# Implement an SDK trait (edit src/lib.rs)
# See: docs/tutorials/building-an-extension.md

# Publish
furia-market publish --sign my-custom-policy/
```

## 📚 I Want to Learn the Architecture

- [Architecture Overview](developer-guide/building-your-own-c2.md)
- [SDK Reference](SDK.md)
- [Extension Catalog](extensions/catalog.md)
- [C2 Profiles](c2-types/overview.md)

## ❓ I Have Questions

- [Troubleshooting Guide](developer-guide/troubleshooting.md)
- GitHub Issues: https://github.com/vlordier/furia-control/issues

## Naming Conventions

The codebase uses two naming prefixes:

| Prefix | Meaning | Examples |
|--------|---------|---------|
| `furia-` | **Current** SDK crates and tools | `furia-sdk`, `furia-market`, `furia-graph` |
| `durandal-` | **Legacy** domain crates (gradually migrating) | `durandal-bda`, `durandal-iff`, `durandal-medevac` |

Both work identically. New crates use `furia-`, existing domain crates keep
`durandal-` for now. They're interchangeable at the SDK trait level.
