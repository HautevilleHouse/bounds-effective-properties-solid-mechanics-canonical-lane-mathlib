import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure RigidityBoundsPackage where
  strainEnergy : Prop
  stressConcentration : Prop
  upperBound : Prop
  lowerBound : Prop
  sharpness : Prop

structure RigidityBoundsEvidence (P : RigidityBoundsPackage) where
  strainEnergyClosed : P.strainEnergy
  stressConcentrationClosed : P.stressConcentration
  upperBoundClosed : P.upperBound
  lowerBoundClosed : P.lowerBound
  sharpnessClosed : P.sharpness

def RigidityBoundsClosed (P : RigidityBoundsPackage) : Prop :=
  P.strainEnergy ∧ P.stressConcentration ∧ P.upperBound ∧ P.lowerBound ∧ P.sharpness

theorem rigidity_bounds_closed_from_evidence (P : RigidityBoundsPackage) (E : RigidityBoundsEvidence P) :
    RigidityBoundsClosed P := by
  exact And.intro E.strainEnergyClosed
    (And.intro E.stressConcentrationClosed
      (And.intro E.upperBoundClosed
        (And.intro E.lowerBoundClosed E.sharpnessClosed)))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse