import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure HashinShtrikmanBoundPackage where
  inclusionPhaseFraction : ℝ
  matrixModulus : ℝ
  inclusionModulus : ℝ
  bulkBoundLower : ℝ
  bulkBoundUpper : ℝ
  shearBoundLower : ℝ
  shearBoundUpper : ℝ

structure HashinShtrikmanBoundEvidence (H : HashinShtrikmanBoundPackage) where
  bulkBoundLowerClosed : H.bulkBoundLower = (H.matrixModulus + (4/3)*H.inclusionModulus) / (1 - H.inclusionPhaseFraction)
  bulkBoundUpperClosed : H.bulkBoundUpper = (H.inclusionModulus + (4/3)*H.matrixModulus) / H.inclusionPhaseFraction
  shearBoundLowerClosed : H.shearBoundLower = H.matrixModulus + H.inclusionPhaseFraction / ((1/(H.inclusionModulus - H.matrixModulus)) + (2*(H.matrixModulus + 2*H.matrixModulus))/(5*H.matrixModulus*(H.matrixModulus + (4/3)*H.matrixModulus)))
  shearBoundUpperClosed : H.shearBoundUpper = H.inclusionModulus + (1 - H.inclusionPhaseFraction) / ((1/(H.matrixModulus - H.inclusionModulus)) + (2*(H.inclusionModulus + 2*H.inclusionModulus))/(5*H.inclusionModulus*(H.inclusionModulus + (4/3)*H.inclusionModulus)))

def HashinShtrikmanBoundsClosed (H : HashinShtrikmanBoundPackage) : Prop :=
  H.bulkBoundLower ≤ H.bulkBoundUpper ∧ H.shearBoundLower ≤ H.shearBoundUpper

theorem hashin_shtrikman_bounds_closed_from_evidence (H : HashinShtrikmanBoundPackage) (E : HashinShtrikmanBoundEvidence H) : HashinShtrikmanBoundsClosed H := by
  constructor
  · linear_combination (H.bulkBoundUpper - H.bulkBoundLower) - (E.bulkBoundUpperClosed - E.bulkBoundLowerClosed)
  · linear_combination (H.shearBoundUpper - H.shearBoundLower) - (E.shearBoundUpperClosed - E.shearBoundLowerClosed)

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse