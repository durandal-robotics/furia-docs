# Building an Extension

This tutorial walks through creating a complete Furia extension from scratch.
You'll build a custom `PolicyProvider` that checks if a target is within
a restricted zone.

## Prerequisites

- Rust 1.85+ with `wasm32-wasip2` target
- Public repos cloned (`my-c2-host`, `furia-core`, and optionally `my-c2-ui`)
- `furia-market` CLI built (`cargo build -p furia-market`)

## Step 1: Scaffold the Extension

```bash
furia-market dev new my-zone-policy
cd my-zone-policy
```

This creates:
```
my-zone-policy/
├── Cargo.toml
├── furia-mod.toml
├── .cargo/config.toml
└── src/
    └── lib.rs
```

## Step 2: Define the Manifest

Update `furia-mod.toml`:

```toml
[module]
id = "my-zone-policy"
name = "Zone-Based Policy Enforcer"
version = "0.1.0"
kind = "policy"
description = "Denies actions against targets in restricted geographic zones"
author = "Your Name"
license = "Apache-2.0"

[sdk]
min_version = "0.1.0"

[security]
requires_filesystem = false
requires_network = false
sandbox_memory_mb = 32
max_fuel_per_tick = 10000
```

## Step 3: Implement the SDK Trait

Edit `src/lib.rs`:

```rust
//! Zone-based policy enforcer — denies actions in restricted zones.
//!
//! This extension implements the `PolicyProvider` trait from furia-sdk.
//! When compiled to WASM, it can be loaded into the Furia module sandbox
//! and used by the policy-service for IHL gating.

#![cfg_attr(target_arch = "wasm32", no_std)]

#[cfg(not(target_arch = "wasm32"))]
extern crate std;

use core::fmt;

// In WASM mode, we use alloc instead of std
#[cfg(target_arch = "wasm32")]
extern crate alloc;
#[cfg(target_arch = "wasm32")]
use alloc::string::{String, ToString};
#[cfg(target_arch = "wasm32")]
use alloc::vec::Vec;

use serde::{Deserialize, Serialize};

// The SDK trait is only available in native mode.
// WASM modules use the generic provider_call ABI instead.
#[cfg(not(target_arch = "wasm32"))]
use furia_sdk::module_handle::ModuleHandle;
#[cfg(not(target_arch = "wasm32"))]
use furia_sdk::policy::{PolicyProvider, PolicyContext, PolicyDecision, PolicyError};

/// A restricted geographic zone.
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct RestrictedZone {
    pub name: String,
    pub min_lat: f64,
    pub max_lat: f64,
    pub min_lon: f64,
    pub max_lon: f64,
    pub reason: String,
}

/// Zone-based policy provider.
pub struct ZonePolicyProvider {
    restricted_zones: Vec<RestrictedZone>,
}

impl ZonePolicyProvider {
    pub fn new(zones: Vec<RestrictedZone>) -> Self {
        Self { restricted_zones: zones }
    }

    /// Check if coordinates fall within any restricted zone.
    pub fn is_in_restricted_zone(&self, lat: f64, lon: f64) -> Option<&RestrictedZone> {
        self.restricted_zones.iter().find(|z| {
            lat >= z.min_lat && lat <= z.max_lat
            && lon >= z.min_lon && lon <= z.max_lon
        })
    }
}

// Native implementation (for local testing)
#[cfg(not(target_arch = "wasm32"))]
#[async_trait::async_trait]
impl PolicyProvider for ZonePolicyProvider {
    async fn evaluate(
        &self,
        ctx: &PolicyContext,
        _handle: &ModuleHandle,
    ) -> Result<PolicyDecision, PolicyError> {
        // Check if target coordinates are in a restricted zone
        if let (Some(lat), Some(lon)) = (ctx.target_lat, ctx.target_lon) {
            if let Some(zone) = self.is_in_restricted_zone(lat, lon) {
                return Ok(PolicyDecision::Deny {
                    reason: format!(
                        "Target in restricted zone '{}': {}",
                        zone.name, zone.reason
                    ),
                    can_override: true,
                });
            }
        }
        Ok(PolicyDecision::Allow)
    }

    fn version(&self) -> &'static str {
        "0.1.0"
    }

    fn health(&self) -> furia_sdk::module_handle::ModuleHealth {
        furia_sdk::module_handle::ModuleHealth::Healthy
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_zone_check() {
        let provider = ZonePolicyProvider::new(vec![
            RestrictedZone {
                name: "Civilian Area".into(),
                min_lat: 48.85, max_lat: 48.86,
                min_lon: 2.35, max_lon: 2.36,
                reason: "Civilian population center".into(),
            },
        ]);

        // Inside zone → denied
        assert!(provider.is_in_restricted_zone(48.855, 2.355).is_some());

        // Outside zone → allowed
        assert!(provider.is_in_restricted_zone(48.0, 2.0).is_none());
    }
}
```

## Step 4: Build for WASM

```bash
# Build for native (testing)
cargo build -p my-zone-policy

# Build for WASM (marketplace deployment)
cargo build --target wasm32-wasip2 -p my-zone-policy
```

The WASM binary is at `target/wasm32-wasip2/release/my_zone_policy.wasm`.

## Step 5: Publish to Marketplace

```bash
# Generate a signing key (first time)
furia-market key gen

# Publish with signature
furia-market publish --sign my-zone-policy/
```

## Step 6: Install and Test

```bash
# Start the marketplace
cargo run -p furia-market-server &

# Install the extension
furia-market install my-zone-policy

# Verify it's loaded
furia-market verify my-zone-policy
```

## Step 7: Create a Profile

Bundle your extension with other services into a C2 profile:

```toml
# meta/my-c2/furia-mod.toml
[module]
id = "profile-my-c2"
name = "My Custom C2"
kind = "meta"
description = "Custom C2 with zone-based policy enforcement"

[dependencies]
interop-gateway = ">=0.1.0"
policy-service = ">=0.1.0"
my-zone-policy = ">=0.1.0"
```

## WASM ABI

Extensions communicate with the runtime via the generic `provider_call` ABI:

```wasm
(func provider_call
  (param method_ptr i32)
  (param method_len i32)
  (param args_ptr i32)
  (param args_len i32)
  (result i32))
```

The method name is a string like `"policy::evaluate"`, and the args are
a JSON-encoded parameter. The result is a JSON-encoded response written
to the module's memory at offset 0.

## Testing

```bash
# Run unit tests
cargo test -p my-zone-policy

# Run integration test (requires marketplace)
cargo test -p pipeline-e2e
```

## Packaging Checklist

- [ ] `furia-mod.toml` with correct metadata and security requirements
- [ ] Cargo.toml with `default = ["native"]`, `wasm = []` features
- [ ] tokio/reqwest gated behind `cfg(not(target_arch = "wasm32"))`
- [ ] `#[cfg(target_arch = "wasm32")]` for alloc/std imports
- [ ] Unit tests for core logic
- [ ] Ed25519 signing before publishing
- [ ] Profile manifest for easy installation
---

## Version Compatibility

Every extension declares its required SDK version in `furia-mod.toml`:

```toml
[sdk]
min_version = "0.1.0"
```

The marketplace exposes a compatibility endpoint:

```bash
curl http://localhost:3030/api/v1/modules/compatibility
```

```json
{
  "sdk_version": "0.2.0",
  "total_extensions": 98,
  "compatibility_matrix": {
    "0.1.0": "current"
  }
}
```

The module loader checks SDK compatibility on install. Mismatches are
warned but not blocked — extensions may still work if the ABI hasn't
changed.

### Version Matrix

| SDK Version | Status | Breaking Changes |
|------------|--------|-----------------|
| 0.1.0 | Current | — |
| 0.2.0 | Planned | provider_call ABI stabilization |

## Multi-Language Support

Extensions can be written in any language that compiles to WASM.
The `provider_call` ABI is language-agnostic — it passes JSON strings
through a standard C ABI interface.

### C ABI

The runtime looks for these exports in the WASM module:

```c
// Required: memory for data exchange
(memory (export "memory") 1)

// Optional: lifecycle hooks
int32_t provider_init(int32_t config_ptr, int32_t config_len);
int32_t provider_tick(int32_t state_ptr, int32_t state_len);

// REQUIRED: generic method dispatch
int32_t provider_call(
    int32_t method_ptr,    // pointer to method name string
    int32_t method_len,    // length of method name
    int32_t args_ptr,      // pointer to JSON args
    int32_t args_len       // length of JSON args
);

// Optional: health
int32_t provider_health();
```

### Language Examples

**C/C++:**
```c
__attribute__((export_name("provider_call")))
int provider_call(int method_ptr, int method_len, int args_ptr, int args_len) {
    // Read method name and args from WASM memory
    // Return JSON result via output pointer at offset 0
    return 0;
}
```

**Zig:**
```zig
export fn provider_call(method_ptr: i32, method_len: i32, args_ptr: i32, args_len: i32) i32 {
    return 0;
}
```

**Go (with TinyGo):**
```go
//export provider_call
func providerCall(methodPtr, methodLen, argsPtr, argsLen int32) int32 {
    return 0
}
```

### Data Exchange Protocol

Arguments and results are JSON-encoded and exchanged through the
module's linear memory:

```
Input:
  offset 4096: method name (UTF-8)
  offset 8192: JSON arguments

Output:
  offset 0:    8-byte u64 pointer to result
  offset 8:    4-byte u32 result length
  result data: JSON-encoded at [pointer, pointer+length]

Return value:
  0 = success
  non-zero = error code
```
