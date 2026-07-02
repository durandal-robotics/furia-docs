# SAPIENT C-UAS Integration

Furia integrates with SAPIENT (STANREC 4869) C-UAS sensors and effectors
via the `sapient-adapter` service. This enables detection ingest from
edge sensors and effector cueing for counter-drone operations.

## Quickstart

```bash
# Start the SAPIENT adapter
export CUAS_DIRECTOR_URL=http://127.0.0.1:3475
cargo run --release -p sapient-adapter &

# Ingest a detection
curl -X POST http://127.0.0.1:3395/api/v1/ingest/detection \
  -H 'Content-Type: application/json' \
  -d '{"detection_id":"uav-001","sensor_id":"RADAR-01",...}'
```

## Ports

| Service | Port | Protocol |
|---------|------|----------|
| sapient-adapter REST | 3395 | HTTP/JSON |
| C-UAS Director | 3475 | HTTP/REST |
| Zenoh (pub/sub) | — | Zenoh |

## Message Flow

```
SAPIENT Sensor → POST /ingest/detection → Zenoh publish → C-UAS Director
                                                              │
                                                     POST /cue → Effector
                                                              │
                                                     POST /fusion → COP
```

## See Also

- [ATAK Integration](atak.md)
- [STANAG 4586 Integration](stanag.md)
