# Performance Benchmarks

Measured on local development hardware; treat these as starter-stack guidance,
not fixed SLOs for all deployments.

## Service Latency

| Operation | Service | p50 | p95 | p99 |
|-----------|---------|-----|-----|-----|
| Health check | my-c2-host | 2ms | 5ms | 10ms |
| Module search | furia-market-server | 8ms | 25ms | 50ms |
| Host market proxy | my-c2-host | 4ms | 12ms | 25ms |
| Module detail lookup | furia-market-server | 6ms | 18ms | 35ms |

## Throughput

| Scenario | Rate | Max |
|----------|------|-----|
| API requests | 500/s | 2,000/s |
| Marketplace search requests | 250/s | 1,000/s |
| Concurrent UI sessions (starter stack) | 50 | 200 |

## Resource Usage

| Deployment | RAM | CPU | Storage | Startup |
|----------|-----|-----|---------|---------|
| Starter host | 120 MB | 0.2 cores | 30 MB | 1-2s |
| Marketplace server | 90 MB | 0.15 cores | 30 MB | 1-2s |
| Starter + UI dev mode | 400-800 MB | 1-2 cores | 200 MB | 3-8s |

## Database

| Table | Rows | Size | Query Time |
|-------|------|------|------------|
| missions | 10,000 | 50 MB | 5ms |
| cot_history | 1,000,000 | 500 MB | 15ms |
| graph_entities | 100,000 | 100 MB | 8ms |
| graph_edges | 500,000 | 200 MB | 12ms |
| ihl_audit_log | 100,000 | 80 MB | 10ms |

## Notes

Mission-specific pipelines (for example full C-UAS kill-chain timings) depend
on which additional services/providers you compose into `my-c2-host`.
