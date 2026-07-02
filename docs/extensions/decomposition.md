# Decomposition Extensions

4 extensions available.

| Extension | Description | Dependencies | Security |
|-----------|-------------|-------------|----------|
| `durandal-compiler` | Intent-to-task compiler — parses commander intent into executable S1 task graphs | furia-sdk | 64MB, net:✗, fs:✗ |
| `durandal-mission-compiler` | Typed lowering from Furia MissionPlan to S1 TaskGraph | none | ?MB, net:✗, fs:✗ |
| `furia-builtin-basic-decomposition` | Basic mission decomposition into sub-missions using template patterns | none | ?MB, net:✗, fs:✗ |
| `furia-opord-frago` | AI-generated OPORD, FRAGO, WARNORD using local LLM — bridges to durandal-opord-frago-llm Python inference server | furia-sdk | 256MB, net:✓, fs:✗ |
