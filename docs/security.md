# Security & Compliance

## Extension Security

All extensions run in a WASM sandbox with enforced limits:

| Protection | Mechanism | Default |
|-----------|-----------|---------|
| Memory limit | Sandbox memory cap | 64 MB |
| CPU limit | Fuel per tick | 50,000 units |
| Network access | Controlled by manifest | Off by default |
| Filesystem access | Controlled by manifest | Off by default |
| Crash isolation | Process-level sandbox | Independent process |
| Supply chain | Ed25519 signature | Required for publish |

## IHL Enforcement

The `policy-service` enforces International Humanitarian Law on every
lethal action:

1. **Distinction**: Check that the target is a legitimate military objective
2. **Proportionality**: Compare military advantage vs. collateral damage
3. **Precaution**: Verify that all feasible precautions were taken
4. **Override**: Commander can override with audit trail

All IHL evaluations are logged to the `ihl_audit_log` table in PostGIS
with full details of the decision, including the operator who approved
or overrode the action.

## Network Security

| Layer | Protection |
|-------|-----------|
| Service-to-service | Plain HTTP (mTLS planned) |
| External API | JWT authentication via auth-proxy |
| ATAK integration | mTLS required for TAK server |
| Extension network | Sandboxed, gated by manifest |

## Data Protection

| Data | Storage | Protection |
|------|---------|------------|
| Mission plans | PostGIS | Database-level access control |
| CoT history | PostGIS | Temporal graph with access logging |
| BDA chains | PostGIS | Immutable audit trail |
| IHL decisions | PostGIS | Immutable with override tracking |
| C2 messages | PostGIS | Encrypted at rest |
| WASM modules | Filesystem | SHA-256 checksum + Ed25519 signature |

## Audit Trail

Every significant action is recorded:

| Action | Logged By | Detail |
|--------|-----------|--------|
| IHL decision | policy-service | Target, operator, decision, reason |
| Mission change | mission-orchestrator | Mission ID, field, old/new value |
| Extension install | module-loader | Module name, version, signer |
| C2 formation change | interop-gateway | Formation ID, role, partition |
| Engagement | kill-chain | Target, effector, outcome, BDA |
| Command dispatch | dispatch-adapter | Action, target, receipt |

## Compliance

- **STANAG 4586**: UA-C2 messaging
- **MIL-STD-2525D/APP-6**: Military symbology
- **NATO C2 Taxonomy**: Mission types, unit types, equipment
- **IHL/LOAC**: Distinction, proportionality, precaution
- **SAPIENT (STANREC 4869)**: C-UAS sensor/effector protocol
