import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure LaminateBoundsPackage where
  layupSequence : Prop
  effectiveStiffness : Prop
  upperBound : Prop
  lowerBound : Prop
  optimalDesign : Prop

structure LaminateBoundsEvidence (L : LaminateBoundsPackage) where
  layupSequenceClosed : L.layupSequence
  effectiveStiffnessClosed : L.effectiveStiffness
  upperBoundClosed : L.upperBound
  lowerBoundClosed : L.lowerBound
  optimalDesignClosed : L.optimalDesign

def LaminateBoundsClosed (L : LaminateBoundsPackage) : Prop :=
  L.layupSequence ∧ L.effectiveStiffness ∧ L.upperBound ∧ L.lowerBound ∧ L.optimalDesign

theorem laminate_bounds_closed_from_evidence (L : LaminateBoundsPackage) (E : LaminateBoundsEvidence L) :
    LaminateBoundsClosed L := by
  exact And.intro E.layupSequenceClosed
    (And.intro E.effectiveStiffnessClosed
      (And.intro E.upperBoundClosed
        (And.intro E.lowerBoundClosed E.optimalDesignClosed)))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse