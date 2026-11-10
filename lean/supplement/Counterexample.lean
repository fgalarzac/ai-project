import Std

/- Supplementary exact arithmetic only. This is not an AppliedModelingLib
   paper run and does not prove Propositions 1--3 over the reals.
   Constants specialize the composition example: q=9/40, m0=1/10,
   beta=13/100, w=1/5, epsilon=3. No empirical data enter this file. -/
namespace RelativeCreditSupplement

def cohortRisk : Rat := 9 / 40
def legacyRisk : Rat := 1 / 10
def cohortSlope : Rat := 13 / 100
def weight : Rat := 1 / 5
def compositionExpression : Rat :=
  weight * (cohortSlope - 3 * (1 - weight) * (cohortRisk - legacyRisk))

theorem opposite_signs :
    And (0 < cohortSlope) (compositionExpression < 0) := by
  unfold compositionExpression weight cohortSlope
    cohortRisk legacyRisk
  decide +kernel

theorem composition_value : compositionExpression = -17 / 500 := by
  unfold compositionExpression weight cohortSlope cohortRisk legacyRisk
  decide +kernel

theorem probability_bounds :
    0 ≤ cohortRisk ∧ cohortRisk ≤ 1 ∧
    0 ≤ legacyRisk ∧ legacyRisk ≤ 1 ∧
    0 < weight ∧ weight < 1 := by
  unfold weight cohortRisk legacyRisk
  decide +kernel

#print axioms opposite_signs
#print axioms composition_value
#print axioms probability_bounds
end RelativeCreditSupplement
