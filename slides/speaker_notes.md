# Topic presentation speaker notes

Target: 18 minutes of speaking plus 2 minutes of buffer. The slides are in
English; these notes are in Spanish so the economic logic is easy to rehearse.

## Slide 1 · Title — 0:45

“Mi pregunta es cuándo el precio relativo de un crédito puede ser una señal
adelantada de una cartera más segura, y no necesariamente más riesgosa. Es Track
B porque estoy formalizando el mecanismo que mi tesis actualmente presenta de
forma reducida.”

Do not spend time on the thesis dataset yet. Point to the repository link.

## Slide 2 · Question and track — 1:20

Define `D` carefully: it is not the policy rate and not the raw lending rate.
It is the bank's deviation from peers inside the same segment, maturity,
currency, and month. The outcome is later delinquency. Say explicitly:

“The theoretical object is origination quality. Delinquency is its delayed,
noisy empirical realization.”

## Slide 3 · Why the sign is not obvious — 1:35

Explain the two channels without equations first.

- Selection: a high relative price drives away comparison shoppers and can
  worsen the pool.
- Screening: a high payoff when the loan performs makes screening more
  valuable and can improve the booked pool.

The project is about the sign of their difference, not about assuming one
always dominates.

## Slide 4 · Timing and primitives — 1:30

Walk through the timing. Stress that the applicant pool responds to the posted
price before the bank chooses screening. This sequencing makes `D` predetermined
inside the screening subgame and keeps the FOC clean.

## Slide 5 · Bank problem — 1:40

Read the objective by blocks: expected repayment, costs independent of
screening, and convex screening cost. Explain why the pricing stage is present
but not solved in closed form:

“A compact price set and continuous demand close existence. The candidate
proposition concerns the continuation quality map conditional on the price we
observe in the data.”

## Slide 6 · FOC — 1:40

Derive it aloud. The marginal benefit of effort is `g(kappa)(R_bar+D)` and the
marginal cost is `c(kappa)e`. The SOC is globally negative. After substitution,
name `h = g^2/c` screening leverage. Do not call `h` effort.

## Slide 7 · Proposition — 1:45

State the logic in three sentences:

1. `a` falls with opacity because fewer borrowers compare offers.
2. `h` rises with opacity under the stated information-value condition.
3. Endpoint crossing plus strict monotonicity gives one and only one threshold.

Mention that the proof uses the intermediate value theorem and is short enough
to formalize cleanly in Lean.

## Slide 8 · Key condition — 2:05

This is the most important slide. Say:

“Mi versión anterior decía que el signo se vuelve negativo porque evaluar es
costoso. Eso no es correcto por sí solo. Un mayor costo reduce `h`. Para que el
canal de screening gane, la ganancia marginal de información debe crecer más
rápido que el costo.”

Point to the graph only after explaining the condition. Present the graph as an
illustrative calibration, not evidence.

## Slide 9 · Empirical mapping — 1:20

Explain that `rho_h > 0` preserves the sign from origination quality to future
delinquency. Clarify that the empirical exercise is predictive and
out-of-sample. Avoid causal language.

## Slide 10 · Why new — 1:40

Do not claim that no one has ever studied price and screening. The narrow claim
is that the cited baselines do not derive this continuous decomposition and an
opacity threshold for the sign of a relative-price forecasting signal.

## Slide 11 · Plan — 1:15

Show that the project is executable: proof, parameter-region simulation,
forecast evaluation, then Lean after the theorem is frozen. Mention that the
current code already fails automatically if a maintained bound is violated.

## Slide 12 · Risk and fallback — 1:20

End with discipline, not defensiveness:

“The contribution is the condition that determines the sign. If the condition
does not hold, the correct result is no threshold, not a forced negative
coefficient.”

Pause on the final sentence and invite questions.

## Delivery checklist

- Say “relative spread,” not simply “interest rate.”
- Say “screening leverage” for `h` and “screening effort” for `e*`.
- Never say opacity automatically implies `h' > 0`.
- Never call the forecasting coefficient causal.
- Keep the illustrative calibration separate from the proposition.
