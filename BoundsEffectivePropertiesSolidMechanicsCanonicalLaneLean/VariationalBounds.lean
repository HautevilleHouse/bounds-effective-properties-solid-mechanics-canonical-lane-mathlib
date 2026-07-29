import canonicalLaneMathlib.AdmissibleClass

/-!
# Variational Bounds Package
-/

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure VariationalBoundsPackage where
  minEnergyPrinciple : Prop
  minComplementaryEnergy : Prop
  voigtReussBounds : Prop
  variationalAsymptotic : Prop

structure VariationalBoundsEvidence (V : VariationalBoundsPackage) where
  minEnergyPrincipleClosed : V.minEnergyPrinciple
  minComplementaryEnergyClosed : V.minComplementaryEnergy
  voigtReussBoundsClosed : V.voigtReussBounds
  variationalAsymptoticClosed : V.variationalAsymptotic

def VariationalBoundsClosed (V : VariationalBoundsPackage) : Prop :=
  V.minEnergyPrinciple ∧ V.minComplementaryEnergy ∧ V.voigtReussBounds ∧ V.variationalAsymptotic

theorem variational_bounds_closed_from_evidence
    (V : VariationalBoundsPackage) (E : VariationalBoundsEvidence V) :
    VariationalBoundsClosed V := by
  exact And.intro E.minEnergyPrincipleClosed
    (And.intro E.minComplementaryEnergyClosed
      (And.intro E.voigtReussBoundsClosed E.variationalAsymptoticClosed))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse