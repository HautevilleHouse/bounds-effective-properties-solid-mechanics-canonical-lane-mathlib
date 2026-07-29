import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure HashinShtrikmanPrinciplePackage where
  variationalPrinciple : Prop
  polarizationField : Prop
  optimalBounds : Prop
  isotropicConstituents : Prop

structure HashinShtrikmanPrincipleEvidence (H : HashinShtrikmanPrinciplePackage) where
  variationalPrincipleClosed : H.variationalPrinciple
  polarizationFieldClosed : H.polarizationField
  optimalBoundsClosed : H.optimalBounds
  isotropicConstituentsClosed : H.isotropicConstituents

def HashinShtrikmanPrincipleClosed (H : HashinShtrikmanPrinciplePackage) : Prop :=
  H.variationalPrinciple ∧ H.polarizationField ∧ H.optimalBounds ∧ H.isotropicConstituents

theorem hashin_shtrikman_principle_closed_from_evidence
    (H : HashinShtrikmanPrinciplePackage) (Ev : HashinShtrikmanPrincipleEvidence H) :
    HashinShtrikmanPrincipleClosed H := by
  exact And.intro Ev.variationalPrincipleClosed
    (And.intro Ev.polarizationFieldClosed
      (And.intro Ev.optimalBoundsClosed Ev.isotropicConstituentsClosed))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse