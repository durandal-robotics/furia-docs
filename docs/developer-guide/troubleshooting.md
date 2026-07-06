# Troubleshooting Guide

## Postgres Won't Connect

```bash
# Check if Postgres is running
pg_isready -U furia -h localhost

# Start Postgres via Docker
docker run -d --name furia-pg -p 5432:5432 \
  -e POSTGRES_DB=furia-c4isr -e POSTGRES_USER=furia \
  -e POSTGRES_PASSWORD=furia postgis/postgis:16-3.4

# Verify PostGIS extension
psql -U furia -d furia-c4isr -c "SELECT PostGIS_Version()"

# Run in-memory mode (no persistence)
export FURIA_STORAGE_DRIVER=memory
```

## `cargo build` Fails

```bash
# Check furia-core exists at ../furia-core
ls ../furia-core/crates/furia-sdk/src/lib.rs

# If missing:
git clone https://github.com/durandal-robotics/furia-core.git ../furia-core
```

## Swagger UI Shows 404

```bash
# Verify the gateway is running
curl http://localhost:3226/health

# Check the port
lsof -i :3226

# If not running, start it:
target/release/my-c2-host
```

## Extension Installation Fails

```bash
# Check marketplace is running
curl http://localhost:3030/api/v1/search?q=*

# Verify the extension exists
furia-market search my-extension

# Check SDK version compatibility
curl http://localhost:3030/api/v1/modules/compatibility
```

## Desktop App Shows Empty Window

```bash
# Check console output (app logs to stdout)
# The backend services need Postgres:
docker ps | grep postgis

# Or set in-memory mode:
export FURIA_STORAGE_DRIVER=memory

# Relaunch the UI:
cd ~/Work/my-c2-ui
npm run dev
```

## WASM Module Not Loading

```bash
# Check the module is compiled for WASM
file target/wasm32-wasip2/release/my_module.wasm

# Verify the module exports the required ABI
wasm-tools dump target/wasm32-wasip2/release/my_module.wasm | grep provider_call

# Check host market proxy for module details
curl http://localhost:3226/api/c2/market/modules/my-module/latest
```

## Support

- [my-c2-host Issues](https://github.com/durandal-robotics/my-c2-host/issues)
- [my-c2-ui Issues](https://github.com/durandal-robotics/my-c2-ui/issues)
- [furia-market-server Issues](https://github.com/durandal-robotics/furia-market-server/issues)
- [Documentation](https://durandal-robotics.github.io/furia-docs/)
