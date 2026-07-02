# Frequently Asked Questions

## General

**Q: What is Furia?**
A: A modular C2 platform that generates complete C2 systems from 7 templates.
You choose the template — C2 HQ, Frontline, Edge, Maritime, Airborne,
Intelligence, or Messaging — and Furia activates the right services.

**Q: How is this different from traditional C2 systems?**
A: Traditional C2 systems are monolithic — one product for one mission.
Furia is modular — the same codebase generates different C2 systems for
different missions. A C-UAS operator gets a different interface than a
Brigade HQ, but they share the same platform underneath.

**Q: Is this NATO-compliant?**
A: Furia supports STANAG 4586 (UA-C2), STANAG 4609 (FMV), STANAG 4676
(tracking), and STANREC 4869 (SAPIENT C-UAS). It uses MIL-STD-2525D/APP-6
symbology and supports ADatP-3 and OTH-T Gold messaging formats.

## Technical

**Q: What are the minimum system requirements?**
A: For C2 Edge (lightest template): 1 GB RAM, 1 core, no database.
For C2 HQ (full template): 4 GB RAM, 2 cores, PostGIS database.
See the [Sizing Guide](developer-guide/sizing-guide.md) for details.

**Q: Do I need Postgres?**
A: For Tier 1 (3 services): no — runs in memory mode.
For Tier 2 and above: yes — PostGIS is required for persistence.

**Q: Can I run this without Docker?**
A: Yes. The macOS DMG bundles all services as native binaries.
Linux: build from source with `cargo build --release`.

**Q: What languages are extensions written in?**
A: Any language that compiles to WASM. Rust (primary), C, C++, Zig, Go
(via TinyGo) — all supported via the `provider_call` ABI.

## Deployment

**Q: Can I deploy this on a Kubernetes cluster?**
A: Yes. K3s manifests are provided in `deploy/k3s/`. Full K8s support
is available with Helm charts for the marketplace components.

**Q: How do I update an extension?**
A: Publish a new version with `furia-market publish --sign my-extension/`.
The marketplace tracks versions. Install the latest with
`furia-market install my-extension`.

**Q: Is there air-gapped deployment support?**
A: Yes. Use `furia-market export my-extension --output my.furia-mod`
on the connected system, transfer the file, then
`furia-market import my.furia-mod` on the air-gapped system.

## Licensing

**Q: What license is Furia under?**
A: Dual-licensed MIT / Apache 2.0. See the LICENSE file in the repo.

**Q: Can I build proprietary extensions?**
A: Yes. Extensions are WASM modules that implement SDK traits.
Your extension code is your IP. The SDK is open source.
