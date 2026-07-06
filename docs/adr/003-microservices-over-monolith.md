# ADR-003: Microservices over Monolith

**Context:** The ecosystem contains many optional domain services. Why not a single binary?

**Decision:** Use a microservice architecture with per-domain services.

**Rationale:**
- Different C2 templates require different service combinations
- A starter deployment should not need to run every mission-domain service
- Independent deployment, scaling, and failure isolation
- Each service maps to a specific military C2 function
- Future: replace individual services without redeploying the platform

**Consequences:**
- A large service catalog is overwhelming without profile/template abstraction
- Service discovery is handled by env vars and Zenoh pub/sub
- Inter-service communication adds ~1ms latency per hop
- Postgres is the single source of truth for persisted state
