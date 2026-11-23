import Galarza26RelativeCredit.Model

/-!
# Source-facing interface

The three transparent propositions below are the complete mathematical targets
of Propositions 1--3 in the pinned manuscript. Model definitions and the five
named assumptions live in `Model.lean` and are reviewed as semantic
prerequisites, not as reflexive theorem rows.
-/

namespace Galarza26RelativeCredit
noncomputable section

open Set

/-- Proposition 1: unique constrained optimizer, both closed forms, all three
strict-regime derivatives, zero capacity, continuity at ties, and actual left
and right derivatives at every tie. -/
def proposition1Spec : Prop :=
  (∀ qbar a g c Rbar F E lower upper : ℝ,
      selectionAndDomain qbar a lower upper →
      technologyCapacityCost g c E →
      conditionedPayoff Rbar lower upper →
      (∀ D ∈ Icc lower upper,
        ((∃! e : ℝ,
            (conditionedContinuationProblem qbar a g c Rbar F E D).IsMaximizer e) ∧
          (conditionedContinuationProblem qbar a g c Rbar F E D).IsMaximizer
            (optimalEffort qbar a g c Rbar E D)) ∧
        screenedRisk qbar a g D (optimalEffort qbar a g c Rbar E D) =
          optimalRisk qbar a g c Rbar E D ∧
        0 ≤ optimalRisk qbar a g c Rbar E D ∧
        optimalRisk qbar a g c Rbar E D ≤ 1) ∧
      (∀ D ∈ Ioo lower upper,
        interiorRegime qbar a g c Rbar E D →
        HasDerivAt (optimalRisk qbar a g c Rbar E) (a - g ^ 2 / c) D) ∧
      (∀ D ∈ Ioo lower upper,
        capacityRegime qbar a g c Rbar E D →
        HasDerivAt (optimalRisk qbar a g c Rbar E) a D) ∧
      (∀ D ∈ Ioo lower upper,
        floorRegime qbar a g c Rbar E D →
        HasDerivAt (optimalRisk qbar a g c Rbar E) 0 D) ∧
      (E = 0 →
        (∀ D ∈ Icc lower upper,
          optimalEffort qbar a g c Rbar E D = 0 ∧
          optimalRisk qbar a g c Rbar E D = priorRisk qbar a D) ∧
        (∀ D ∈ Ioo lower upper,
          HasDerivAt (optimalRisk qbar a g c Rbar E) a D)) ∧
      ContinuousOn (optimalEffort qbar a g c Rbar E) (Icc lower upper) ∧
      ContinuousOn (optimalRisk qbar a g c Rbar E) (Icc lower upper) ∧
      (∀ D ∈ Icc lower upper, ∃ left right : ℝ,
        HasDerivWithinAt (optimalRisk qbar a g c Rbar E) left (Iic D) D ∧
        HasDerivWithinAt (optimalRisk qbar a g c Rbar E) right (Ici D) D)) ∧
  (∃ qbar' a' g' c' Rbar' E' lower' upper' D' : ℝ,
    selectionAndDomain qbar' a' lower' upper' ∧
    technologyCapacityCost g' c' E' ∧
    conditionedPayoff Rbar' lower' upper' ∧
    D' ∈ Ioo lower' upper' ∧
    g' * premium Rbar' D' / c' = E' ∧
    E' < priorRisk qbar' a' D' / g' ∧
    ¬ DifferentiableAt ℝ (optimalRisk qbar' a' g' c' Rbar' E') D')

/-- Proposition 2: the zero of the derived interior price slope is obtained
from continuity and strict decrease, is unique and interior, and separates
positive from negative price derivatives. -/
def proposition2Spec : Prop :=
  ∀ qbar Rbar F E lower upper D0 : ℝ, ∀ a g c : ℝ → ℝ,
    D0 ∈ Icc lower upper →
    (∀ k ∈ Icc (0 : ℝ) 1,
      selectionAndDomain qbar (a k) lower upper ∧
      technologyCapacityCost (g k) (c k) E ∧
      conditionedPayoff Rbar lower upper) →
    crossingConditions qbar Rbar E D0 a g c →
    ∃ k : ℝ,
      k ∈ Ioo (0 : ℝ) 1 ∧
      HasDerivAt (optimalRisk qbar (a k) (g k) (c k) Rbar E) 0 D0 ∧
      (∀ y ∈ Ioo (0 : ℝ) 1,
        HasDerivAt (optimalRisk qbar (a y) (g y) (c y) Rbar E) 0 D0 → y = k) ∧
      (∀ x ∈ Icc (0 : ℝ) 1, x < k →
        0 < screeningAdvantage (a x) (g x) (c x) ∧
        HasDerivAt (optimalRisk qbar (a x) (g x) (c x) Rbar E)
          (screeningAdvantage (a x) (g x) (c x)) D0) ∧
      (∀ x ∈ Icc (0 : ℝ) 1, k < x →
        screeningAdvantage (a x) (g x) (c x) < 0 ∧
        HasDerivAt (optimalRisk qbar (a x) (g x) (c x) Rbar E)
          (screeningAdvantage (a x) (g x) (c x)) D0)

/-- Proposition 3: exact two-cohort ledger, general derivative and both sign
rules, followed by the exponential-balance derivative and exact reversal
condition. -/
def proposition3Spec : Prop :=
  ∀ qbar a g c Rbar F E lower upper B0 m0 : ℝ, ∀ B : ℝ → ℝ,
    selectionAndDomain qbar a lower upper →
    technologyCapacityCost g c E →
    conditionedPayoff Rbar lower upper →
    stockAccountingConditions B0 m0 lower upper B →
    (∀ D ∈ Icc lower upper,
      portfolioRatio B0 m0 B (optimalRisk qbar a g c Rbar E) D =
        (1 - cohortWeight B0 B D) * m0 +
          cohortWeight B0 B D * optimalRisk qbar a g c Rbar E D) ∧
    (∀ D ∈ Icc lower upper, ∀ beta Bprime : ℝ,
      HasDerivAt (optimalRisk qbar a g c Rbar E) beta D →
      HasDerivAt B Bprime D →
      let w := cohortWeight B0 B D
      let wprime := Bprime * B0 / (B0 + B D) ^ 2
      let slope := w * beta + wprime * (optimalRisk qbar a g c Rbar E D - m0)
      HasDerivAt (portfolioRatio B0 m0 B (optimalRisk qbar a g c Rbar E)) slope D ∧
      ((∃ b : ℝ, B = fun _ ↦ b) →
        (0 < slope ↔ 0 < beta) ∧ (slope = 0 ↔ beta = 0) ∧
          (slope < 0 ↔ beta < 0)) ∧
      (beta ≠ 0 →
        |wprime * (optimalRisk qbar a g c Rbar E D - m0)| < w * |beta| →
        0 < slope * beta)) ∧
    (∀ D ∈ Icc lower upper, ∀ beta B1 epsilon : ℝ,
      HasDerivAt (optimalRisk qbar a g c Rbar E) beta D →
      B = exponentialBalance B1 epsilon →
      0 < B1 → 0 ≤ epsilon →
      let exponentialB := exponentialBalance B1 epsilon
      let w := cohortWeight B0 exponentialB D
      let slope := w *
        (beta - epsilon * (1 - w) * (optimalRisk qbar a g c Rbar E D - m0))
      HasDerivAt
        (portfolioRatio B0 m0 B (optimalRisk qbar a g c Rbar E)) slope D ∧
      (0 < beta → m0 < optimalRisk qbar a g c Rbar E D →
        (slope < 0 ↔
          beta < epsilon * (1 - w) * (optimalRisk qbar a g c Rbar E D - m0))))

end
end Galarza26RelativeCredit
