# Deployment Sizing Guide

## Resource Estimates

| Deployment | Users | RAM | CPU | Storage | Notes |
|-----------|-------|-----|-----|---------|----------|
| **Starter host + market** | 1-3 | 512 MB-1 GB | 1 core | 2-5 GB | `my-c2-host` + `furia-market-server` |
| **Starter + UI** | 1-5 | 1-2 GB | 2 cores | 5-10 GB | add `my-c2-ui` dev/runtime |
| **Expanded mission stack** | 5+ | Varies by services | Varies | Varies | add `furia-core` services/providers as needed |

## Database Sizing

| Data Type | Growth Rate | 30 Days | 1 Year |
|-----------|------------|---------|--------|
| Mission plans | ~1 MB/mission | 30 MB | 365 MB |
| CoT track history | ~100 B/event | 100 MB | 1.2 GB |
| BDA chains | ~5 KB/chain | 15 MB | 180 MB |
| C2 messages | ~2 KB/msg | 60 MB | 730 MB |
| Total | — | ~200 MB | ~2.5 GB |

## Deployment Options

| Option | Setup Time | Complexity | Best For |
|--------|-----------|------------|----------|
| Local host + market | 5 min | Low | API development and integration |
| Local host + market + UI | 10 min | Low | Operator UX development |
| Docker Compose | 10-20 min | Medium | Team integration environments |
| K3s/K8s | 30+ min | High | Production deployments |
