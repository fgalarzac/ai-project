# Model notes for the topic defense

These notes record the complete derivation behind the shorter proposal and
slides. They are preparation material, not an additional claim.

## 1. Timing

1. A borrower segment with opacity `kappa` is given.
2. The bank posts the relative spread `D` and faces demand `L(D,kappa)`.
3. The price-sorted pool has default probability
   `q0(D,kappa) = q_bar + a(kappa) D`.
4. The bank observes the pool and chooses screening effort `e`.
5. Screening changes conditional default to
   `q(D,e,kappa) = q0(D,kappa) - g(kappa)e`.
6. Repayment and default are realized.

The compact set for `D` and continuity close the pricing stage. The topic
proposition is deliberately about the continuation map conditional on `D`.
Solving a specific demand system for `D*` is an extension, not a hidden step.

## 2. Screening problem

For a fixed `D`, profit per potential origination is

```text
pi(e;D,kappa)
  = [1 - q0(D,kappa) + g(kappa)e] [R_bar + D]
    - F - c(kappa)e^2/2.
```

The first-order condition is

```text
g(kappa)[R_bar + D] - c(kappa)e = 0.
```

Since the second derivative is `-c(kappa) < 0`, the interior solution is

```text
e*(D,kappa) = [g(kappa)/c(kappa)] [R_bar + D].
```

Substitution into portfolio quality gives

```text
q*(D,kappa)
  = q_bar + a(kappa)D
    - [g(kappa)^2/c(kappa)] [R_bar + D].
```

Define `h(kappa) = g(kappa)^2/c(kappa)`. Then

```text
dq*/dD = a(kappa) - h(kappa).
```

This is the paper's previously asserted `selection minus screening` slope, now
derived from a bank optimization problem.

## 3. Threshold proof

Let `f(kappa) = a(kappa)-h(kappa)`. Under continuity, endpoint crossing gives
at least one root by the intermediate value theorem. Since `a' < 0` and
`h' > 0`, `f' = a'-h' < 0`, so the root is unique. Strict monotonicity also
immediately gives the sign on each side.

The cross-partial is the same derivative:

```text
d^2 q*/(dD dkappa) = a'(kappa)-h'(kappa) < 0.
```

## 4. The condition that cannot be hidden

Because `h = g^2/c`, logarithmic differentiation gives

```text
h'/h = 2g'/g - c'/c.
```

Therefore `h' > 0` requires `2g'/g > c'/c`. If opacity only raises screening
cost `c`, the screening leverage falls and the proposed reversal becomes less
likely. The defensible interpretation is that opacity creates more latent
heterogeneity, so an extra unit of investigation has a larger marginal
information gain `g`; that gain must rise fast enough to dominate cost.

This condition is sufficient and testable. It should never be presented as an
automatic consequence of opacity.

## 5. General repayment function

With any differentiable increasing repayment `R(D)`, the solution becomes

```text
e* = g R(D)/c,
q* = q_bar + aD - h R(D),
dq*/dD = a - h R'(D).
```

The linear specification normalizes `R'(D)=1`. The general threshold compares
selection with `h(kappa)R'(D)` and may depend on `D` if `R'` is not constant.

## 6. What the model does not claim

- It does not identify a causal effect of raising a bank's price.
- It does not claim the empirical opacity proxy equals structural `kappa`.
- It does not prove that a threshold exists without the endpoint inequalities.
- It does not say costly screening is the negative channel.
- It does not yet solve an oligopoly pricing equilibrium. The compact first
  stage establishes existence while the contribution focuses on screening and
  the conditional price-quality signal.
