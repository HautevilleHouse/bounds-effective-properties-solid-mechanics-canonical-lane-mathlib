import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure AdmissibleClass where
  object : SolidMechanicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BoundsEffectivePropertiesClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse
