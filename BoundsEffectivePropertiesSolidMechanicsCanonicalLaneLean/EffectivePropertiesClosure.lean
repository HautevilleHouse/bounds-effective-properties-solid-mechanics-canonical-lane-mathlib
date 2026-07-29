import canonicalLaneMathlib.AdmissibleClass
import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.HashinShtrikmanBounds
import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.VariationalPrinciple

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure EffectivePropertiesClosurePackage where
  hsPackage : HashinShtrikmanBoundsPackage
  varPackage : VariationalPrinciplePackage

def bridgeClosed (A : AdmissibleClass) : Prop :=
  HashinShtrikmanBoundsClosed A.object

def gateClosed (A : AdmissibleClass) : Prop :=
  VariationalPrincipleClosed A.object

def ConstrainedEffectivePropertiesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_effective_properties_endgame (A : AdmissibleClass) :
    ConstrainedEffectivePropertiesClosure A :=
  And.intro (by
    -- bridge from admissible class
    exact A.endpointSatisfied) (by
    -- gate from admissible class
    exact A.remainderRecorded)

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse