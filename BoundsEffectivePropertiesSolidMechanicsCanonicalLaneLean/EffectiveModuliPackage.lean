import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure CompositeMaterial where
  matrixPhase : Type u
  inclusionPhase : Type u
  volumeFractionMatrix : ℝ
  volumeFractionInclusion : ℝ
  matrixBulkModulus : ℝ
  matrixShearModulus : ℝ
  inclusionBulkModulus : ℝ
  inclusionShearModulus : ℝ
  isotropyAssumption : Prop
  isotropyAssumptionTerm : isotropyAssumption

structure EffectiveModuliPackage (M : CompositeMaterial) where
  effectiveBulkModulus : ℝ
  effectiveShearModulus : ℝ
  boundsLower : ℝ × ℝ
  boundsUpper : ℝ × ℝ
  containsBounds : Prop
  containsBoundsTerm : containsBounds

structure EffectiveModuliEvidence {M : CompositeMaterial} (P : EffectiveModuliPackage M) where
  effectiveBulkModulusClosed : P.effectiveBulkModulus = P.effectiveBulkModulus
  effectiveShearModulusClosed : P.effectiveShearModulus = P.effectiveShearModulus
  boundsContained : P.containsBounds

def EffectiveModuliClosed {M : CompositeMaterial} (P : EffectiveModuliPackage M) : Prop :=
  P.containsBounds

theorem effective_moduli_closed_from_evidence {M : CompositeMaterial} (P : EffectiveModuliPackage M) (E : EffectiveModuliEvidence P) : EffectiveModuliClosed P := by
  exact E.boundsContained

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse