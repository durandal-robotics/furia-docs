# Deployment Sizing Guide

## Resource Estimates

| Deployment | Users | RAM | CPU | Storage | Services |
|-----------|-------|-----|-----|---------|----------|
| **C-UAS** (3 svcs) | 1-3 | 1 GB | 1 core | 5 GB | counter-uas-director, sapient-adapter, airspace |
| **C4ISR HQ** (7 svcs) | 3-10 | 4 GB | 2 cores | 20 GB | gateway, policy, mission, messaging, postgis |
| **Full Platform** (152 svcs) | 10-50 | 16 GB | 8 cores | 100 GB | all services + postgis |
| **Edge/K3s** (7 svcs) | 1-5 | 2 GB | 2 cores | 10 GB | minimal: gateway, policy, mission, messaging |

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
| macOS DMG | 2 min | Low | Demo, single operator |
| Docker Compose | 5 min | Low | Development, team eval |
| K3s | 10 min | Medium | Edge production (1-5 users) |
| Full K8s | 30+ min | High | Enterprise (10-50 users) |
