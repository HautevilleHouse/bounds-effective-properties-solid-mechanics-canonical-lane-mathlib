import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure MoriTanakaMethodPackage where
  matrixFraction : ℝ
  inclusionFraction : ℝ
  matrixModulus : ℝ
  inclusionModulus : ℝ
  diluteStrainConcentrationTensor : ℝ
  effectiveModulus : ℝ
  effectiveModulusClosed : effectiveModulus = matrixModulus + inclusionFraction * (inclusionModulus - matrixModulus) * diluteStrainConcentrationTensor

def MoriTanakaMethodClosed (M : MoriTanakaMethodPackage) : Prop :=
  M.effectiveModulus = M.matrixModulus + M.inclusionFraction * (M.inclusionModulus - M.matrixModulus) * M.diluteStrainConcentrationTensor

theorem mori_tanaka_method_closed (M : MoriTanakaMethodPackage) : MoriTanakaMethodClosed M := by
  exact M.effectiveModulusClosed

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse