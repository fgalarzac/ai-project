# When Can a Higher Loan Spread Predict Lower Delinquency?

**Endogenous screening under borrower opacity**

**Fabián Matías Galarza Chumbe · Track B · AI and Economic Modeling, 2026-II**

This project builds the economic model behind my thesis on whether a bank's
loan rate, measured relative to peers in the same product, maturity, currency,
and month, predicts future delinquency in Peruvian commercial banking.

## Question

When does a higher relative loan spread predict a safer rather than a riskier
loan portfolio? The proposed answer separates two channels. A high spread can
attract a worse applicant pool, but it also raises the payoff from screening
and therefore the bank's screening effort. Borrower opacity changes the
relative strength of those channels.

## Model

Let \(D\) be the bank's loan spread relative to peers and
\(\kappa\in[0,1]\) borrower opacity. Before screening, the default share is

\[
q^0(D,\kappa)=\bar q+a(\kappa)D,
\]

where \(a(\kappa)>0\) is the adverse-selection response. Screening effort
\(e\in[0,\bar e]\) lowers default to
\(q=q^0-g(\kappa)e\) and costs \(c(\kappa)e^2/2\) per loan. After posting
\(D\), the bank solves

\[
\max_e\;[1-q^0(D,\kappa)+g(\kappa)e](\bar R+D)
       -F-\frac{c(\kappa)}2e^2.
\]

The first-order condition gives

\[
e^*(D,\kappa)=\frac{g(\kappa)}{c(\kappa)}(\bar R+D),\qquad
q^*(D,\kappa)=\bar q+a(\kappa)D-h(\kappa)(\bar R+D),
\]

where \(h(\kappa)=g(\kappa)^2/c(\kappa)\) is screening leverage. A preceding
pricing stage chooses \(D\) from a compact set, taking the continuation value
above and loan demand as given.

## Candidate result and all conditions

Assume an interior screening solution and feasible probabilities; \(a\) and
\(h\) are continuous; \(a'(\kappa)<0\); \(h'(\kappa)>0\), equivalently
\(2g'/g>c'/c\); and the endpoint ordering reverses:
\(a(0)>h(0)\) and \(a(1)<h(1)\). Then there is a unique opacity threshold
\(\kappa^*\) such that

\[
\frac{\partial q^*}{\partial D}=a(\kappa)-h(\kappa)
\begin{cases}
>0,&\kappa<\kappa^*,\\
=0,&\kappa=\kappa^*,\\
<0,&\kappa>\kappa^*.
\end{cases}
\]

The substantive restriction is \(h'>0\): higher screening cost alone cannot
produce the reversal. Opacity must raise the marginal information gain enough
to dominate its cost effect. This is a maintained, falsifiable condition rather
than a result hidden inside the definition of opacity.

## Status

| Component | State |
|---|---|
| Topic proposal and 20-minute slides | Complete and source-controlled |
| Symbolic and numerical verification | Complete for the candidate proposition |
| Speaker notes and defense questions | Complete |
| Final paper and final slides | Planned |
| Lean formalization | Planned after the proposition is frozen |
| Handwritten appendix | Planned after the proof is frozen |

Run `python code/verify.py` from the repository root. It checks the FOC, SOC,
comparative static, threshold, probability bounds, and writes the figure used
in the topic deck.
