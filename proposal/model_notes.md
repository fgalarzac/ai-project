# Detailed model notes for the topic defense

These notes record the full logic behind the shorter proposal and slides. They
are written for a reader who has not seen the thesis.

## 1. Objects in the data

For bank `j`, credit segment `s`, and month `t`:

```text
s_jst = i_jst - r_t
D_jst = s_jst - median_{k != j}{s_kst}
```

- `i_jst`: lending rate charged by bank `j`.
- `r_t`: policy rate.
- `s_jst`: spread over the policy rate.
- `D_jst`: deviation from the peer-bank median spread.
- `k`: index for other banks inside the median.

`D_jst = 0.02` means 2 percentage points above the peer median if rates are
expressed as decimals. The forecast target at horizon `h` is
`NPL_{js,t+h}`, the non-performing loan balance divided by the total
outstanding loan balance in that portfolio cell. The exact non-performing
classification follows the data dictionary.

## 2. Full notation

| Symbol | Definition and role |
|---|---|
| `D` | Relative spread after suppressing `j,s,t`; stage-one choice |
| `mathcal D` | Compact feasible interval `[D_lower,D_upper]` |
| `kappa` | Segment opacity in `[0,1]`; not the peer-bank index `k` |
| `L(D,kappa)` | Potential loan volume; assumed positive and decreasing in `D` |
| `q_bar` | Baseline probability of default before sorting and screening |
| `a(kappa)` | Change in pre-screen risk caused by one more unit of `D` |
| `q0(D,kappa)` | Default probability in the pool before screening |
| `e` | Screening effort chosen after the price-sorted pool is observed |
| `e_bar` | Maximum feasible screening effort |
| `g(kappa)` | Default-risk reduction produced by one unit of effort |
| `c(kappa)` | Convex effort-cost shifter |
| `q(D,e,kappa)` | Default probability after screening |
| `R_bar + D` | Payoff if a loan performs |
| `F` | Funding and operating cost independent of effort |
| `h(kappa)=g(kappa)^2/c(kappa)` | Screening leverage |
| `beta(kappa)` | Conditional price-risk slope `dq*/dD` |
| `kappa_star` | Opacity at which selection and screening leverage are equal |
| `rho_h` | Positive mapping from origination risk to the later NPL ratio |

## 3. Timing and why it matters

1. A borrower segment with opacity `kappa` is given.
2. The bank posts relative spread `D` and faces `L(D,kappa)` potential loans.
3. Price sorting produces an applicant pool with risk `q0(D,kappa)`.
4. The bank observes that pool and chooses screening effort `e`.
5. Screening changes booked quality; later repayment or default is realized.
6. At horizon `h`, the portfolio-level NPL ratio is measured.

The compact set for `D` and continuity close the pricing stage. The proposition
is deliberately about the continuation quality map conditional on an observed
`D`. Solving a particular oligopoly for `D*` is an extension, not a hidden
step. This distinction also prevents a forecasting result from being described
as a causal price intervention.

## 4. Applicant-pool sorting

Before screening,

```text
q0(D,kappa) = q_bar + a(kappa)D,  a(kappa) > 0.
```

For fixed opacity, a higher relative price raises the default probability of
the unscreened pool. Economically, the bank loses more price-sensitive
comparison shoppers and retains a worse mix. The function `a(kappa)` measures
the strength of that sorting response. The proposition assumes `a' < 0`:
when segments are more opaque and borrowers compare offers less effectively,
pool composition responds less strongly to a relative-price difference.

## 5. Screening technology and bank problem

Effort reduces default probability linearly:

```text
q(D,e,kappa) = q0(D,kappa) - g(kappa)e.
```

The restriction `g > 0` says more investigation improves booked quality. The
cost `c(kappa)e^2/2` is convex. For any posted `D`, profit per potential loan is

```text
pi(e;D,kappa)
  = [1 - q0(D,kappa) + g(kappa)e] [R_bar + D]
    - F - c(kappa)e^2/2.
```

Multiplying this continuation value by `L(D,kappa)` gives the full nested
problem. Demand matters for the stage-one price choice, but it is constant with
respect to `e` inside the screening subgame.

## 6. Solving the screening subgame

Differentiate profit with respect to effort:

```text
d pi/de = g(kappa)[R_bar + D] - c(kappa)e.
```

The first term is the marginal benefit: effort reduces default by `g` and each
avoided default preserves the performing-loan payoff `R_bar + D`. The second
term is marginal effort cost. The second derivative is

```text
d^2 pi/de^2 = -c(kappa) < 0,
```

so the unique interior optimum is

```text
e*(D,kappa) = [g(kappa)/c(kappa)] [R_bar + D].
```

The comparative static is `de*/dD = g/c > 0`: a higher performing-loan payoff
makes screening more valuable.

## 7. Optimized risk and the two-channel decomposition

Substitute `e*` into the risk technology:

```text
q*(D,kappa)
  = q_bar + a(kappa)D
    - [g(kappa)^2/c(kappa)] [R_bar + D].
```

Define `h(kappa) = g(kappa)^2/c(kappa)`. Then

```text
beta(kappa) = dq*/dD = a(kappa) - h(kappa).
```

`a` is the deterioration in the pool caused by price sorting. `h` is the
quality improvement caused by the optimal increase in screening. `h` is not
screening effort; it is the strength with which a higher price changes quality
through the optimized screening decision.

## 8. Threshold proposition and proof

Let `f(kappa)=a(kappa)-h(kappa)`. Assume:

1. `e*` is interior and `q*` lies in `(0,1)` on the admissible domain.
2. `a` and `h` are continuous.
3. `a'(kappa) < 0`.
4. `h'(kappa) > 0`.
5. `a(0) > h(0)` and `a(1) < h(1)`.

By continuity and endpoint crossing, the intermediate value theorem gives at
least one root `kappa_star` of `f`. Since

```text
f'(kappa) = a'(kappa) - h'(kappa) < 0,
```

`f` is strictly decreasing, so the root is unique. The sign of `f` is positive
below the root and negative above it. The cross-partial is

```text
d^2 q*/(dD dkappa) = a'(kappa)-h'(kappa) < 0.
```

## 9. The substantive condition that must remain visible

Because `h=g^2/c`, logarithmic differentiation gives

```text
h'/h = 2g'/g - c'/c.
```

Therefore `h'>0` requires `2g'/g > c'/c`. If opacity only raises screening
cost, screening leverage falls and the sign reversal becomes less likely. The
economic hypothesis is narrower: opacity creates enough latent heterogeneity
that an extra unit of investigation becomes more informative, and this rise in
information value dominates the rise in cost.

This is a maintained, falsifiable sufficient condition. It is not automatic
and is not part of the definition of opacity.

## 10. Mapping origination risk to the NPL ratio

The theory and the measured outcome are deliberately different:

- `q*_{jst}` is the default probability attached to new credit at origination.
- `NPL_{js,t+h}` is a later stock ratio for the whole portfolio cell.

The forecasting bridge is

```text
NPL_{js,t+h} = alpha_h + rho_h q*_{jst} + u_{js,t+h},  rho_h > 0.
```

Under this monotone link, the sign of the predictive response to `D` is the
sign of `rho_h beta(kappa)`, and therefore the sign of `beta`. This bridge must
be tested; it is not an identity or a causal structural equation.

## 11. Boundary solutions and robustness

If the unconstrained effort lies outside `[0,e_bar]`, the actual solution is

```text
e_c(D,kappa) = min{e_bar, max{0, g(kappa)[R_bar+D]/c(kappa)}}.
```

The derivative changes at the corners, so Proposition 1 is stated for the
interior region. The simulation checks this restriction over an explicit
parameter grid.

With a differentiable increasing payoff `R(D)`, the solution becomes

```text
e* = g R(D)/c
q* = q_bar + aD - h R(D)
dq*/dD = a - h R'(D).
```

The linear specification normalizes `R'(D)=1`. With nonlinear repayment, the
threshold compares selection with `h(kappa)R'(D)` and can depend on `D`.

## 12. What the model does not claim

- It does not identify a causal effect of raising a bank's price.
- It does not equate the origination probability `q*` with the stock NPL ratio.
- It does not claim the empirical opacity proxy equals structural `kappa`.
- It does not prove a threshold without continuity, monotonicity, and endpoint
  crossing.
- It does not say costly screening creates the negative channel.
- It establishes existence, but not a closed-form oligopoly price `D*`.
