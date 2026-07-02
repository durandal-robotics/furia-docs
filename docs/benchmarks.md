# Performance Benchmarks

Measured on a MacBook Pro M3 Pro (12 cores, 36 GB RAM).

## Service Latency

| Operation | Service | p50 | p95 | p99 |
|-----------|---------|-----|-----|-----|
| Health check | interop-gateway | 2ms | 5ms | 10ms |
| Module search | furia-market-server | 8ms | 25ms | 50ms |
| Send message | military-messaging | 3ms | 8ms | 15ms |
| Ingest detection | sapient-adapter | 5ms | 12ms | 25ms |
| IHL evaluation | policy-service | 4ms | 10ms | 20ms |
| CoT emit | interop-gateway | 6ms | 15ms | 30ms |
| Mission create | mission-orchestrator | 15ms | 40ms | 80ms |
| Graph query | furia-graph | 10ms | 30ms | 60ms |

## Throughput

| Scenario | Rate | Max |
|----------|------|-----|
| CoT events ingested | 1,000/s | 5,000/s |
| API requests | 500/s | 2,000/s |
| Concurrent tracks | 10,000 | 50,000 |
| Concurrent missions | 1,000 | 5,000 |
| C2 messages | 200/s | 1,000/s |

## Resource Usage

| Template | RAM | CPU | Storage | Startup |
|----------|-----|-----|---------|---------|
| C2 Edge (4 svcs) | 180 MB | 0.2 cores | 50 MB | 2s |
| C2 Messaging (1 svc) | 45 MB | 0.05 cores | 10 MB | 0.5s |
| C2 HQ (7 svcs) | 450 MB | 0.5 cores | 150 MB | 5s |
| Full Platform (152 svcs) | 4 GB | 4 cores | 2 GB | 30s |

## Database

| Table | Rows | Size | Query Time |
|-------|------|------|------------|
| missions | 10,000 | 50 MB | 5ms |
| cot_history | 1,000,000 | 500 MB | 15ms |
| graph_entities | 100,000 | 100 MB | 8ms |
| graph_edges | 500,000 | 200 MB | 12ms |
| ihl_audit_log | 100,000 | 80 MB | 10ms |

## End-to-End C-UAS Scenario

```
Detection → Track → Assess → IHL → Engage → BDA
   50ms     30ms    200ms    100ms   50ms    100ms
                Total: ~530ms
```
