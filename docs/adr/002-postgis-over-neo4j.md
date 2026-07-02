# ADR-002: PostGIS over Neo4j for Graph Storage

**Context:** Need to store temporal entity relationships (CoT history,
BDA chains). Options: Neo4j, ArangoDB, PostGIS adjacency tables.

**Decision:** Use PostGIS adjacency tables with recursive CTEs.

**Rationale:**
- Avoids operational complexity of a separate graph database
- Co-locates spatial and graph data (spatial indexes on entities + edges)
- Recursive CTEs handle 10-hop BDA chain traversals
- pgRouting provides route optimization on the same database
- One database to backup, monitor, and tune

**Consequences:**
- Graph queries are SQL, not Cypher
- Deep traversals (>10 hops) may need optimization
- furia-graph crate provides a Rust API over the SQL queries
