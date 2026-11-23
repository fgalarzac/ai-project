import Galarza26RelativeCredit.PaperInterface
import Galarza26RelativeCredit.MainTheorems

/-! Exact-type proof endpoints for the three transparent paper Specs. -/

namespace Galarza26RelativeCredit
noncomputable section

open Set

theorem proposition1 : proposition1Spec := by
  unfold proposition1Spec
  constructor
  · intro qbar a g c Rbar F E lower upper hselection htechnology hpayoff
    rcases hselection with ⟨hqbar0, hqbar1, ha, hlower, hq⟩
    rcases htechnology with ⟨hg, hc, hE⟩
    refine ⟨?_, ?_, ?_, ?_, ?_, (continuous_optimalEffort _ _ _ _ _ _).continuousOn,
      (continuous_optimalRisk _ _ _ _ _ _).continuousOn, ?_⟩
    · intro D hD
      have hqD := hq D hD
      have hRD := hpayoff D hD
      have hmem := optimalEffort_mem qbar a g c Rbar E D hg hc hRD hE hqD.1
      have hmax := fun x hx ↦ bankProfit_le_optimalEffort
        qbar a g c Rbar F E D x hg hc hRD hE hqD.1 hx
      have hunique := existsUnique_bankProfit_maximizer qbar a g c Rbar F E D
        hg hc hRD hE hqD.1
      have hrisk := screenedRisk_optimalEffort qbar a g c Rbar E D hg
      have hbounds := optimalRisk_bounds qbar a g c Rbar E D
        hg hc hRD hE hqD.1 hqD.2
      change (((∃! e : ℝ, e ∈ feasibleEfforts qbar a g E D ∧
          ∀ x ∈ feasibleEfforts qbar a g E D,
            bankProfit qbar a g c Rbar F D x ≤ bankProfit qbar a g c Rbar F D e) ∧
        optimalEffort qbar a g c Rbar E D ∈ feasibleEfforts qbar a g E D ∧
        ∀ x ∈ feasibleEfforts qbar a g E D,
          bankProfit qbar a g c Rbar F D x ≤
            bankProfit qbar a g c Rbar F D (optimalEffort qbar a g c Rbar E D)) ∧
        _)
      exact ⟨⟨hunique, hmem, hmax⟩, hrisk, hbounds.1, hbounds.2.2⟩
    · intro D hD hregime
      exact hasDerivAt_optimalRisk_interior qbar a g c Rbar E D
        hg hregime.1 hregime.2
    · intro D hD hregime
      exact hasDerivAt_optimalRisk_capacity qbar a g c Rbar E D
        hg hregime.1 hregime.2
    · intro D hD hregime
      exact hasDerivAt_optimalRisk_floor qbar a g c Rbar E D
        hg hregime.1 hregime.2
    · intro hzero
      subst E
      constructor
      · intro D hD
        have hqD := hq D hD
        have hRD := hpayoff D hD
        exact ⟨optimalEffort_zero_capacity qbar a g c Rbar D hg hc hRD hqD.1,
          optimalRisk_zero_capacity qbar a g c Rbar D hg hc hRD hqD.1⟩
      · intro D hD
        have hqLower : 0 ≤ priorRisk qbar a lower :=
          (hq lower ⟨le_rfl, hlower⟩).1
        have hqD : 0 < priorRisk qbar a D :=
          priorRisk_pos_of_interior qbar a lower D ha hqLower hD.1
        exact hasDerivAt_optimalRisk_zero_capacity qbar a g c Rbar D
          hg hc (hpayoff D ⟨hD.1.le, hD.2.le⟩) hqD
    · intro D hD
      exact optimalRisk_one_sided_derivatives qbar a g c Rbar E D
  · rcases capacity_tie_valid_model with ⟨hsel, htech, hpay, htie, hfloor⟩
    exact ⟨(1/2 : ℝ), 1, 1, 1, (1/4 : ℝ), (1/4 : ℝ),
      (-1/8 : ℝ), (1/8 : ℝ), 0, hsel, htech, hpay,
      (by norm_num), htie, hfloor, capacity_tie_not_differentiable⟩

theorem proposition2 : proposition2Spec := by
  unfold proposition2Spec
  intro qbar Rbar F E lower upper D0 a g c hD0 hmodels hcross
  have hthreshold := existsUnique_screening_threshold qbar Rbar E D0 a g c hcross
  rcases hthreshold with ⟨k, hk, hunique⟩
  rcases hcross with ⟨haC, hgC, hcC, hpositive, hanti, hzero, hone, hinterior⟩
  rcases hk with ⟨hkIoo, hkzero, hkbelow, hkabove⟩
  have hkIcc : k ∈ Icc (0 : ℝ) 1 := ⟨hkIoo.1.le, hkIoo.2.le⟩
  have hkmodel := hmodels k hkIcc
  have hkderivRaw := hasDerivAt_optimalRisk_interior
    qbar (a k) (g k) (c k) Rbar E D0 (hkmodel.2.1.1)
    (hinterior k hkIcc).1 (hinterior k hkIcc).2
  have hkderiv : HasDerivAt
      (optimalRisk qbar (a k) (g k) (c k) Rbar E) 0 D0 := by
    have hslope : a k - g k ^ 2 / c k = 0 := by
      simpa [screeningAdvantage, screeningStrength] using hkzero
    rw [hslope] at hkderivRaw
    exact hkderivRaw
  refine ⟨k, hkIoo, hkderiv, ?_, ?_, ?_⟩
  · intro y hyIoo hyderiv
    have hyIcc : y ∈ Icc (0 : ℝ) 1 := ⟨hyIoo.1.le, hyIoo.2.le⟩
    have hymodel := hmodels y hyIcc
    have hyraw := hasDerivAt_optimalRisk_interior
      qbar (a y) (g y) (c y) Rbar E D0 (hymodel.2.1.1)
      (hinterior y hyIcc).1 (hinterior y hyIcc).2
    have hyzero : screeningAdvantage (a y) (g y) (c y) = 0 := by
      have hslope : a y - g y ^ 2 / c y = 0 := hyraw.unique hyderiv
      simpa [screeningAdvantage, screeningStrength] using hslope
    rcases lt_trichotomy y k with hyk | hyk | hyk
    · have hlt := hanti hyIcc hkIcc hyk
      change screeningAdvantage (a k) (g k) (c k) <
        screeningAdvantage (a y) (g y) (c y) at hlt
      rw [hyzero, hkzero] at hlt
      linarith
    · exact hyk
    · have hlt := hanti hkIcc hyIcc hyk
      change screeningAdvantage (a y) (g y) (c y) <
        screeningAdvantage (a k) (g k) (c k) at hlt
      rw [hyzero, hkzero] at hlt
      linarith
  · intro x hx hxk
    have hxmodel := hmodels x hx
    have hxderivRaw := hasDerivAt_optimalRisk_interior
      qbar (a x) (g x) (c x) Rbar E D0 (hxmodel.2.1.1)
      (hinterior x hx).1 (hinterior x hx).2
    refine ⟨hkbelow x hx hxk, ?_⟩
    simpa [screeningAdvantage, screeningStrength] using hxderivRaw
  · intro x hx hkx
    have hxmodel := hmodels x hx
    have hxderivRaw := hasDerivAt_optimalRisk_interior
      qbar (a x) (g x) (c x) Rbar E D0 (hxmodel.2.1.1)
      (hinterior x hx).1 (hinterior x hx).2
    refine ⟨hkabove x hx hkx, ?_⟩
    simpa [screeningAdvantage, screeningStrength] using hxderivRaw

theorem proposition3 : proposition3Spec := by
  unfold proposition3Spec
  intro qbar a g c Rbar F E lower upper B0 m0 B
    hselection htechnology hpayoff hstock
  rcases hstock with ⟨hB0, hm0, hBdomain⟩
  constructor
  · intro D hD
    have hBD := (hBdomain D hD).1
    exact portfolioRatio_eq_weighted B0 m0 B
      (optimalRisk qbar a g c Rbar E) D (by positivity)
  constructor
  · intro D hD beta Bprime hqderiv hBderiv
    dsimp
    have hBD := (hBdomain D hD).1
    have hwpos := (cohortWeight_pos_lt_one B0 B D hB0 hBD).1
    refine ⟨hasDerivAt_portfolioRatio B0 m0 B
      (optimalRisk qbar a g c Rbar E) D Bprime beta hBD hB0 hBderiv hqderiv,
      ?_, ?_⟩
    · rintro ⟨b, rfl⟩
      have hBprime : Bprime = 0 := by
        exact hBderiv.unique (hasDerivAt_const D b)
      subst Bprime
      simpa using positive_weight_preserves_sign (cohortWeight B0 (fun _ ↦ b) D) beta hwpos
    · intro hbeta hsmall
      exact same_sign_of_small_composition
        (cohortWeight B0 B D) beta
        (Bprime * B0 / (B0 + B D) ^ 2 *
          (optimalRisk qbar a g c Rbar E D - m0)) hwpos hbeta hsmall
  · intro D hD beta B1 epsilon hqderiv hB hB1 hepsilon
    subst B
    dsimp
    constructor
    · exact hasDerivAt_exponential_portfolioRatio B0 B1 m0 epsilon
        (optimalRisk qbar a g c Rbar E) D beta hB0 hB1 hqderiv
    · intro hbeta hqold
      exact exponential_sign_reversal_iff B0 B1 m0 epsilon D beta
        (optimalRisk qbar a g c Rbar E D) hB0 hB1 hbeta hqold

end
end Galarza26RelativeCredit
