# Furia C2 Platform

**7 C2 templates** · **64 extensions** · **152 services** · **99 marketplace modules**

Furia provides **7 C2 templates** for different operational roles.
Each template bundles exactly the services you need — nothing more.

## Pick Your Template

| Template | Services | Best For |
|----------|----------|----------|
| **🏛 C2 Headquarters** | 7 | Brigade/Division HQ — full command post |
| **🔭 C2 Frontline** | 4 | Platoon/Company — tactical C2 |
| **🚛 C2 Edge** | 4 | AFV/IFV crew — lightweight vehicle C2 |
| **⚓ C2 Maritime** | 3 | Naval HQ — maritime domain awareness |
| **🚁 C2 Airborne** | 3 | Aviation — MUM-T, airspace mgmt |
| **🧠 C2 Intelligence** | 5 | J2 — intelligence fusion |
| **📨 C2 Messaging** | 1 | Any echelon — military messaging |

## Quickstart

```bash
# Start with 3 services, no Postgres needed
just setup
open http://localhost:3226/swagger-ui/
```

## Architecture

```
┌─────────────┐     ┌──────────────┐     ┌──────────────┐
│  Tauri UI   │────▶│  152 Services│────▶│   PostGIS    │
│  (SolidJS)  │     │  (7 templates)│    │  (Spatial)   │
└─────────────┘     └──────────────┘     └──────────────┘
                           │
                    ┌──────▼──────┐
                    │ 64 Extensions│
                    │  (WASM)      │
                    └─────────────┘
```
