# Versions and Compatibility

This page tracks the public split-repo delivery surface.

## Public Repositories

| Component | Repository |
|-----------|------------|
| Host runtime | https://github.com/durandal-robotics/my-c2-host |
| UI shell | https://github.com/durandal-robotics/my-c2-ui |
| Marketplace server | https://github.com/durandal-robotics/furia-market-server |
| Shared contracts/runtime crates | https://github.com/durandal-robotics/furia-core |
| Shared UI libraries/patterns | https://github.com/durandal-robotics/furia-ui |

## Compatibility Contract

- `my-c2-host` consumes profile and capability conventions from `furia-core`.
- `my-c2-ui` targets host APIs (`/api/c2/health`, `/api/c2/market/*`).
- `furia-market-server` provides module search/version/download/publish APIs for host and UI.

## CI/Release Status

Use each repository's Actions page for current build and release status:

- [`my-c2-host` workflows](https://github.com/durandal-robotics/my-c2-host/actions)
- [`my-c2-ui` workflows](https://github.com/durandal-robotics/my-c2-ui/actions)
- [`furia-market-server` workflows](https://github.com/durandal-robotics/furia-market-server/actions)
- [`furia-core` workflows](https://github.com/durandal-robotics/furia-core/actions)
- [`furia-ui` workflows](https://github.com/durandal-robotics/furia-ui/actions)
- [`furia-docs` workflows](https://github.com/durandal-robotics/furia-docs/actions)

> Note: numeric inventory counts (service totals, extension totals, seeded module totals)
> are intentionally not hardcoded here because they evolve continuously across repos.
