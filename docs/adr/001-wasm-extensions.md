# ADR-001: WASM Extensions over Native Plugins

**Context:** The platform needs a plugin system for third-party extensions.
Options: native shared libraries (.so/.dylib), WASM sandbox, or scripting.

**Decision:** Use WASM with a generic `provider_call` ABI.

**Rationale:**
- WASM provides memory safety, fuel limits, and crash isolation out of the box
- Any language that compiles to WASM is supported (Rust, C, Zig, Go)
- The `provider_call` ABI with JSON arguments is language-agnostic
- No need to trust third-party code — the sandbox enforces limits
- WASM binary size is small (~100 KB per extension)

**Consequences:**
- Extensions pay a small serialization overhead for JSON ABI
- Async operations require cooperative multitasking (no thread spawning)
- WASM compilation is a build step that extension developers must configure
