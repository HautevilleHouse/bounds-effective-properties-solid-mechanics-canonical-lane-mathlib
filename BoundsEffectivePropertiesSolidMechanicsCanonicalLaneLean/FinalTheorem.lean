import canonicalLaneMathlib.AdmissibleClass
import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.BridgeLemmas
import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

def ConstrainedHomogenizationClosure (A : HomogenizationAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_homogenization_endgame (A : HomogenizationAdmissibleClass) :
    ConstrainedHomogenizationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse