# MDST — Modular Dynamical Systems Toolkit

## A CRT-Based Computational Framework for Finite Ring Dynamics

---

## Abstract

We introduce **MDST (Modular Dynamical Systems Toolkit)**, a computational and theoretical framework for analyzing discrete dynamical systems defined over finite rings \( \mathbb{Z}_n \).

The system is based on a structural decomposition via the **Chinese Remainder Theorem (CRT)**, enabling a fully factorized representation of state space into independent modular components.

We define a class of dynamical maps of the form:

$$
f_k(x)=x^k \bmod n
$$

and introduce a canonical classification operator \( \Phi \), which assigns each state to its asymptotic idempotent attractor without requiring iterative simulation.

MDST replaces traditional stepwise iteration with a direct algebraic projection onto dynamical basins, revealing a hidden toroidal geometry underlying modular exponentiation.

The framework is deterministic, cache-local, and parallelizable.

We also present the **Yupana CRT model** (as a separate implementation project), which serves as a computational realization of this theory.

---

# 1. Introduction

Classical dynamical systems over finite sets are typically studied through iterative application of a function until convergence or cycle detection.

This approach is computationally expensive and obscures global structure.

MDST proposes a different perspective:

> The dynamics of \( f_k(x)=x^k \bmod n \) are not temporal sequences, but algebraic partitions of a finite phase space.

Using the CRT decomposition:

$$
\mathbb{Z}_n
\cong
\prod_{i=1}^{r}\mathbb{Z}_{p_i^{\alpha_i}}
$$

we obtain a fully factorized representation of the system where each component evolves independently.

---

# 2. Core Construction

## 2.1 State Space

$$
\mathcal{X}_n
=
\mathbb{Z}_n
\cong
\mathbb{Z}_{p_1^{\alpha_1}}
\times
\cdots
\times
\mathbb{Z}_{p_r^{\alpha_r}}
$$

Each state is represented as:

$$
x
\longleftrightarrow
(x_1,x_2,\dots,x_r)
$$

---

## 2.2 Dynamical Map

We define:

$$
f_k(x)=x^k \bmod n
$$

which decomposes into:

$$
f_k(x_1,\dots,x_r)
=
(x_1^k,\dots,x_r^k)
$$

All operations are local to each modulus component.

---

## 2.3 CRT Decoupling Principle

The system satisfies:

> Global dynamics = product of independent local dynamics.

There is no cross-component coupling.

---

# 3. The Φ Classification Operator

We define a non-iterative attractor classifier:

$$
\Phi:\mathbb{Z}_n \to E_n
$$

where \(E_n\) is the set of idempotent elements.

## Definition

$$
\Phi(x_1,\dots,x_r)
=
CRT(
\phi_1(x_1),
\dots,
\phi_r(x_r)
)
$$

with:

- \( \phi_i(x_i)=0 \) if \(x_i\) is divisible by \(p_i\)
- \( \phi_i(x_i)=1 \) otherwise

---

## Key Property

$$
\Phi(x)
=
\text{asymptotic attractor of }x\text{ under }f_k
$$

without iteration.

---

# 4. Geometric Interpretation

MDST induces a discrete geometry.

## 4.1 CRT Torus

$$
\mathbb{Z}_n
\cong
\prod
\mathbb{Z}_{p_i^{\alpha_i}}
$$

which induces a discrete toroidal topology.

---

## 4.2 Basin Structure

The state space is partitioned into:

$$
\Phi^{-1}(e)
$$

Each basin corresponds to a dynamical attractor.

---

## 4.3 Functional Graph

The system defines a directed graph:

- nodes: elements of \( \mathbb{Z}_n \)
- edges: \( x \to f_k(x) \)

This graph decomposes into:

- fixed points
- cycles
- transient trees

---

# 5. Computational Model

MDST replaces iterative computation with direct algebraic evaluation.

## 5.1 Table-Driven Evaluation

For each component:

$$
T_i[a]
=
a^k \bmod p_i^{\alpha_i}
$$

---

## 5.2 Complexity Reduction

| Method | Complexity |
|---|---|
| Iterative dynamics | \(O(t\cdot n)\) |
| MDST lookup | \(O(r)\) |

---

## 5.3 Parallel Structure

Each CRT component is independent:

- no carries
- no synchronization
- fully parallelizable

---

# 6. Experimental Case: \( \mathbb{Z}_{60} \)

Factorization:

$$
60=2^2\cdot3\cdot5
$$

CRT decomposition:

$$
\mathbb{Z}_{60}
\cong
\mathbb{Z}_4
\times
\mathbb{Z}_3
\times
\mathbb{Z}_5
$$

## Observations

- 8 attractor classes
- non-uniform basin sizes
- maximum dynamic depth \(D(60,2)=2\)
- direct attractor classification via \( \Phi \)

---

# 7. Visual Atlas

MDST admits four coupled geometric representations:

- Functional graph
- Φ field
- Basin atlas
- CRT toroidal projection

These layers are algebraically equivalent.

---

# 8. Relationship to Yupana CRT

MDST defines the theoretical framework.

The **Yupana CRT** repository provides:

- table-driven execution engines
- hardware-oriented modular computation
- spatial CRT visualization systems
- future torsion-aware architectures

> MDST = theory  
> Yupana CRT = computational realization

---

# 9. Properties

- deterministic
- finite-state complete
- fully decomposable
- cache-local
- parallelizable
- non-iterative classification

---

# 10. Future Work

- FPGA implementation of CRT toroidal execution
- extension to polynomial dynamics
- categorical formulation of \( \Phi \)
- spectral analysis of functional graphs
- torsion-aware modular computation
- embedding into discrete neural systems

---

# 11. Repository Structure

```text
MDST/
├── Core/
├── Z60/
├── Z216/
├── Observers/
├── Experiments/
├── Theory/
├── Specs/
├── docs/
│   └── atlas/
└── examples/
```

---

# 12. License

This project is released under a dual-license structure:

- academic and research usage: open license
- commercial and industrial usage: separate commercial licensing required

See LICENSE for details.

---

# 13. Conclusion

MDST reframes modular exponentiation dynamics not as iterative temporal processes, but as algebraic geometry over finite rings.

The central insight is:

> Dynamics over \( \mathbb{Z}_n \) are not time evolution, but space partitioning.

---

# Visual Atlas

## Functional Graph

![Functional Graph](docs/atlas/functional_graph_z60.png)

---

## Φ Field

![Phi Field](docs/atlas/phi_field_z60.png)

---

## Basin Atlas

![Basin Atlas](docs/atlas/basin_atlas_z60.png)

---

## CRT Toroidal Projection

![CRT Torus](docs/atlas/crt_torus_z60.png)