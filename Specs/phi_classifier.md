# Φ Classifier Specification

## Definition

For:

\[
n = \prod p_i^{\alpha_i}
\]

define:

\[
\Phi : \mathbb{Z}_n \to E_n
\]

where \(E_n\) is the set of idempotents.

## Local classifier

\[
\phi_i(x_i)=
\begin{cases}
0 & p_i \mid x_i \\
1 & \gcd(x_i,p_i)=1
\end{cases}
\]

## Global reconstruction

\[
\Phi(x)=CRT(\phi_1(x_1),\dots,\phi_r(x_r))
\]

## Properties

- Deterministic
- O(r)
- Non-iterative
- CRT-compatible
- Basin invariant