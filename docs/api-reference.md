# API Reference

## Live API Playground

<a href="http://localhost:3226/swagger-ui/" target="_blank" style="display: inline-block; padding: 12px 24px; background: #6366f1; color: white; text-decoration: none; border-radius: 8px; font-weight: bold; font-size: 18px;">🔌 Open Swagger UI →</a>

Or visit [http://localhost:3226/swagger-ui/](http://localhost:3226/swagger-ui/)

---


The Furia platform exposes its capabilities through REST APIs.
The primary entry point is the **interop-gateway** at port 3226,
which provides a Swagger UI for interactive exploration.

## Swagger UI

[http://localhost:3226/swagger-ui/](http://localhost:3226/swagger-ui/)

The Swagger UI documents **23 endpoints** across **7 tag groups**:

| Tag | Endpoints | Purpose |
|-----|-----------|---------|
| **health** | 2 | Service health, readiness |
| **atak** | 5 | ATAK CoT integration, mTLS status, commands |
| **adapters** | 5 | Adapter registration and lifecycle |
| **cot** | 3 | CoT event ingest, list, export |
| **policy** | 3 | IHL/ROE policy rule management |
| **ingest** | 3 | ASTERIX, SAPIENT, NITF ingestion |
| **interop** | 5 | NFFI conversion, COP publish, coalition partners |

## Core Service Endpoints

### interop-gateway (:3226)

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Service health and C2 profile |
| `/ready` | GET | Readiness check |
| `/metrics` | GET | Prometheus metrics |
| `/api/cot/events` | GET | Recent CoT events |
| `/api/c2/v1/formation` | GET | C2 formation status |
| `/api/c2/v1/formation` | POST | Create C2 formation |
| `/api/atak/v1/health` | GET | ATAK connection health |
| `/api/atak/v1/mtls/status` | GET | mTLS certificate status |
| `/api/atak/v1/command` | POST | Send ATAK command |
| `/api/v1/adapters` | GET | List registered adapters |
| `/api/v1/adapters` | POST | Register an adapter |
| `/api/v1/policy/rules` | GET | List IHL policy rules |
| `/api/v1/policy/rules` | POST | Add IHL policy rule |
| `/ingest/tak` | POST | Ingest CoT XML |
| `/ingest/asterix` | POST | Ingest ASTERIX data |
| `/ingest/sapient` | POST | Ingest SAPIENT detection |
| `/ingest/nitf` | POST | Ingest NITF imagery |

### furia-market-server (:3030)

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/v1/search` | GET | Search modules (`?q=`, `?kind=`, `?category=`) |
| `/api/v1/modules/:name/:version` | GET | Module manifest |
| `/api/v1/modules/:name/versions` | GET | Module version list |
| `/api/v1/modules/:name/:version/download` | GET | Download WASM binary |
| `/api/v1/modules/publish` | POST | Publish a module |
| `/api/v1/modules/compatibility` | GET | SDK version compatibility |

### military-messaging (:3380)

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/v1/status` | GET | Service health |
| `/api/v1/messages/send` | POST | Send a C2 message |
| `/api/v1/messages/inbox` | GET | List received messages |
| `/api/v1/messages/:id` | GET | Get message details |

### sapient-adapter (:3395)

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/v1/status` | GET | Service health |
| `/api/v1/ingest/detection` | POST | Ingest SAPIENT detection |
| `/api/v1/ingest/fusion` | POST | Ingest fusion report |
| `/api/v1/task/aim` | POST | AIM intent tasking |
| `/api/v1/task/strike` | POST | AIM strike report |

## OpenAPI Specification

The full OpenAPI 3.0 specification is available at:

```
http://localhost:3226/api-doc/openapi.json
```

This can be imported into API clients like Postman, Insomnia, or
directly into the Swagger UI at `/swagger-ui/`.
