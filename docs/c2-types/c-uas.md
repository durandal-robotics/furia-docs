# Counter-UAS (C-UAS) Profile

Public starter C-UAS is exposed through:

```bash
cd ~/Work/my-c2-host
FURIA_C2_PROFILE=cuas cargo run
```

In another terminal:

```bash
cd ~/Work/my-c2-ui
npm run dev
```

## What to Verify

- `GET http://127.0.0.1:3226/health` returns `c2_profile: "cuas"`
- `GET http://127.0.0.1:3226/api/c2/health` includes C-UAS capabilities
- UI shows the active profile/capability pills from host health

## Extending C-UAS

For full C-UAS stacks (director, SAPIENT ingest, airspace services), add
mission services/providers in `my-c2-host` and corresponding UX in `my-c2-ui`.
