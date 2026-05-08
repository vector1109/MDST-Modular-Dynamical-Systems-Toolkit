# MDST — Modular Dynamical Systems Toolkit

A computational and algebraic framework for analyzing exponent dynamics over finite rings using CRT decomposition, idempotent classification, and discrete dynamical systems.

---

## Features

- CRT-based decomposition
- O(1) attractor classification
- Basin partitioning
- Functional graph generation
- Cache-friendly local tables
- Parallelizable dynamics
- Toroidal discrete geometry

---

## Repository Structure

```text
Core/
Z60/
Z216/
Observers/
Experiments/
Data/
Theory/
Specs/
docs/
examples/

Licensing
Code

MPL-2.0

Theory and Documentation

CC BY 4.0

Related Projects

Yupana CRT is an experimental computational architecture derived from MDST principles.

(Repository link coming soon.)

Status

Foundational release.


Guardá el archivo.

---

# FASE 6 — Crear .gitignore

Abrí `.gitignore` y pegá:

```gitignore
# Python
__pycache__/
*.pyc

# VSCode
.vscode/

# Build
build/
dist/

# Logs
*.log

# Binary exports
*.bin
*.dat

# OS
.DS_Store
Thumbs.db