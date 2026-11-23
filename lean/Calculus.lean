import Galarza26RelativeCredit.Model

namespace Galarza26RelativeCredit
noncomputable section
open Set Filter Topology

theorem hasDerivAt_priorRisk (qbar a D : ℝ) :
    HasDerivAt (priorRisk qbar a) a D := by
  change HasDerivAt (fun x : ℝ => qbar + a * x) a D
  simpa only [mul_one] using ((hasDerivAt_id D).const_mul a).const_add qbar

theorem hasDerivAt_premium (Rbar D : ℝ) :
    HasDerivAt (premium Rbar) 1 D := by
  simpa [premium] using (hasDerivAt_id D).const_add Rbar

theorem hasDerivAt_unconstrainedEffort (g c Rbar D : ℝ) :
    HasDerivAt (fun x => g * premium Rbar x / c) (g / c) D := by
  simpa using ((hasDerivAt_premium Rbar D).const_mul g).div_const c

theorem continuous_optimalEffort (qbar a g c Rbar E : ℝ) :
    Continuous (optimalEffort qbar a g c Rbar E) := by
  unfold optimalEffort priorRisk premium
  fun_prop

theorem continuous_optimalRisk (qbar a g c Rbar E : ℝ) :
    Continuous (optimalRisk qbar a g c Rbar E) := by
  unfold optimalRisk priorRisk premium
  fun_prop

theorem hasDerivAt_optimalRisk_interior (qbar a g c Rbar E D : ℝ)
    (hg : 0 < g)
    (hcap : g * premium Rbar D / c < E)
    (hfloor : g * premium Rbar D / c < priorRisk qbar a D / g) :
    HasDerivAt (optimalRisk qbar a g c Rbar E) (a - g ^ 2 / c) D := by
  have hz : ContinuousAt (fun x => g * premium Rbar x / c) D := by
    unfold premium
    fun_prop
  have hp : ContinuousAt (fun x => priorRisk qbar a x / g) D := by
    unfold priorRisk
    fun_prop
  have heq : optimalRisk qbar a g c Rbar E =ᶠ[𝓝 D]
      (fun x => priorRisk qbar a x - g * (g * premium Rbar x / c)) := by
    filter_upwards [hz.eventually_lt continuousAt_const hcap,
      hz.eventually_lt hp hfloor] with x hxE hxq
    have hprod := (lt_div_iff₀ hg).mp hxq
    have hnonneg : 0 ≤ priorRisk qbar a x - g * (g * premium Rbar x / c) := by
      nlinarith
    simp only [optimalRisk, min_eq_right hxE.le, max_eq_right hnonneg]
  have hd := (hasDerivAt_priorRisk qbar a D).sub
    ((hasDerivAt_unconstrainedEffort g c Rbar D).const_mul g)
  have hd' : HasDerivAt
      (fun x => priorRisk qbar a x - g * (g * premium Rbar x / c))
      (a - g ^ 2 / c) D := by
    convert hd using 1
    ring
  exact hd'.congr_of_eventuallyEq heq

theorem hasDerivAt_optimalRisk_capacity (qbar a g c Rbar E D : ℝ)
    (hg : 0 < g)
    (hcap : E < g * premium Rbar D / c)
    (hfloor : E < priorRisk qbar a D / g) :
    HasDerivAt (optimalRisk qbar a g c Rbar E) a D := by
  have hz : ContinuousAt (fun x => g * premium Rbar x / c) D := by
    unfold premium
    fun_prop
  have hp : ContinuousAt (fun x => priorRisk qbar a x / g) D := by
    unfold priorRisk
    fun_prop
  have heq : optimalRisk qbar a g c Rbar E =ᶠ[𝓝 D]
      (fun x => priorRisk qbar a x - g * E) := by
    filter_upwards [continuousAt_const.eventually_lt hz hcap,
      continuousAt_const.eventually_lt hp hfloor] with x hxE hxq
    have hprod := (lt_div_iff₀ hg).mp hxq
    have hnonneg : 0 ≤ priorRisk qbar a x - g * E := by nlinarith
    simp only [optimalRisk, min_eq_left hxE.le, max_eq_right hnonneg]
  exact ((hasDerivAt_priorRisk qbar a D).sub_const (g * E)).congr_of_eventuallyEq heq

theorem hasDerivAt_optimalRisk_floor (qbar a g c Rbar E D : ℝ)
    (hg : 0 < g)
    (hz : priorRisk qbar a D / g < g * premium Rbar D / c)
    (hcap : priorRisk qbar a D / g < E) :
    HasDerivAt (optimalRisk qbar a g c Rbar E) 0 D := by
  have hzcont : ContinuousAt (fun x => g * premium Rbar x / c) D := by
    unfold premium
    fun_prop
  have hpcont : ContinuousAt (fun x => priorRisk qbar a x / g) D := by
    unfold priorRisk
    fun_prop
  have heq : optimalRisk qbar a g c Rbar E =ᶠ[𝓝 D] (fun _ => (0 : ℝ)) := by
    filter_upwards [hpcont.eventually_lt hzcont hz,
      hpcont.eventually_lt continuousAt_const hcap] with x hxz hxE
    have hmin : priorRisk qbar a x / g < min E (g * premium Rbar x / c) :=
      lt_min hxE hxz
    have hprod := (div_lt_iff₀ hg).mp hmin
    have hnonpos : priorRisk qbar a x - g * min E (g * premium Rbar x / c) ≤ 0 := by
      nlinarith
    simp only [optimalRisk, max_eq_left hnonpos]
  exact (hasDerivAt_const D (0 : ℝ)).congr_of_eventuallyEq heq

theorem hasDerivAt_optimalRisk_zero_capacity (qbar a g c Rbar D : ℝ)
    (hg : 0 < g) (hc : 0 < c) (hR : 0 < premium Rbar D)
    (hq : 0 < priorRisk qbar a D) :
    HasDerivAt (optimalRisk qbar a g c Rbar 0) a D := by
  have hp : ContinuousAt (priorRisk qbar a) D := by unfold priorRisk; fun_prop
  have hz : ContinuousAt (fun x => g * premium Rbar x / c) D := by
    unfold premium
    fun_prop
  have hzpos : 0 < g * premium Rbar D / c := div_pos (mul_pos hg hR) hc
  have heq : optimalRisk qbar a g c Rbar 0 =ᶠ[𝓝 D] priorRisk qbar a := by
    filter_upwards [continuousAt_const.eventually_lt hp hq,
      continuousAt_const.eventually_lt hz hzpos] with x hx hxz
    simp only [optimalRisk, min_eq_left hxz.le, mul_zero, sub_zero, max_eq_right hx.le]
  exact (hasDerivAt_priorRisk qbar a D).congr_of_eventuallyEq heq

theorem priorRisk_pos_of_interior (qbar a Dlo D : ℝ) (ha : 0 < a)
    (hqlo : 0 ≤ priorRisk qbar a Dlo) (hDlo : Dlo < D) :
    0 < priorRisk qbar a D := by
  unfold priorRisk at *
  nlinarith [mul_pos ha (sub_pos.mpr hDlo)]

/- Private local-affine proof support for the two one-sided derivatives at ties.
   No local-affineness property is assumed by a source-facing theorem. -/
private def AffineGerm (f : ℝ → ℝ) (s : Set ℝ) (x : ℝ) : Prop :=
  ∃ d : ℝ, f =ᶠ[𝓝[s] x] (fun y => f x + d * (y - x))

private theorem affineGerm_const (b x : ℝ) (s : Set ℝ) :
    AffineGerm (fun _ => b) s x := by
  refine ⟨0, ?_⟩
  filter_upwards [] with y
  ring

private theorem affineGerm_add {f g : ℝ → ℝ} {s : Set ℝ} {x : ℝ}
    (hf : AffineGerm f s x) (hg : AffineGerm g s x) :
    AffineGerm (fun y => f y + g y) s x := by
  rcases hf with ⟨df, hf⟩
  rcases hg with ⟨dg, hg⟩
  refine ⟨df + dg, ?_⟩
  filter_upwards [hf, hg] with y hfy hgy
  rw [hfy, hgy]
  ring

private theorem affineGerm_mul_const {f : ℝ → ℝ} {s : Set ℝ} {x : ℝ}
    (hf : AffineGerm f s x) (b : ℝ) : AffineGerm (fun y => b * f y) s x := by
  rcases hf with ⟨df, hf⟩
  refine ⟨b * df, ?_⟩
  filter_upwards [hf] with y hfy
  rw [hfy]
  ring

private theorem affineGerm_min {f g : ℝ → ℝ} {s : Set ℝ} {x : ℝ}
    (hside : (∀ᶠ y in 𝓝[s] x, x ≤ y) ∨ (∀ᶠ y in 𝓝[s] x, y ≤ x))
    (hf : AffineGerm f s x) (hg : AffineGerm g s x) :
    AffineGerm (fun y => min (f y) (g y)) s x := by
  rcases hf with ⟨df, hf⟩
  rcases hg with ⟨dg, hg⟩
  have hfc : ContinuousAt (fun y => f x + df * (y - x)) x := by fun_prop
  have hgc : ContinuousAt (fun y => g x + dg * (y - x)) x := by fun_prop
  rcases lt_trichotomy (f x) (g x) with hfg | hfg | hfg
  · have hcmp := hfc.eventually_lt hgc (by simpa using hfg)
    refine ⟨df, ?_⟩
    filter_upwards [hf, hg, hcmp.filter_mono nhdsWithin_le_nhds] with y hfy hgy hxy
    rw [hfy, hgy, min_eq_left hxy.le, min_eq_left hfg.le]
  · rcases hside with hs | hs
    · refine ⟨min df dg, ?_⟩
      filter_upwards [hf, hg, hs] with y hfy hgy hxy
      rw [hfy, hgy, hfg, min_self]
      by_cases hd : df ≤ dg
      · rw [min_eq_left hd]
        apply min_eq_left
        nlinarith [mul_nonneg (sub_nonneg.mpr hd) (sub_nonneg.mpr hxy)]
      · rw [min_eq_right (le_of_not_ge hd)]
        apply min_eq_right
        nlinarith [mul_nonneg (sub_nonneg.mpr (le_of_not_ge hd)) (sub_nonneg.mpr hxy)]
    · refine ⟨max df dg, ?_⟩
      filter_upwards [hf, hg, hs] with y hfy hgy hyx
      rw [hfy, hgy, hfg, min_self]
      by_cases hd : df ≤ dg
      · rw [max_eq_right hd]
        apply min_eq_right
        nlinarith [mul_nonneg (sub_nonneg.mpr hd) (sub_nonneg.mpr hyx)]
      · rw [max_eq_left (le_of_not_ge hd)]
        apply min_eq_left
        nlinarith [mul_nonneg (sub_nonneg.mpr (le_of_not_ge hd)) (sub_nonneg.mpr hyx)]
  · have hcmp := hgc.eventually_lt hfc (by simpa using hfg)
    refine ⟨dg, ?_⟩
    filter_upwards [hf, hg, hcmp.filter_mono nhdsWithin_le_nhds] with y hfy hgy hxy
    rw [hfy, hgy, min_eq_right hxy.le, min_eq_right hfg.le]

private theorem affineGerm_max {f g : ℝ → ℝ} {s : Set ℝ} {x : ℝ}
    (hside : (∀ᶠ y in 𝓝[s] x, x ≤ y) ∨ (∀ᶠ y in 𝓝[s] x, y ≤ x))
    (hf : AffineGerm f s x) (hg : AffineGerm g s x) :
    AffineGerm (fun y => max (f y) (g y)) s x := by
  have hnegf := affineGerm_mul_const hf (-1)
  have hnegg := affineGerm_mul_const hg (-1)
  have hmin := affineGerm_min hside hnegf hnegg
  have hneg := affineGerm_mul_const hmin (-1)
  have hid : (fun y => (-1 : ℝ) * min ((-1) * f y) ((-1) * g y)) =
      (fun y => max (f y) (g y)) := by
    funext y
    by_cases h : f y ≤ g y
    · rw [max_eq_right h, min_eq_right (by linarith : (-1 : ℝ) * g y ≤ (-1) * f y)]
      ring
    · rw [max_eq_left (le_of_not_ge h),
        min_eq_left (by linarith : (-1 : ℝ) * f y ≤ (-1) * g y)]
      ring
  rwa [hid] at hneg

private theorem affineGerm_optimalRisk (qbar a g c Rbar E D : ℝ) (s : Set ℝ)
    (hside : (∀ᶠ y in 𝓝[s] D, D ≤ y) ∨ (∀ᶠ y in 𝓝[s] D, y ≤ D)) :
    AffineGerm (optimalRisk qbar a g c Rbar E) s D := by
  have hp : AffineGerm (priorRisk qbar a) s D := by
    refine ⟨a, ?_⟩
    filter_upwards [] with y
    unfold priorRisk
    ring
  have hz : AffineGerm (fun y => g * premium Rbar y / c) s D := by
    refine ⟨g / c, ?_⟩
    filter_upwards [] with y
    unfold premium
    ring
  have hm := affineGerm_min hside (affineGerm_const E D s) hz
  have hi := affineGerm_add hp (affineGerm_mul_const hm (-g))
  have ho := affineGerm_max hside (affineGerm_const 0 D s) hi
  simpa only [optimalRisk, sub_eq_add_neg, neg_mul] using ho

private theorem AffineGerm.exists_hasDerivWithinAt {f : ℝ → ℝ} {s : Set ℝ} {x : ℝ}
    (hf : AffineGerm f s x) : ∃ d : ℝ, HasDerivWithinAt f d s x := by
  rcases hf with ⟨d, heq⟩
  have hd : HasDerivAt (fun y => f x + d * (y - x)) d x := by
    simpa using (((hasDerivAt_id x).sub_const x).const_mul d).const_add (f x)
  exact ⟨d, hd.hasDerivWithinAt.congr_of_eventuallyEq heq (by simp)⟩

theorem optimalRisk_one_sided_derivatives (qbar a g c Rbar E D : ℝ) :
    ∃ left right : ℝ,
      HasDerivWithinAt (optimalRisk qbar a g c Rbar E) left (Iic D) D ∧
      HasDerivWithinAt (optimalRisk qbar a g c Rbar E) right (Ici D) D := by
  have hleft : ∀ᶠ y in 𝓝[Iic D] D, y ≤ D := self_mem_nhdsWithin
  have hright : ∀ᶠ y in 𝓝[Ici D] D, D ≤ y := self_mem_nhdsWithin
  obtain ⟨l, hl⟩ := (affineGerm_optimalRisk qbar a g c Rbar E D (Iic D) (Or.inr hleft)).exists_hasDerivWithinAt
  obtain ⟨r, hr⟩ := (affineGerm_optimalRisk qbar a g c Rbar E D (Ici D) (Or.inl hright)).exists_hasDerivWithinAt
  exact ⟨l, r, hl, hr⟩

end
end Galarza26RelativeCredit
