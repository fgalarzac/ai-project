import Galarza26RelativeCredit.Model

/-! Ledger, derivative, and sign proof support for Proposition 3. -/

namespace Galarza26RelativeCredit
noncomputable section

open Set

theorem portfolioRatio_eq_weighted (B0 m0 : ℝ) (B q : ℝ → ℝ) (D : ℝ)
    (hden : B0 + B D ≠ 0) :
    portfolioRatio B0 m0 B q D =
      (1 - cohortWeight B0 B D) * m0 + cohortWeight B0 B D * q D := by
  unfold portfolioRatio impairedBalance cohortWeight
  field_simp
  ring

theorem hasDerivAt_cohortWeight (B0 : ℝ) (B : ℝ → ℝ) (D Bprime : ℝ)
    (hB : HasDerivAt B Bprime D) (hden : B0 + B D ≠ 0) :
    HasDerivAt (cohortWeight B0 B)
      (Bprime * B0 / (B0 + B D) ^ 2) D := by
  have hquot := hB.div ((hasDerivAt_const D B0).add hB) hden
  change HasDerivAt (fun x ↦ B x / (B0 + B x))
    (Bprime * B0 / (B0 + B D) ^ 2) D
  convert hquot using 1
  simp only [Pi.add_apply]
  field_simp [hden]
  ring

theorem hasDerivAt_portfolioRatio (B0 m0 : ℝ) (B q : ℝ → ℝ)
    (D Bprime beta : ℝ)
    (hBD : 0 < B D) (hB0 : 0 < B0)
    (hB : HasDerivAt B Bprime D) (hq : HasDerivAt q beta D) :
    let w := cohortWeight B0 B D
    let wprime := Bprime * B0 / (B0 + B D) ^ 2
    HasDerivAt (portfolioRatio B0 m0 B q)
      (w * beta + wprime * (q D - m0)) D := by
  dsimp
  have hden : B0 + B D ≠ 0 := by positivity
  have hnum := (hasDerivAt_const D (B0 * m0)).add (hB.mul hq)
  have hdenDeriv := (hasDerivAt_const D B0).add hB
  have hquot := hnum.div hdenDeriv hden
  change HasDerivAt
    (fun x ↦ (B0 * m0 + B x * q x) / (B0 + B x))
    (cohortWeight B0 B D * beta +
      Bprime * B0 / (B0 + B D) ^ 2 * (q D - m0)) D
  convert hquot using 1
  unfold cohortWeight
  simp only [Pi.add_apply, Pi.mul_apply]
  field_simp [hden]
  ring

theorem cohortWeight_pos_lt_one (B0 : ℝ) (B : ℝ → ℝ) (D : ℝ)
    (hB0 : 0 < B0) (hB : 0 < B D) :
    0 < cohortWeight B0 B D ∧ cohortWeight B0 B D < 1 := by
  unfold cohortWeight
  constructor
  · positivity
  · apply (div_lt_one (by positivity)).2
    linarith

theorem positive_weight_preserves_sign (w beta : ℝ) (hw : 0 < w) :
    (0 < w * beta ↔ 0 < beta) ∧
    (w * beta = 0 ↔ beta = 0) ∧
    (w * beta < 0 ↔ beta < 0) := by
  constructor
  · constructor
    · intro h
      by_contra hn
      exact (not_lt_of_ge (mul_nonpos_of_nonneg_of_nonpos hw.le (le_of_not_gt hn))) h
    · exact mul_pos hw
  constructor
  · simp [hw.ne']
  · constructor
    · intro h
      by_contra hn
      exact (not_lt_of_ge (mul_nonneg hw.le (le_of_not_gt hn))) h
    · exact mul_neg_of_pos_of_neg hw

theorem same_sign_of_small_composition (w beta composition : ℝ)
    (hw : 0 < w) (hbeta : beta ≠ 0)
    (hsmall : |composition| < w * |beta|) :
    0 < (w * beta + composition) * beta := by
  rcases lt_or_gt_of_ne hbeta with hneg | hpos
  · have habs : |beta| = -beta := abs_of_neg hneg
    have hupper : composition < w * (-beta) := by
      exact (abs_lt.mp (by simpa [habs] using hsmall)).2
    have hsum : w * beta + composition < 0 := by linarith
    exact mul_pos_of_neg_of_neg hsum hneg
  · have habs : |beta| = beta := abs_of_pos hpos
    have hlower : -(w * beta) < composition := by
      have := (abs_lt.mp (by simpa [habs] using hsmall)).1
      exact this
    have hsum : 0 < w * beta + composition := by linarith
    exact mul_pos hsum hpos

theorem hasDerivAt_exponentialBalance (B1 epsilon D : ℝ) :
    HasDerivAt (exponentialBalance B1 epsilon)
      (-epsilon * exponentialBalance B1 epsilon D) D := by
  have hlin : HasDerivAt (fun x : ℝ ↦ -epsilon * x) (-epsilon) D :=
    by
      simpa using (hasDerivAt_id D).const_mul (-epsilon)
  have hexp := hlin.exp.const_mul B1
  convert hexp using 1
  all_goals simp only [exponentialBalance]
  ring

theorem exponential_weight_derivative (B0 B1 epsilon D : ℝ)
    (hB0 : 0 < B0) (hB1 : 0 < B1) :
    HasDerivAt (cohortWeight B0 (exponentialBalance B1 epsilon))
      (-epsilon * cohortWeight B0 (exponentialBalance B1 epsilon) D *
        (1 - cohortWeight B0 (exponentialBalance B1 epsilon) D)) D := by
  have hB := hasDerivAt_exponentialBalance B1 epsilon D
  have hBD : 0 < exponentialBalance B1 epsilon D := by
    unfold exponentialBalance
    positivity
  have hden : B0 + exponentialBalance B1 epsilon D ≠ 0 := by positivity
  have hw := hasDerivAt_cohortWeight B0 (exponentialBalance B1 epsilon) D
    (-epsilon * exponentialBalance B1 epsilon D) hB hden
  convert hw using 1
  unfold cohortWeight
  field_simp
  ring

theorem hasDerivAt_exponential_portfolioRatio
    (B0 B1 m0 epsilon : ℝ) (q : ℝ → ℝ) (D beta : ℝ)
    (hB0 : 0 < B0) (hB1 : 0 < B1) (hq : HasDerivAt q beta D) :
    let B := exponentialBalance B1 epsilon
    let w := cohortWeight B0 B D
    HasDerivAt (portfolioRatio B0 m0 B q)
      (w * (beta - epsilon * (1 - w) * (q D - m0))) D := by
  dsimp
  have hBD : 0 < exponentialBalance B1 epsilon D := by
    unfold exponentialBalance
    positivity
  have hgeneral := hasDerivAt_portfolioRatio B0 m0
    (exponentialBalance B1 epsilon) q D
    (-epsilon * exponentialBalance B1 epsilon D) beta hBD hB0
    (hasDerivAt_exponentialBalance B1 epsilon D) hq
  have hw := exponential_weight_derivative B0 B1 epsilon D hB0 hB1
  have hgenericWeight := hasDerivAt_cohortWeight B0
    (exponentialBalance B1 epsilon) D
    (-epsilon * exponentialBalance B1 epsilon D)
    (hasDerivAt_exponentialBalance B1 epsilon D) (by
      positivity)
  have hformula :
      (-epsilon * exponentialBalance B1 epsilon D) * B0 /
          (B0 + exponentialBalance B1 epsilon D) ^ 2 =
        -epsilon * cohortWeight B0 (exponentialBalance B1 epsilon) D *
          (1 - cohortWeight B0 (exponentialBalance B1 epsilon) D) := by
    exact hgenericWeight.unique hw
  rw [hformula] at hgeneral
  convert hgeneral using 1
  ring

theorem exponential_sign_reversal_iff
    (B0 B1 m0 epsilon D beta qD : ℝ)
    (hB0 : 0 < B0) (hB1 : 0 < B1)
    (hbeta : 0 < beta) (hq : m0 < qD) :
    let w := cohortWeight B0 (exponentialBalance B1 epsilon) D
    w * (beta - epsilon * (1 - w) * (qD - m0)) < 0 ↔
      beta < epsilon * (1 - w) * (qD - m0) := by
  dsimp
  have hBD : 0 < exponentialBalance B1 epsilon D := by
    unfold exponentialBalance
    positivity
  have hw : 0 < cohortWeight B0 (exponentialBalance B1 epsilon) D :=
    (cohortWeight_pos_lt_one B0 (exponentialBalance B1 epsilon) D hB0 hBD).1
  constructor
  · intro hneg
    have hbracket :
        beta - epsilon * (1 - cohortWeight B0 (exponentialBalance B1 epsilon) D) *
          (qD - m0) < 0 := by
      by_contra h
      exact (not_lt_of_ge (mul_nonneg hw.le (le_of_not_gt h))) hneg
    linarith
  · intro hineq
    apply mul_neg_of_pos_of_neg hw
    linarith

end
end Galarza26RelativeCredit
