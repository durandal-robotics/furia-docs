# ADR-003: Microservices over Monolith

**Context:** The C2 platform has 152 services. Why not a single binary?

**Decision:** Use a microservice architecture with per-domain services.

**Rationale:**
- Different C2 templates require different service combinations
- C2 Edge (4 services) should not need to run targeting services
- Independent deployment, scaling, and failure isolation
- Each service maps to a specific military C2 function
- Future: replace individual services without redeploying the platform

**Consequences:**
- 152 services is overwhelming without the template abstraction
- Service discovery is handled by env vars and Zenoh pub/sub
- Inter-service communication adds ~1ms latency per hop
- Postgres is the single source of truth for persisted state
