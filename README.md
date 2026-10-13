# Relative Loan Pricing as an Early-Warning Signal of Non-Performing Loans

**Endogenous screening under borrower opacity**

**Fabián Matías Galarza Chumbe · Track B · AI and Economic Modeling, 2026-II**

This project adapts my thesis question into a small economic model that can be
solved, checked computationally, and later formalized in Lean. The empirical
motivation is practical: a bank supervisor observes lending rates before loan
portfolios mature and wants to know whether a bank's unusually high price
contains information about its future **non-performing loan ratio (NPL ratio)**.
The answer is not mechanically “higher price means more risk.” Price changes
both who applies and how valuable it is for the bank to screen applicants.

## 1. Research question and Track B contribution

**Question.** When does a higher loan spread relative to comparable banks
predict a higher future NPL ratio, and when can it predict a lower one?

This is a **Track B** project. The thesis already proposed two mechanisms—
borrower sorting and bank screening—but did not derive the screening response
from an agent's optimization problem. This version adds that missing bank
problem. Its main result is a transparent condition under which the predictive
sign reverses across borrower segments with different levels of opacity.

The claim is predictive, not causal. The model explains what an observed
relative price may signal about future portfolio quality; it does not claim
that forcing a bank to raise its rate would improve its portfolio.

## 2. What is observed in the data?

Index a bank by \(j\), a comparable credit segment by \(s\), and the month in
which the loan is priced by \(t\). Let

\[
s_{jst}=i_{jst}-r_t,
\qquad
D_{jst}=s_{jst}-\operatorname{median}_{k\neq j}\{s_{kst}\}.
\]

- \(i_{jst}\): lending rate charged by bank \(j\) in segment \(s\), month \(t\).
- \(r_t\): policy rate in month \(t\).
- \(s_{jst}\): the bank's spread over the policy rate.
- \(D_{jst}\): the spread relative to peer banks in the same segment and month.
- \(k\): a peer-bank index inside the median; it is not borrower opacity.

Thus \(D_{jst}=0.02\) means that the bank's spread is 2 percentage points above
the peer median when rates are written as decimals. Using a relative spread
removes movements common to the market and makes the signal comparable within
a narrowly defined product, maturity, currency, and month.

The later outcome is

\[
NPL_{js,t+h}
=\frac{\text{non-performing loan balance}_{js,t+h}}
       {\text{total outstanding loan balance}_{js,t+h}},
\]

where \(h\) is a forecast horizon. The exact classification of a loan as
non-performing will follow the data provider's definition.

## 3. Economic environment and every model object

The model suppresses the \(j,s,t\) subscripts to keep the algebra readable.
The following table gives the meaning of every object used below.

| Symbol | Meaning |
|---|---|
| \(D\in\mathcal D=[\underline D,\overline D]\) | Bank's relative spread; the first-stage price choice |
| \(\kappa\in[0,1]\) | Borrower-segment opacity; higher values mean harder-to-compare borrowers |
| \(L(D,\kappa)>0\) | Volume of potential loans, with \(L_D<0\) |
| \(\bar q\in(0,1)\) | Baseline default probability before price sorting or screening |
| \(a(\kappa)>0\) | Adverse-selection sensitivity of the applicant pool to \(D\) |
| \(q^0(D,\kappa)\) | Default probability of the applicant pool before screening |
| \(e\in[0,\bar e]\) | Screening effort chosen by the bank |
| \(g(\kappa)>0\) | Reduction in default probability produced by one unit of effort |
| \(c(\kappa)>0\) | Convex screening-cost shifter |
| \(q(D,e,\kappa)\) | Default probability after screening |
| \(R(D)=\bar R+D>0\) | Payoff received if a loan performs |
| \(F\) | Funding and operating cost independent of screening effort |
| \(h(\kappa)=g(\kappa)^2/c(\kappa)\) | Screening leverage: price-induced quality response |
| \(\beta(\kappa)\) | Slope \(\partial q^*/\partial D\) of optimized default risk with respect to price |
| \(\kappa^*\) | Opacity threshold at which \(\beta(\kappa^*)=0\) |

The timing is: (1) a segment with opacity \(\kappa\) is given; (2) the bank
posts \(D\); (3) price sorting determines the applicant pool; (4) the bank
chooses screening effort \(e\); and (5) repayment or default is realized.

## 4. The model, step by step

Before screening, the pool has default probability

\[
q^0(D,\kappa)=\bar q+a(\kappa)D.
\]

Because \(a(\kappa)>0\), a higher relative price worsens the unscreened pool.
This is the **selection channel**. Screening then changes default risk to

\[
q(D,e,\kappa)=q^0(D,\kappa)-g(\kappa)e
\]

and costs \(c(\kappa)e^2/2\) per potential loan. The bank solves

\[
\max_{D\in\mathcal D}L(D,\kappa)
\left\{\max_{e\in[0,\bar e]}
[1-q^0(D,\kappa)+g(\kappa)e](\bar R+D)
-F-\frac{c(\kappa)}2e^2\right\}.
\]

For a posted \(D\), the marginal benefit of screening is
\(g(\kappa)(\bar R+D)\), while its marginal cost is \(c(\kappa)e\). The
first- and second-order conditions are

\[
g(\kappa)(\bar R+D)-c(\kappa)e=0,
\qquad
\frac{\partial^2\pi}{\partial e^2}=-c(\kappa)<0.
\]

For an interior solution,

\[
e^*(D,\kappa)=\frac{g(\kappa)}{c(\kappa)}(\bar R+D).
\]

A higher price makes a performing loan more valuable, so it raises screening
effort. Substituting the optimal effort into the quality technology gives

\[
q^*(D,\kappa)=\bar q+a(\kappa)D
-\underbrace{\frac{g(\kappa)^2}{c(\kappa)}}_{h(\kappa)}(\bar R+D).
\]

Therefore,

\[
\boxed{\beta(\kappa)=\frac{\partial q^*}{\partial D}
=\underbrace{a(\kappa)}_{\text{worse selection}}
-\underbrace{h(\kappa)}_{\text{stronger screening}}.}
\]

This equation is the core of the project: price is a bad signal when selection
dominates and a good signal when the endogenous screening response dominates.

## 5. Candidate proposition and its assumptions

Assume: (i) the screening choice is interior and probabilities remain between
zero and one; (ii) \(a\) and \(h\) are continuous; (iii)
\(a'(\kappa)<0\); (iv) \(h'(\kappa)>0\); and (v)
\(a(0)>h(0)\) while \(a(1)<h(1)\). Then there is a unique
\(\kappa^*\in(0,1)\) such that

\[
\beta(\kappa)
\begin{cases}
>0,&\kappa<\kappa^*,\\
=0,&\kappa=\kappa^*,\\
<0,&\kappa>\kappa^*.
\end{cases}
\]

The crucial restriction is not “screening is costly.” Since

\[
\frac{h'(\kappa)}{h(\kappa)}
=2\frac{g'(\kappa)}{g(\kappa)}-\frac{c'(\kappa)}{c(\kappa)},
\]

screening leverage rises only when the marginal information gain grows fast
enough to dominate any growth in screening cost. Higher cost alone lowers
\(h\) and works against the reversal. This explicit restriction is what makes
the proposition falsifiable.

## 6. Connecting theory to the NPL ratio

The theoretical \(q^*_{jst}\) is a probability attached to new lending, while
\(NPL_{js,t+h}\) is a later stock ratio. They are connected by a forecasting
map, not treated as identical:

\[
NPL_{js,t+h}=\alpha_h+\rho_h q^*_{jst}+u_{js,t+h},
\qquad \rho_h>0.
\]

If this monotone link is valid, the sign of the predictive response to \(D\)
is the sign of \(\rho_h\beta(\kappa)\), hence the sign of \(\beta\). The
empirical exercise will test whether \(D\) improves out-of-sample forecasts
across opacity groups and horizons, with bank and segment-by-month controls.

## 7. Scope, status, and reproducibility

The model closes the screening decision and the existence of the pricing
stage, but it deliberately does not claim a closed-form oligopoly price
\(D^*\). That would require a particular competitive demand system and is not
necessary for the conditional forecasting mechanism studied here.

| Component | State |
|---|---|
| Four-page topic proposal | Complete |
| 25-minute topic deck, script, Q&A, and cheat sheet | Complete |
| Symbolic and numerical verification | Complete for the candidate proposition |
| Final-paper robustness results | Planned |
| Lean formalization | Planned after the proposition is frozen |
| Handwritten appendix | Planned after the proof is frozen |

Run `python code/verify.py` from the repository root. The script checks the
FOC, SOC, comparative static, threshold, effort bounds, and probability bounds;
it also recreates the illustrative figure used in the topic presentation.
