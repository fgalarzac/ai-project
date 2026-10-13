# Likely questions and defensible answers

## “Why can a higher spread improve quality?”

Not mechanically. A higher performing-loan payoff raises the marginal benefit
of screening, so `e*` rises with `D`. Quality improves through that channel only
if the induced screening effect exceeds the adverse-selection effect.

## “Isn't `D` endogenous?”

Yes. The bank chooses it in stage one. The proposition is a conditional
quality map after a price has been posted, not a causal intervention on price.
Empirically, the project asks whether observed `D` improves forecasts after
bank and segment-by-month controls. A structural causal price effect would
require additional instruments or a fully specified oligopoly equilibrium.

## “Why should screening leverage rise with opacity if screening is costly?”

It need not. That is the key maintained condition. Since `h=g^2/c`, its
increase requires the marginal information gain to grow fast enough to
dominate the increase in cost. If that restriction fails, the model predicts
no sign reversal. This correction makes the model falsifiable.

## “Are you defining opacity so the result holds?”

No. Opacity is an ordinal empirical characteristic of borrower segments. The
theorem separately assumes and exposes how opacity maps into `a`, `g`, and `c`.
The endpoint crossing and `h'>0` are restrictions to be assessed, not part of
the definition of `kappa`.

## “What is new relative to Ruckes?”

Ruckes endogenizes screening and mixed loan pricing as prior borrower quality
changes over the business cycle. This project asks a different derivative:
the sign of portfolio quality with respect to a bank's relative price and how
that derivative changes across opacity segments. The shopper/captive sorting
channel is also absent from Ruckes.

## “What is new relative to Broecker?”

Broecker shows that rate undercutting can improve clientele under imperfect
tests. Here the bank chooses continuous screening effort, and the result is a
threshold between a price-sorting slope and an endogenous screening response.

## “Why not solve `D*` explicitly?”

The question is whether the observed relative price contains information about
future quality. A compact first-stage problem establishes existence, while the
screening subgame gives the testable conditional map. A particular demand
system could produce a closed-form `D*`, but it would add assumptions without
changing the threshold mechanism. It is a planned extension if the final paper
needs a full oligopoly equilibrium.

## “What if screening also reduces loan volume?”

The current formulation treats effort as underwriting intensity per booked
loan and summarizes its effect in conditional default. A richer model can make
acceptance volume depend on effort. The threshold result survives if the bank's
screening FOC still yields a price-induced quality improvement, but the exact
`h` changes. This is a robustness extension, not part of Proposition 1.

## “How will you measure opacity?”

The theory only requires a pre-specified ordering. Candidate proxies in the
thesis are segment characteristics related to information availability and
borrower comparability. The final empirical design should report results for
each proxy separately and avoid interpreting any one proxy as a structural
estimate of `kappa`.

## “What does Lean add to such a short proof?”

The proof is simple but assumption-sensitive. Lean forces the endpoint
crossing, continuity, and strict monotonicity to appear explicitly and prevents
the conclusion from being smuggled into the hypotheses. It is especially
useful here because “unique threshold” is false if any one of those ingredients
is omitted.
