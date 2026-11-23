import Galarza26RelativeCredit.Calculus

namespace Galarza26RelativeCredit
noncomputable section
open Set Filter Topology

theorem capacity_tie_left_derivative :
    HasDerivWithinAt (optimalRisk (1/2) 1 1 1 (1/4) (1/4)) 0 (Iic 0) 0 := by
  have heq : optimalRisk (1/2) 1 1 1 (1/4) (1/4) =ᶠ[𝓝[Iic 0] 0]
      (fun _ => (1/4 : ℝ)) := by
    filter_upwards [self_mem_nhdsWithin] with y hy
    have hy' : y ≤ 0 := hy
    have hm : (1/4 : ℝ) + y ≤ 1/4 := by linarith
    simp only [optimalRisk, priorRisk, premium, one_mul, div_one, min_eq_right hm]
    have hv : (1/2 : ℝ) + y - (1/4 + y) = 1/4 := by ring
    rw [hv, max_eq_right (by norm_num : (0 : ℝ) ≤ 1/4)]
  exact (hasDerivAt_const 0 (1/4 : ℝ)).hasDerivWithinAt.congr_of_eventuallyEq heq
    (by norm_num [optimalRisk, priorRisk, premium])

theorem capacity_tie_right_derivative :
    HasDerivWithinAt (optimalRisk (1/2) 1 1 1 (1/4) (1/4)) 1 (Ici 0) 0 := by
  have heq : optimalRisk (1/2) 1 1 1 (1/4) (1/4) =ᶠ[𝓝[Ici 0] 0]
      (fun y => (1/4 : ℝ) + y) := by
    filter_upwards [self_mem_nhdsWithin] with y hy
    have hy' : 0 ≤ y := hy
    have hm : (1/4 : ℝ) ≤ 1/4 + y := by linarith
    have hn : (0 : ℝ) ≤ 1/2 + y - 1/4 := by linarith
    simp only [optimalRisk, priorRisk, premium, one_mul, div_one, min_eq_left hm,
      max_eq_right hn]
    ring
  exact ((hasDerivAt_id 0).const_add (1/4 : ℝ)).hasDerivWithinAt.congr_of_eventuallyEq heq
    (by norm_num [optimalRisk, priorRisk, premium])

theorem capacity_tie_not_differentiable :
    ¬ DifferentiableAt ℝ (optimalRisk (1/2) 1 1 1 (1/4) (1/4)) 0 := by
  intro h
  have hdl := h.hasDerivAt.hasDerivWithinAt.derivWithin (uniqueDiffWithinAt_Iic 0)
  have hdr := h.hasDerivAt.hasDerivWithinAt.derivWithin (uniqueDiffWithinAt_Ici 0)
  have hl := capacity_tie_left_derivative.derivWithin (uniqueDiffWithinAt_Iic 0)
  have hr := capacity_tie_right_derivative.derivWithin (uniqueDiffWithinAt_Ici 0)
  linarith

theorem capacity_tie_valid_model :
    selectionAndDomain (1/2) 1 (-1/8) (1/8) ∧
    technologyCapacityCost 1 1 (1/4) ∧
    conditionedPayoff (1/4) (-1/8) (1/8) ∧
    (1 : ℝ) * premium (1/4) 0 / 1 = (1/4 : ℝ) ∧
    (1/4 : ℝ) < priorRisk (1/2) 1 0 / 1 := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, ?_⟩
    intro D hD
    change 0 ≤ 1/2 + 1*D ∧ 1/2 + 1*D ≤ 1
    constructor <;> linarith [hD.1, hD.2]
  · norm_num [technologyCapacityCost]
  · intro D hD
    unfold premium
    linarith [hD.1]
  · norm_num [premium]
  · norm_num [priorRisk]

end
end Galarza26RelativeCredit
