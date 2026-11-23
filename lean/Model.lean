import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.Analysis.Calculus.Deriv.Inv
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Topology.Order.IntermediateValue
import Mathlib.Tactic

/-!
Source model for the author-owned manuscript pinned at
https://github.com/fgalarzac/ai-project/blob/25f0b0c7df040e2b04d78064b30949492cd4472f/paper/paper.pdf.
The price and technology are fixed before effort is chosen. There is no price
equilibrium assertion. All formulas below are transparent model primitives;
no record assumes optimality, a derivative formula, or a threshold.
-/

namespace Galarza26RelativeCredit

noncomputable section

open Set

/-- The paper's simple, unweighted peer comparison.  The peer vector has
`n + 3` entries, so the empirical minimum of three other banks is built into
the carrier and the evaluated bank is supplied separately. -/
def relativePrice {n : ℕ} (ownRate baseRate : ℝ)
    (peerRates : Fin (n + 3) → ℝ) : ℝ :=
  (ownRate - baseRate) -
    (∑ k, (peerRates k - baseRate)) / (Fintype.card (Fin (n + 3)) : ℝ)

/-- Algebraic cancellation of the common base in the paper's equation (1). -/
theorem relativePrice_eq_rate_gap {n : ℕ} (ownRate baseRate : ℝ)
    (peerRates : Fin (n + 3) → ℝ) :
    relativePrice ownRate baseRate peerRates =
      ownRate - (∑ k, peerRates k) / (Fintype.card (Fin (n + 3)) : ℝ) := by
  have hcard : (Fintype.card (Fin (n + 3)) : ℝ) ≠ 0 := by
    simp only [Fintype.card_fin, ne_eq]
    positivity
  simp only [relativePrice, Finset.sum_sub_distrib, Finset.sum_const,
    Finset.card_univ, nsmul_eq_mul, Fintype.card_fin]
  field_simp
  ring

/-- Prior credit-event fraction; paper S1. -/
def priorRisk (qbar a D : ℝ) : ℝ := qbar + a * D

/-- Performance premium; paper S3. -/
def premium (Rbar D : ℝ) : ℝ := Rbar + D

/-- Post-screening credit-event fraction; paper S2. -/
def screenedRisk (qbar a g D e : ℝ) : ℝ := priorRisk qbar a D - g * e

/-- Quadratic screening cost per unit originated; paper S2. -/
def screeningCost (c e : ℝ) : ℝ := c * e ^ 2 / 2

/-- The feasible effort interval from S2. -/
def feasibleEfforts (qbar a g E D : ℝ) : Set ℝ :=
  Set.Icc 0 (min E (priorRisk qbar a D / g))

/-- Expected profit per unit originated, for fixed price and primitives; (2). -/
def bankProfit (qbar a g c Rbar F D e : ℝ) : ℝ :=
  (1 - priorRisk qbar a D + g * e) * premium Rbar D - F - screeningCost c e

/-- A one-shot conditioned decision problem with an explicit feasible set and
payoff.  Its data are fixed before effort is varied. -/
structure ContinuationProblem where
  feasible : Set ℝ
  payoff : ℝ → ℝ

/-- Feasible maximizer predicate for the conditioned problem. -/
def ContinuationProblem.IsMaximizer (problem : ContinuationProblem) (e : ℝ) : Prop :=
  e ∈ problem.feasible ∧ ∀ x ∈ problem.feasible, problem.payoff x ≤ problem.payoff e

/-- The paper's conditioned continuation problem, including both (2) and its
S2 feasibility constraint. -/
def conditionedContinuationProblem (qbar a g c Rbar F E D : ℝ) : ContinuationProblem where
  feasible := feasibleEfforts qbar a g E D
  payoff := fun e ↦ bankProfit qbar a g c Rbar F D e

/-- The closed-form effort candidate printed in P1. Optimality is proved separately. -/
def optimalEffort (qbar a g c Rbar E D : ℝ) : ℝ :=
  min (g * premium Rbar D / c) (min E (priorRisk qbar a D / g))

/-- The risk formula printed in P1. Its relation to optimized effort is proved. -/
def optimalRisk (qbar a g c Rbar E D : ℝ) : ℝ :=
  max 0 (priorRisk qbar a D - g * min E (g * premium Rbar D / c))

/-- Screening response strength, S4. -/
def screeningStrength (g c : ℝ) : ℝ := g ^ 2 / c

/-- Deterministic/continuous-population exposure weight from S5. -/
def cohortWeight (B0 : ℝ) (B : ℝ → ℝ) (D : ℝ) : ℝ := B D / (B0 + B D)

/-- Expected impaired balance from the source's two-cohort ledger under S5. -/
def impairedBalance (B0 m0 : ℝ) (B q : ℝ → ℝ) (D : ℝ) : ℝ :=
  B0 * m0 + B D * q D

/-- Expected portfolio ratio: divide the impaired balance by deterministic total balance. -/
def portfolioRatio (B0 m0 : ℝ) (B q : ℝ → ℝ) (D : ℝ) : ℝ :=
  impairedBalance B0 m0 B q D / (B0 + B D)

/-- Price-sensitive origination family in P3. -/
def exponentialBalance (B1 epsilon D : ℝ) : ℝ := B1 * Real.exp (-epsilon * D)

/-- Mathematical content of Assumption 1 on one compact price interval. -/
def selectionAndDomain (qbar a lower upper : ℝ) : Prop :=
  0 < qbar ∧ qbar < 1 ∧ 0 < a ∧ lower ≤ upper ∧
    ∀ D ∈ Icc lower upper, priorRisk qbar a D ∈ Icc (0 : ℝ) 1

/-- Mathematical content of Assumption 2.  Real-valued Lean parameters are
finite; positivity and the nonnegative capacity are the material restrictions. -/
def technologyCapacityCost (g c E : ℝ) : Prop :=
  0 < g ∧ 0 < c ∧ 0 ≤ E

/-- The positive performance premium in Assumption 3 on the admissible domain.
The objective and feasible set themselves are `bankProfit` and
`feasibleEfforts`; their explicit arguments keep price fixed during an effort
comparison. -/
def conditionedPayoff (Rbar lower upper : ℝ) : Prop :=
  ∀ D ∈ Icc lower upper, 0 < premium Rbar D

/-- The two strict interior inequalities used in the first line of (4). -/
def interiorRegime (qbar a g c Rbar E D : ℝ) : Prop :=
  g * premium Rbar D / c < E ∧
    g * premium Rbar D / c < priorRisk qbar a D / g

/-- The strict capacity regime used in the second line of (4). -/
def capacityRegime (qbar a g c Rbar E D : ℝ) : Prop :=
  E < g * premium Rbar D / c ∧ E < priorRisk qbar a D / g

/-- The strict probability-floor regime used in the third line of (4). -/
def floorRegime (qbar a g c Rbar E D : ℝ) : Prop :=
  priorRisk qbar a D / g < g * premium Rbar D / c ∧
    priorRisk qbar a D / g < E

/-- Local definitions `H` and `β` preceding Assumption 4. -/
def screeningAdvantage (a g c : ℝ) : ℝ := a - screeningStrength g c

/-- Mathematical content of Assumption 4, including the two strict
interiority conditions at the compared price for every opacity. -/
def crossingConditions (qbar Rbar E D0 : ℝ)
    (a g c : ℝ → ℝ) : Prop :=
  ContinuousOn a (Icc 0 1) ∧ ContinuousOn g (Icc 0 1) ∧
  ContinuousOn c (Icc 0 1) ∧
  (∀ k ∈ Icc (0 : ℝ) 1, 0 < a k ∧ 0 < g k ∧ 0 < c k) ∧
  StrictAntiOn (fun k ↦ screeningAdvantage (a k) (g k) (c k)) (Icc 0 1) ∧
  0 < screeningAdvantage (a 0) (g 0) (c 0) ∧
  screeningAdvantage (a 1) (g 1) (c 1) < 0 ∧
  (∀ k ∈ Icc (0 : ℝ) 1, interiorRegime qbar (a k) (g k) (c k) Rbar E D0)

/-- Quantitative part of Assumption 5.  The ledger declarations above encode
the deterministic/continuous-population accounting convention and the absence
of an additional risk-selection or write-off term. -/
def stockAccountingConditions (B0 m0 lower upper : ℝ) (B : ℝ → ℝ) : Prop :=
  0 < B0 ∧ m0 ∈ Icc (0 : ℝ) 1 ∧
    (∀ D ∈ Icc lower upper, 0 < B D ∧ DifferentiableAt ℝ B D)

end
end Galarza26RelativeCredit
