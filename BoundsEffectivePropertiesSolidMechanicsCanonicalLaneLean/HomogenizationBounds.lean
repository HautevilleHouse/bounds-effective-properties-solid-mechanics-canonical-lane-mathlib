import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure HSBounds where
  lowerBound : ℝ
  upperBound : ℝ
  matrixModulus : ℝ
  inclusionModulus : ℝ
  volumeFraction : ℝ
  shapeFactor : ℝ

structure HSEvidence (B : HSBounds) where
  lowerBoundClosed : B.lowerBound ≤ B.upperBound
  upperBoundClosed : B.upperBound ≥ B.lowerBound
  matrixModulusPositive : B.matrixModulus > 0
  inclusionModulusPositive : B.inclusionModulus > 0
  volumeFractionInRange : B.volumeFraction ≥ 0 ∧ B.volumeFraction ≤ 1
  shapeFactorNonnegative : B.shapeFactor ≥ 0

def HSBoundsClosed (B : HSBounds) : Prop :=
  B.lowerBound ≤ B.upperBound ∧ B.upperBound ≥ B.lowerBound ∧ B.matrixModulus > 0 ∧ B.inclusionModulus > 0 ∧ (B.volumeFraction ≥ 0 ∧ B.volumeFraction ≤ 1) ∧ B.shapeFactor ≥ 0

theorem hs_bounds_closed_from_evidence (B : HSBounds) (E : HSEvidence B) : HSBoundsClosed B :=
  by
    exact And.intro E.lowerBoundClosed
      (And.intro E.upperBoundClosed
        (And.intro E.matrixModulusPositive
          (And.intro E.inclusionModulusPositive
            (And.intro E.volumeFractionInRange E.shapeFactorNonnegative))))

end HautevilleHouse.BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse