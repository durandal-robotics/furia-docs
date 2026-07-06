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
