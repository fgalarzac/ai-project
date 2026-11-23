import Galarza26RelativeCredit.Model

/-! Proof support for the continuous, unique opacity crossing in Proposition 2. -/

namespace Galarza26RelativeCredit
noncomputable section

open Set

theorem continuousOn_screeningAdvantage (a g c : ℝ → ℝ)
    (ha : ContinuousOn a (Icc 0 1))
    (hg : ContinuousOn g (Icc 0 1))
    (hc : ContinuousOn c (Icc 0 1))
    (hcpos : ∀ k ∈ Icc (0 : ℝ) 1, 0 < c k) :
    ContinuousOn (fun k ↦ screeningAdvantage (a k) (g k) (c k)) (Icc 0 1) := by
  apply ha.sub
  apply (hg.pow 2).div hc
  intro k hk
  exact (hcpos k hk).ne'

theorem existsUnique_strictAnti_crossing (beta : ℝ → ℝ)
    (hcont : ContinuousOn beta (Icc 0 1))
    (hanti : StrictAntiOn beta (Icc 0 1))
    (hzero : 0 < beta 0) (hone : beta 1 < 0) :
    ∃! k : ℝ,
      k ∈ Ioo (0 : ℝ) 1 ∧ beta k = 0 ∧
      (∀ x ∈ Icc (0 : ℝ) 1, x < k → 0 < beta x) ∧
      (∀ x ∈ Icc (0 : ℝ) 1, k < x → beta x < 0) := by
  have hmem : (0 : ℝ) ∈ Icc (beta 1) (beta 0) := ⟨hone.le, hzero.le⟩
  rcases (intermediate_value_Icc' (show (0 : ℝ) ≤ 1 by norm_num) hcont hmem) with
    ⟨k, hk, hkzero⟩
  have hkpos : 0 < k := by
    rcases hk with ⟨hk0, _hk1⟩
    exact lt_of_le_of_ne hk0 (fun h ↦ by subst k; linarith)
  have hklt : k < 1 := by
    rcases hk with ⟨_hk0, hk1⟩
    exact lt_of_le_of_ne hk1 (fun h ↦ by subst k; linarith)
  have hbelow : ∀ x ∈ Icc (0 : ℝ) 1, x < k → 0 < beta x := by
    intro x hx hxk
    have hlt := hanti hx hk hxk
    linarith
  have habove : ∀ x ∈ Icc (0 : ℝ) 1, k < x → beta x < 0 := by
    intro x hx hkx
    have hlt := hanti hk hx hkx
    linarith
  refine ⟨k, ⟨⟨hkpos, hklt⟩, hkzero, hbelow, habove⟩, ?_⟩
  intro y hy
  rcases hy with ⟨hyIoo, hyzero, _hybelow, _hyabove⟩
  rcases lt_trichotomy y k with hyk | hyk | hyk
  · have hlt := hanti ⟨hyIoo.1.le, hyIoo.2.le⟩ hk hyk
    linarith
  · exact hyk
  · have hlt := hanti hk ⟨hyIoo.1.le, hyIoo.2.le⟩ hyk
    linarith

theorem existsUnique_screening_threshold
    (qbar Rbar E D0 : ℝ) (a g c : ℝ → ℝ)
    (hcross : crossingConditions qbar Rbar E D0 a g c) :
    ∃! k : ℝ,
      k ∈ Ioo (0 : ℝ) 1 ∧
      screeningAdvantage (a k) (g k) (c k) = 0 ∧
      (∀ x ∈ Icc (0 : ℝ) 1, x < k →
        0 < screeningAdvantage (a x) (g x) (c x)) ∧
      (∀ x ∈ Icc (0 : ℝ) 1, k < x →
        screeningAdvantage (a x) (g x) (c x) < 0) := by
  rcases hcross with ⟨ha, hg, hc, hpos, hanti, hzero, hone, _hinterior⟩
  exact existsUnique_strictAnti_crossing
    (fun k ↦ screeningAdvantage (a k) (g k) (c k))
    (continuousOn_screeningAdvantage a g c ha hg hc (fun k hk ↦ (hpos k hk).2.2))
    hanti hzero hone

end
end Galarza26RelativeCredit
