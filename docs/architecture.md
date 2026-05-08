# MDST Architecture

## High-level structure

```text
Finite Ring Z_n
        │
        ▼
CRT Decomposition
        │
        ▼
Local Components Z_(p^α)
        │
        ├── Local tables
        ├── Local dynamics
        ├── Local attractors
        │
        ▼
Global recombination
        │
        ▼
Functional graph G_(n,k)
        │
        ▼
Φ classification
        │
        ▼
Basins / attractors

Core ideas
Decompose globally.
Compute locally.
Recombine structurally.
Classify without iteration.

---

# PASO 4 — Crear especificación Φ

Ejecutá:

```powershell id="p7r1gh"
ni Specs\phi_classifier.md