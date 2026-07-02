# ATAK / TAK Integration

Furia integrates with ATAK (Android Tactical Assault Kit) and TAK servers
via the interop-gateway. This enables bidirectional CoT (Cursor on Target)
data exchange — Furia sees ATAK tracks, ATAK sees Furia tracks.

## Architecture

```
ATAK-CIV ──┬── TAK Server ──┬── Furia interop-gateway (:3226)
            │                │
            │                ├── CoT ingest (POST /ingest/tak)
            │                ├── CoT emit (Zenoh/Kafka)
            │                └── Video CoT (b-i-v type)
            │
            └── ATAK-CIV ──┐
                           ├── Situational awareness
                           ├── Video streams (HLS/RTSP)
                           └── Chat messages
```

## Capabilities

| Feature | Direction | Format |
|---------|-----------|--------|
| Track positions | Bidirectional | CoT (a-f-G-U-C) |
| Video streams | Furia → ATAK | CoT b-i-v with HLS |
| Chat messages | Furia → ATAK | CoT chat (b-t-f) |
| Route plans | Bidirectional | CoT b-m-r |
| Data packages | Furia → ATAK | ZIP with manifests |
| Operator markers | Bidirectional | CoT markers |

## Quickstart

```bash
# Start Furia with ATAK support
export ATAK_SERVER_URL=tak://tak-server:8089
export ATAK_CA_PEM=/path/to/ca.pem
export ATAK_CLIENT_PEM=/path/to/client.pem
export ATAK_CLIENT_KEY=/path/to/client-key.pem

cargo run --release -p interop-gateway
```

## Configuration

| Environment Variable | Default | Purpose |
|---------------------|---------|---------|
| `ATAK_SERVER_URL` | — | TAK server connection URL |
| `ATAK_CA_PEM` | — | CA certificate for mTLS |
| `ATAK_CLIENT_PEM` | — | Client certificate for mTLS |
| `ATAK_CLIENT_KEY` | — | Client key for mTLS |
| `ATAK_VIDEO_BASE_URL` | — | Base URL for video stream access |

## CoT Message Types

| Type | Purpose | Example |
|------|---------|---------|
| `a-f-G-U-C` | Platform/unit position | UAV-03 at 48.85, 2.35 |
| `b-i-v` | Video stream | HLS stream with KLV metadata |
| `b-m-r` | Route | Planned route with waypoints |
| `b-t-f` | Chat message | C2 coordination chat |
| `u-d-f` | Geographic fence | Restricted airspace boundary |
| `t-x-m` | Mission package | Data package with imagery |

## Video CoT

Furia automatically generates b-i-v CoT messages for video streams.
When a STANAG 7023 motion imagery feed is started, a corresponding
CoT message is published with the HLS URL, KLV metadata, and
sensor parameters. ATAK clients discover these feeds and can
display the video with overlays.

## Security

- mTLS required for TAK server connection
- Least-privilege role mapping via `ATAK_PRIVILEGE_MAP`
- IHL enforcement on inbound ATAK commands
- All CoT messages logged to audit trail

## See Also

- [SAPIENT Integration](sapient.md)
- [STANAG 4586 Integration](stanag.md)
- [Military Messaging Template](../c2-types/c2-messaging.md)
