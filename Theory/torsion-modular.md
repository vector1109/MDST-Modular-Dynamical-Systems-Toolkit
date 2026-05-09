# Modular Torsion in MDST

## A Formalized Computational Degree of Freedom

**Formal Document — Extension of the Modular Dynamical Systems Toolkit (MDST)**

---

# 1. Motivation

Within the MDST framework, every element \(x \in \mathbb{Z}_n\) evolving under the iteration

\[
f_k(x) = x^k \bmod n
\]

is completely characterized by its CRT decomposition and by the evolution of each primary component.

We observe that some elements collapse toward idempotents (fixed points), while others remain trapped in persistent periodic orbits inside unit groups.

This orbital behavior is not a property of the nominal value itself, but of the structural evolution of the element under iteration.

We formalize this structural degree of freedom under the name:

> **Modular Torsion**

---

# 2. Fundamental Definitions

## 2.1 Base Dynamical System

Let

\[
n = \prod_{i=1}^{r} p_i^{\alpha_i}
\]

and let \(k \ge 1\).

Define:

\[
f_k : \mathbb{Z}_n \to \mathbb{Z}_n
\]

by

\[
f_k(x) = x^k \bmod n.
\]

By the Chinese Remainder Theorem,

\[
f_k \cong \left(f_k^{(1)}, \dots, f_k^{(r)}\right),
\]

where each component acts independently on

\[
\mathbb{Z}_{p_i^{\alpha_i}}.
\]

---

## 2.2 Orbit of an Element

The orbit of an element \(x\) is the sequence

\[
\mathcal{O}(x) =
\{x, f_k(x), f_k^2(x), \dots \}.
\]

Since \(\mathbb{Z}_n\) is finite, every orbit is eventually periodic.

---

## 2.3 Collapse and Torsional Elements

### Definition 2.3.1 — Collapse

An element \(x\) collapses if there exists some \(t \ge 0\) such that

\[
f_k^t(x)
\]

is idempotent:

\[
(f_k^t(x))^2 = f_k^t(x).
\]

In particular, the orbit eventually reaches a fixed point.

---

### Definition 2.3.2 — Nontrivial Torsion

An element \(x\) possesses nontrivial torsion if its orbit eventually enters a periodic cycle of length

\[
L \ge 2
\]

inside the unit group of at least one CRT component.

Such elements never collapse to a fixed idempotent.

---

# 3. Local Torsion in Primary Components

Consider

\[
R = \mathbb{Z}_{p^\alpha}.
\]

Let

\[
U = U(p^\alpha)
\]

be the unit group of order

\[
\varphi(p^\alpha).
\]

---

## 3.1 Discrete Exponent Dynamics

For odd primes \(p\), the unit group is cyclic.

Let \(g\) be a generator.

Every unit can be written as

\[
x = g^e,
\]

with

\[
e \in \mathbb{Z}_{\varphi(p^\alpha)}.
\]

Under iteration:

\[
f_k(x)
=
x^k
=
(g^e)^k
=
g^{ek \bmod \varphi(p^\alpha)}.
\]

Therefore, the dynamics in the unit group reduces to multiplication by \(k\) inside the exponent ring.

---

## 3.2 Definition of Local Torsion

### Definition 3.2.1 — Local Torsion

Let \(x \in U(p^\alpha)\) with

\[
x = g^e.
\]

The local torsion of \(x\) under \(f_k\) is

\[
\tau_{p^\alpha}(x),
\]

defined as the order of the exponent \(e\) under the transformation

\[
e \mapsto ek
\pmod{\varphi(p^\alpha)}.
\]

Equivalently, it is the smallest integer \(L \ge 1\) such that

\[
ek^L \equiv e
\pmod{\varphi(p^\alpha)}.
\]

This is exactly the period of the orbit of \(x\) inside the unit group.

---

### Special Cases

- If \(x = 0\) or \(x\) is a nonunit zero divisor:

\[
\tau_{p^\alpha}(x)=0.
\]

- If \(x\) converges to the identity element:

\[
\tau_{p^\alpha}(x)=1.
\]

---

### Definition 3.2.2 — Nontrivial Local Torsion

An element has nontrivial local torsion whenever

\[
\tau_{p^\alpha}(x)\ge2.
\]

---

## 3.3 Properties

### Theorem 3.3.1 — Dynamical Invariance

For all \(x\in R\),

\[
\tau_{p^\alpha}(f_k(x))
=
\tau_{p^\alpha}(x).
\]

Thus, torsion is a dynamical invariant.

---

### Theorem 3.3.2 — Local Classification

Every element of

\[
\mathbb{Z}_{p^\alpha}
\]

belongs to exactly one of the following classes:

| Class | Torsion | Description |
|---|---|---|
| Collapse to zero | \(0\) | Zero divisors and nilpotents |
| Trivial torsion | \(1\) | Units converging to \(1\) |
| Nontrivial torsion | \(L \ge 2\) | Persistent periodic cycles |

---

### Theorem 3.3.3 — Existence of Nontrivial Torsion

Nontrivial torsion exists if and only if

\[
\gcd(k,\varphi(p^\alpha)) \neq 1
\]

and there exists at least one exponent whose orbit does not collapse.

---

# 4. Global Modular Torsion

---

## 4.1 Torsion Vector

### Definition 4.1.1 — Torsion Vector

For

\[
x \in \mathbb{Z}_n
\]

with CRT decomposition

\[
(x_1,\dots,x_r),
\]

define the torsion vector as

\[
\vec{\tau}(x)
=
(
\tau_{p_1^{\alpha_1}}(x_1),
\dots,
\tau_{p_r^{\alpha_r}}(x_r)
).
\]

---

## 4.2 Global Torsion

### Definition 4.2.1 — Modular Torsion

The global modular torsion of \(x\) is

\[
\tau(x)
=
\max_i \tau_{p_i^{\alpha_i}}(x_i).
\]

Interpretation:

- \(\tau(x)=0\): collapse toward a zero component.
- \(\tau(x)=1\): convergence toward an idempotent.
- \(\tau(x)\ge2\): persistent nontrivial cyclic behavior.

---

## 4.3 Torsion Function

### Definition 4.3.1 — Torsion Map

Define

\[
\mathcal{T}_n :
\mathbb{Z}_n
\to
\mathbb{N}_0
\]

by

\[
\mathcal{T}_n(x)=\tau(x).
\]

---

### Theorem 4.3.1 — Invariance

\[
\mathcal{T}_n(f_k(x))
=
\mathcal{T}_n(x).
\]

---

### Theorem 4.3.2 — Relation with the Φ Classifier

- If \(\mathcal{T}_n(x)=0\), the corresponding Φ component is \(0\).
- If \(\mathcal{T}_n(x)=1\), the corresponding Φ component is \(1\).
- If \(\mathcal{T}_n(x)\ge2\), the orbit remains trapped in a persistent cycle inside the basin associated with the Φ signature.

Thus:

- Φ identifies the coarse attraction basin.
- Torsion determines the fine asymptotic structure within that basin.

---

# 5. Canonical Examples

---

## 5.1 Example: \(\mathbb{Z}_{60}\) under Squaring

Factorization:

\[
60 = 4 \times 3 \times 5.
\]

### Component \(\mathbb{Z}_4\)

\[
U(4)=\{1,3\}.
\]

Since

\[
3^2 \equiv 1 \pmod4,
\]

all units collapse to \(1\).

No nontrivial torsion exists.

---

### Component \(\mathbb{Z}_3\)

\[
U(3)=\{1,2\}.
\]

Again,

\[
2^2\equiv1\pmod3.
\]

No nontrivial torsion exists.

---

### Component \(\mathbb{Z}_5\)

\[
U(5)=\{1,2,3,4\}.
\]

Observe:

\[
2^2=4,
\quad
4^2=1.
\]

The orbit

\[
2 \to 4 \to 1
\]

contains a nontrivial transient torsional structure.

---

## 5.2 Example: \(\mathbb{Z}_{216}\)

Factorization:

\[
216 = 8 \times 27.
\]

The component

\[
\mathbb{Z}_{27}
\]

admits genuine periodic cycles under squaring.

As a consequence, persistent global torsion survives in the CRT product.

This produces genuine global cycles of lengths \(2\) and \(6\).

---

# 6. Torsion Spectrum

### Definition 6.1 — Torsion Spectrum

The torsion spectrum of the system is

\[
\Sigma_n(k)
=
\{
\tau(x)
\mid
x\in\mathbb{Z}_n
\}.
\]

---

### Theorem 6.1 — Structure of the Spectrum

The torsion spectrum is entirely determined by the periodic structures of the unit groups of the CRT components.

---

# 7. Torsion as a Computational Degree of Freedom

The MDST framework reveals that every element carries two independent informational layers:

| Layer | Meaning |
|---|---|
| Nominal value | Arithmetic identity |
| Dynamical signature | Torsion, depth, orbit structure |

This dynamical signature is structural rather than numerical.

---

## 7.1 Dynamical Memory

A cycle of length \(L\) stores information in its phase position.

This provides

\[
\log_2(L)
\]

bits of persistent dynamical state.

---

## 7.2 Cycle Coupling

CRT composition allows independent torsional components to synchronize and generate larger composite cycles.

If two components possess cycle lengths

\[
L_1
\quad\text{and}\quad
L_2,
\]

their combined system admits cycles of length

\[
\operatorname{lcm}(L_1,L_2).
\]

---

# 8. Relation to the Φ Classifier

The Φ classifier provides a coarse partition of the dynamical space into attraction basins.

Modular torsion refines this partition by describing the asymptotic internal behavior inside each basin.

Thus:

- Φ identifies the basin.
- Torsion identifies the orbital structure inside the basin.

---

# 9. Fundamental Theorem of Modular Torsion

### Theorem 9.1 — Complete Dynamical Classification

Every element

\[
x\in\mathbb{Z}_n
\]

is dynamically classified by the pair

\[
(\Phi(x),\vec{\tau}(x)).
\]

This pair:

- is invariant under iteration,
- determines the attraction basin,
- determines asymptotic orbital behavior,
- completely characterizes the fine dynamical structure of the element.

---

# 10. Conclusion

Modular torsion is formally defined as:

> The maximal periodic orbital structure of an element across the CRT components of a finite ring under exponentiation dynamics.

It constitutes:

- a structural computational invariant,
- independent from nominal arithmetic value,
- computable through CRT decomposition,
- parallelizable across components,
- and capable of encoding persistent dynamical information.

This extends the MDST framework from coarse idempotent classification toward a complete fine-grained dynamical theory over finite rings.

---

# Suggested Repository Placement

```text
Theory/torsion-modular.md

Possible future implementation modules:

src/core/torsion.py
src/core/torsion_spectrum.py
src/core/cycle_analysis.py