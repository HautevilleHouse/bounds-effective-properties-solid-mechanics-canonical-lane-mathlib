import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure VoigtReussBoundPackage where
  phaseFractions : List ℝ
  phaseModuli : List ℝ
  effectiveModulusVoigt : ℝ
  effectiveModulusReuss : ℝ
  effectiveModulusVoigtClosed : effectiveModulusVoigt = List.sum (List.zipWith (*) phaseFractions phaseModuli)
  effectiveModulusReussClosed : effectiveModulusReuss = 1 / List.sum (List.zipWith (λ f m => f / m) phaseFractions phaseModuli)

def VoigtReussBoundsClosed (V : VoigtReussBoundPackage) : Prop :=
  V.effectiveModulusReuss ≤ V.effectiveModulusVoigt

theorem voigt_reuss_bounds_closed (V : VoigtReussBoundPackage) : VoigtReussBoundsClosed V := by
  have hpos : ∀ (f m : ℝ), 0 ≤ f ∧ 0 < m → f / m ≥ 0 := by
    intro f m ⟨hf, hm⟩; exact div_nonneg hf (by positivity)
  have sum_nonneg : ∀ (l : List ℝ), (∀ x ∈ l, 0 ≤ x) → 0 ≤ List.sum l := by
    intro l; induction l with
    | nil => intro; simp
    | cons h t ih => intro hpos; simp [hpos h (by simp), ih (λ x hx => hpos x (by simp [hx]))]
  have h_nonneg_frac : ∀ (f m : ℝ), 0 ≤ f → 0 < m → 0 ≤ f / m := by
    intro f m hf hm; exact div_nonneg hf (by positivity)
  have hsum_nonneg : 0 ≤ List.sum (List.zipWith (λ f m => f / m) V.phaseFractions V.phaseModuli) := by
    apply sum_nonneg
    intro x hx
    rcases List.mem_zipWith.mp hx with ⟨f, m, hf, hm, rfl⟩
    have hf_nonneg : 0 ≤ f := by
      positivity
    have hm_pos : 0 < m := by
      positivity
    exact h_nonneg_frac f m hf_nonneg hm_pos
  calc
    V.effectiveModulusReuss = 1 / List.sum (List.zipWith (λ f m => f / m) V.phaseFractions V.phaseModuli) := V.effectiveModulusReussClosed
    _ ≤ 1 / 0 := by
      refine one_div_le_one_div ?_ ?_
      · exact hsum_nonneg
      · have hsum_pos : 0 < List.sum (List.zipWith (λ f m => f / m) V.phaseFractions V.phaseModuli) := by
          positivity
        exact hsum_pos
    _ = 0 := by simp
    _ ≤ V.effectiveModulusVoigt := by
      rw [V.effectiveModulusVoigtClosed]
      apply sum_nonneg
      intro x hx
      rcases List.mem_zipWith.mp hx with ⟨f, m, hf, hm, rfl⟩
      have hf_nonneg : 0 ≤ f := by
        positivity
      have hm_nonneg : 0 ≤ m := by
        positivity
      exact mul_nonneg hf_nonneg hm_nonneg

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse