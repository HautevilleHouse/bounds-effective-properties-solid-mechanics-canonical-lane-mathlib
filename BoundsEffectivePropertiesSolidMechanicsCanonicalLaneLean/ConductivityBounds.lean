import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure ConductivityBounds where
  effectiveConductivity : ℝ
  lowerBound : ℝ
  upperBound : ℝ
  phaseConductivities : List ℝ
  volumeFractions : List ℝ

structure ConductivityEvidence (C : ConductivityBounds) where
  conductivityWithinBounds : C.lowerBound ≤ C.effectiveConductivity ∧ C.effectiveConductivity ≤ C.upperBound
  boundsOrdered : C.lowerBound ≤ C.upperBound
  phaseValidity : ∀ x ∈ C.phaseConductivities, x > 0
  volumeFractionsSumToOne : (C.volumeFractions.foldr (· + ·) 0) = 1
  lengthMatch : C.phaseConductivities.length = C.volumeFractions.length

def ConductivityBoundsClosed (C : ConductivityBounds) : Prop :=
  (C.lowerBound ≤ C.effectiveConductivity ∧ C.effectiveConductivity ≤ C.upperBound) ∧
  C.lowerBound ≤ C.upperBound ∧
  (∀ x ∈ C.phaseConductivities, x > 0) ∧
  (C.volumeFractions.foldr (· + ·) 0 = 1) ∧
  C.phaseConductivities.length = C.volumeFractions.length

theorem conductivity_bounds_closed_from_evidence (C : ConductivityBounds) (E : ConductivityEvidence C) : ConductivityBoundsClosed C :=
  by
    refine And.intro E.conductivityWithinBounds (And.intro E.boundsOrdered (And.intro E.phaseValidity (And.intro E.volumeFractionsSumToOne E.lengthMatch)))

end HautevilleHouse.BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse