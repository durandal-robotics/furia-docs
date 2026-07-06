# Assurance and Proofs

Furia delivery readiness requires both runtime tests and formal assurance lanes.

## Target Repositories

- **my-c2-host**: host composition and service orchestration
- **my-c2-ui**: operator-facing UI shell and integration surfaces
- **furia-market-server**: module registry, publish, search, dependency resolution

## Standard Rust Assurance Stack

For Rust services and libraries, use this baseline:

1. `cargo test --all-targets` (unit + integration + proptest-backed tests)
2. TLA+ model checks (when `.tla` specs are present)
3. Kani bounded checks
4. Verus proofs (where annotated)
5. Creusot contract checks
6. `cargo fuzz run ...` for parser/search/input fuzzing

Unavailable tools must be reported as **SKIP(reason)** rather than silently ignored.

## Proof Matrix Scripts

The host and marketplace repos include a `scripts/proof-matrix.sh` entrypoint.

```bash
cd my-c2-host
./scripts/proof-matrix.sh

cd ../furia-market-server
./scripts/proof-matrix.sh
```

Heavy lanes are intentionally opt-in:

```bash
PROOF_RUN_HEAVY=1 ./scripts/proof-matrix.sh
```

## Build-Time Configuration Guidance

Prefer build-time profile selection and deterministic startup wiring for deployable artifacts:

- compile-time or release-time profile defaults
- environment overlays per theater (dev, permissive, contested, denied)
- reproducible release bundles (host + ui + marketplace compatibility pinned)

## UI Repo Policy

`my-c2-ui` is TypeScript-first, but release acceptance depends on Rust-side proof status from the host and marketplace.

Minimum UI gate:

```bash
npm run build
```

## Delivery Exit Criteria

A release is ready when:

- host proof matrix passes (or explicit SKIP(reason))
- marketplace proof matrix passes (or explicit SKIP(reason))
- UI build passes
- docs and runbooks are updated with the exact release workflow

### Stricter docs ↔ code parity (public repos only)

Use this checklist before each public docs release to ensure commands/endpoints
still match real code in each public repo:

| Repo | What docs must match | Fast parity commands |
|------|-----------------------|----------------------|
| `furia-core` | crate names, SDK trait names, build/test commands | `cd ~/Work/furia-core && cargo test --all-targets` |
| `furia-ui` | package names, UI library usage, frontend test/build commands | `cd ~/Work/furia-ui && npx vitest run` |
| `furia-market-server` | `/health`, `/api/v1/search`, module publish/download/compatibility endpoints, proof script references | `cd ~/Work/furia-market-server && cargo test --all-targets && ./scripts/proof-matrix.sh` |
| `my-c2-host` | `/health`, `/api/c2/health`, `/api/c2/market/*` proxy routes, profile env vars | `cd ~/Work/my-c2-host && cargo test --all-targets && ./scripts/proof-matrix.sh` |
| `my-c2-ui` | host/market URLs, build profiles, install/download UI flow, build commands | `cd ~/Work/my-c2-ui && npm run build` |

Minimum parity sweep in `furia-docs` before publishing:

```bash
cd ~/Work/furia-docs
rg -n "furia-control|vlordier|FuriaC4ISR|just setup|localhost:3031|furia-market -- install" docs mkdocs.yml --glob '!docs/developer-guide/assurance-and-proofs.md'
python3 -m mkdocs build
```

Expected result:
- zero matches for stale/proprietary patterns
- successful MkDocs build
