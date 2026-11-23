import Galarza26RelativeCredit.Model

/-! Auxiliary proof work, not a semantic judgment or paper endpoint.
The generic AML optimization Certificate API was inspected. Here the
source-specific quadratic comparison is exposed directly, so a paper-facing
wrapper can use either IsMaxOn or the library's maximizer certificate without
assuming its objective comparison or uniqueness.
-/

namespace Galarza26RelativeCredit
noncomputable section
open Set

theorem bankProfit_sub (qbar a g c Rbar F D x y : ℝ) :
    bankProfit qbar a g c Rbar F D x - bankProfit qbar a g c Rbar F D y =
      (x - y) * (g * premium Rbar D - c * (x + y) / 2) := by
  unfold bankProfit screeningCost
  ring

theorem optimalEffort_mem (qbar a g c Rbar E D : ℝ)
    (hg : 0 < g) (hc : 0 < c) (hR : 0 < premium Rbar D)
    (hE : 0 ≤ E) (hq : 0 ≤ priorRisk qbar a D) :
    optimalEffort qbar a g c Rbar E D ∈ feasibleEfforts qbar a g E D := by
  have hz : 0 ≤ g * premium Rbar D / c := (div_pos (mul_pos hg hR) hc).le
  have hu : 0 ≤ min E (priorRisk qbar a D / g) :=
    le_min hE (div_nonneg hq hg.le)
  exact ⟨le_min hz hu, min_le_right _ _⟩

theorem bankProfit_lt_optimalEffort (qbar a g c Rbar F E D e : ℝ)
    (hg : 0 < g) (hc : 0 < c) (hR : 0 < premium Rbar D)
    (_hE : 0 ≤ E) (_hq : 0 ≤ priorRisk qbar a D)
    (he : e ∈ feasibleEfforts qbar a g E D)
    (hne : e ≠ optimalEffort qbar a g c Rbar E D) :
    bankProfit qbar a g c Rbar F D e <
      bankProfit qbar a g c Rbar F D (optimalEffort qbar a g c Rbar E D) := by
  let z := g * premium Rbar D / c
  let u := min E (priorRisk qbar a D / g)
  have hzrel : c * z = g * premium Rbar D := by
    dsimp [z]
    field_simp
  change e ≠ min z u at hne
  change 0 ≤ e ∧ e ≤ u at he
  change bankProfit qbar a g c Rbar F D e <
    bankProfit qbar a g c Rbar F D (min z u)
  by_cases hzu : z ≤ u
  · rw [min_eq_left hzu] at hne ⊢
    have hsq : 0 < (e - z) ^ 2 := sq_pos_of_ne_zero (sub_ne_zero.mpr hne)
    have hid : bankProfit qbar a g c Rbar F D z - bankProfit qbar a g c Rbar F D e =
        c / 2 * (e - z) ^ 2 := by
      rw [bankProfit_sub, ← hzrel]
      ring
    have hpos : 0 < c / 2 * (e - z) ^ 2 := mul_pos (by positivity) hsq
    linarith
  · rw [min_eq_right (le_of_not_ge hzu)] at hne ⊢
    have heu : e < u := lt_of_le_of_ne he.2 hne
    have hcu : c * u < g * premium Rbar D := by
      have hmul := mul_lt_mul_of_pos_left (lt_of_not_ge hzu) hc
      linarith
    have hce : c * e ≤ c * u := mul_le_mul_of_nonneg_left he.2 hc.le
    have hfactor : 0 < g * premium Rbar D - c * (u + e) / 2 := by nlinarith
    have hdiff : 0 < bankProfit qbar a g c Rbar F D u - bankProfit qbar a g c Rbar F D e := by
      rw [bankProfit_sub]
      exact mul_pos (sub_pos.mpr heu) hfactor
    linarith

theorem bankProfit_le_optimalEffort (qbar a g c Rbar F E D e : ℝ)
    (hg : 0 < g) (hc : 0 < c) (hR : 0 < premium Rbar D)
    (hE : 0 ≤ E) (hq : 0 ≤ priorRisk qbar a D)
    (he : e ∈ feasibleEfforts qbar a g E D) :
    bankProfit qbar a g c Rbar F D e ≤
      bankProfit qbar a g c Rbar F D (optimalEffort qbar a g c Rbar E D) := by
  by_cases h : e = optimalEffort qbar a g c Rbar E D
  · subst e
    exact le_rfl
  · exact (bankProfit_lt_optimalEffort qbar a g c Rbar F E D e hg hc hR hE hq he h).le

theorem existsUnique_bankProfit_maximizer (qbar a g c Rbar F E D : ℝ)
    (hg : 0 < g) (hc : 0 < c) (hR : 0 < premium Rbar D)
    (hE : 0 ≤ E) (hq : 0 ≤ priorRisk qbar a D) :
    ∃! e : ℝ, e ∈ feasibleEfforts qbar a g E D ∧
      ∀ x ∈ feasibleEfforts qbar a g E D,
        bankProfit qbar a g c Rbar F D x ≤ bankProfit qbar a g c Rbar F D e := by
  refine ⟨optimalEffort qbar a g c Rbar E D, ?_, ?_⟩
  · exact ⟨optimalEffort_mem qbar a g c Rbar E D hg hc hR hE hq,
      fun x hx => bankProfit_le_optimalEffort qbar a g c Rbar F E D x hg hc hR hE hq hx⟩
  · intro e he
    by_contra hne
    have hlt := bankProfit_lt_optimalEffort qbar a g c Rbar F E D e hg hc hR hE hq he.1 hne
    have hle := he.2 (optimalEffort qbar a g c Rbar E D)
      (optimalEffort_mem qbar a g c Rbar E D hg hc hR hE hq)
    linarith

theorem screenedRisk_optimalEffort (qbar a g c Rbar E D : ℝ) (hg : 0 < g) :
    screenedRisk qbar a g D (optimalEffort qbar a g c Rbar E D) =
      optimalRisk qbar a g c Rbar E D := by
  let p := priorRisk qbar a D
  let z := g * premium Rbar D / c
  let m := min E z
  have hmin : min z (min E (p / g)) = min m (p / g) := by
    dsimp [m]
    rw [← min_assoc, min_comm z E]
  change p - g * min z (min E (p / g)) = max 0 (p - g * m)
  rw [hmin]
  by_cases hmp : m ≤ p / g
  · have hmg : m * g ≤ p := (le_div_iff₀ hg).mp hmp
    have hnonneg : 0 ≤ p - g * m := by nlinarith
    rw [min_eq_left hmp, max_eq_right hnonneg]
  · have hpm : p / g ≤ m := le_of_not_ge hmp
    have hmg : p ≤ m * g := (div_le_iff₀ hg).mp hpm
    have hnonpos : p - g * m ≤ 0 := by nlinarith
    rw [min_eq_right hpm, max_eq_left hnonpos]
    field_simp
    ring

theorem optimalRisk_bounds (qbar a g c Rbar E D : ℝ)
    (hg : 0 < g) (hc : 0 < c) (hR : 0 < premium Rbar D)
    (hE : 0 ≤ E) (hq : 0 ≤ priorRisk qbar a D)
    (hq1 : priorRisk qbar a D ≤ 1) :
    0 ≤ optimalRisk qbar a g c Rbar E D ∧
      optimalRisk qbar a g c Rbar E D ≤ priorRisk qbar a D ∧
      optimalRisk qbar a g c Rbar E D ≤ 1 := by
  have he := optimalEffort_mem qbar a g c Rbar E D hg hc hR hE hq
  have hnonneg : 0 ≤ optimalRisk qbar a g c Rbar E D := le_max_left _ _
  have hupper : optimalRisk qbar a g c Rbar E D ≤ priorRisk qbar a D := by
    rw [← screenedRisk_optimalEffort qbar a g c Rbar E D hg]
    unfold screenedRisk
    have hm := mul_nonneg hg.le he.1
    linarith
  exact ⟨hnonneg, hupper, hupper.trans hq1⟩

theorem optimalEffort_zero_capacity (qbar a g c Rbar D : ℝ)
    (hg : 0 < g) (hc : 0 < c) (hR : 0 < premium Rbar D)
    (hq : 0 ≤ priorRisk qbar a D) :
    optimalEffort qbar a g c Rbar 0 D = 0 := by
  unfold optimalEffort
  rw [min_eq_left (div_nonneg hq hg.le)]
  exact min_eq_right (div_nonneg (mul_nonneg hg.le hR.le) hc.le)

theorem optimalRisk_zero_capacity (qbar a g c Rbar D : ℝ)
    (hg : 0 < g) (hc : 0 < c) (hR : 0 < premium Rbar D)
    (hq : 0 ≤ priorRisk qbar a D) :
    optimalRisk qbar a g c Rbar 0 D = priorRisk qbar a D := by
  rw [← screenedRisk_optimalEffort qbar a g c Rbar 0 D hg,
    optimalEffort_zero_capacity qbar a g c Rbar D hg hc hR hq]
  simp [screenedRisk]

end
end Galarza26RelativeCredit
