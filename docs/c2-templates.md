# C2 Templates (Public Starter Set)

The public split-repo starter currently exposes profile-driven templates through
`my-c2-host` using `FURIA_C2_PROFILE`.

## Available Starter Templates

| Template | Profile | Best For |
|----------|---------|----------|
| General C2 | `general` | Baseline host/UI integration and extension bring-up |
| Counter-UAS | `cuas` | C-UAS workflows and capability filtering |
| Drone Swarm | `drone-swarm` | Swarm-centric mission and control flows |
| ISR Focus | `isr` | ISR-heavy mission sets |

## Run a Template

```bash
cd ~/Work/my-c2-host
FURIA_C2_PROFILE=general cargo run
# or: cuas / drone-swarm / isr
```

In another terminal:

```bash
cd ~/Work/my-c2-ui
npm run dev
```

The selected profile is advertised by `/health` and `/api/c2/health`, and the UI
surfaces the active profile/capabilities from the host.

## Extending Beyond the Starter Set

Use `furia-core` crates and marketplace modules to build additional templates
for your domain (for example: MUM-T, maritime, fires, or full HQ workflows).

Recommended pattern:

1. Add required services/providers in `my-c2-host`
2. Add shell/routes/components in `my-c2-ui`
3. Publish/install supporting modules via `furia-market-server`
