# Service Port Map (Public Starter Stack)

This page documents the ports that are part of the public split-repo starter.

## Core Runtime

| Service | Port | Purpose |
|---------|------|---------|
| `my-c2-host` | `3226` | Host health/capability APIs + marketplace proxy |
| `furia-market-server` | `3030` | Module search, manifest, compatibility, publish/download |
| `my-c2-ui` (Vite dev server) | `5173` (default) | Operator UI in development mode |

## Common Host Endpoints (3226)

| Endpoint | Purpose |
|----------|---------|
| `GET /health` | Basic health and profile/capability advertisement |
| `GET /api/c2/health` | C2 health payload for UI/client use |
| `GET /api/c2/market/health` | Marketplace upstream health via host proxy |
| `GET /api/c2/market/search` | Module search via host proxy |
| `GET /api/c2/market/modules/:name/:version` | Module manifest via host proxy |
| `GET /api/c2/market/modules/:name/versions` | Module versions via host proxy |
| `GET /api/c2/market/modules/:name/:version/download` | Module binary download via host proxy |

## Common Marketplace Endpoints (3030)

| Endpoint | Purpose |
|----------|---------|
| `GET /health` | Marketplace health |
| `GET /api/v1/search?q=...` | Module search |
| `GET /api/v1/modules/:name/:version` | Module manifest |
| `GET /api/v1/modules/:name/versions` | Module versions |
| `GET /api/v1/modules/:name/:version/download` | WASM/module artifact download |
| `GET /api/v1/modules/compatibility` | SDK compatibility information |
| `POST /api/v1/modules/publish` | Publish module (multipart) |

## Extending Beyond Starter Ports

When you compose additional mission services from `furia-core`, document their
ports in your product repo (`my-c2-host`) so operators have a single source of truth.
