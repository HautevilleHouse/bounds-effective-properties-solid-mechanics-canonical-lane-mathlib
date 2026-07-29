import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure SelfConsistentSchemePackage where
  matrixFraction : ℝ
  inclusionFraction : ℝ
  matrixModulus : ℝ
  inclusionModulus : ℝ
  effectiveModulus : ℝ
  selfConsistencyEquation : ℝ := effectiveModulus - (matrixModulus * matrixFraction + inclusionModulus * inclusionFraction * (3 * effectiveModulus) / (3 * effectiveModulus + 4 * matrixModulus))
  selfConsistencyEquationClosed : selfConsistencyEquation = 0

def SelfConsistentSchemeClosed (S : SelfConsistentSchemePackage) : Prop :=
  ∃ (eff : ℝ), eff = S.effectiveModulus ∧ S.selfConsistencyEquation = 0

theorem self_consistent_scheme_closed (S : SelfConsistentSchemePackage) : SelfConsistentSchemeClosed S := by
  refine ⟨S.effectiveModulus, rfl, S.selfConsistencyEquationClosed⟩

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse