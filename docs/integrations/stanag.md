# STANAG 4586 Integration

Furia integrates with STANAG 4586 (NATO UA-C2 interface) via the
`stanag-4586-bridge` service. This enables command and control of
UAVs through standardized NATO messages.

## Quickstart

```bash
cargo run --release -p stanag-4586-bridge
```

## Supported Messages

| Type | Direction | Purpose |
|------|-----------|---------|
| C2V (C2 Vehicle) | Bidirectional | UA command and status |
| MSP (Mission Sensor Plan) | Outbound | Sensor tasking |
| ACK | Bidirectional | Message acknowledgment |

## Architecture

```
Ground Station ──┬── STANAG 4586 Bridge ──┬── UAV-1
                 │                         │
                 ├── dora-rs primary        ├── UAV-2
                 │                         │
                 └── DDS boundary          └── UAV-N
```

## See Also

- [ATAK Integration](atak.md)
- [SAPIENT Integration](sapient.md)
