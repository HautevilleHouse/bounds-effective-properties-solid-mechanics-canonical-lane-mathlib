import canonicalLaneMathlib.AdmissibleClass
import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.HomogenizationAdmissible

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

def gateClosed (A : HomogenizationAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : HomogenizationAdmissibleClass) : gateClosed A :=
  A.gateWitness

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse