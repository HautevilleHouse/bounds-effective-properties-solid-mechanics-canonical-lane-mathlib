import canonicalLaneMathlib.AdmissibleClass
import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.EffectiveElasticProperties
import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.HashinShtrikmanBounds
import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.VoigtReussBounds
import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.SelfConsistentScheme
import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.MoriTanakaMethod

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure HomogenizationAdmissibleClass where
  object : AdmittedObject
  effectiveProperties : EffectiveElasticPropertiesPackage
  hashinShtrikman : HashinShtrikmanBoundsPackage
  voigtReuss : VoigtReussBoundsPackage
  selfConsistent : SelfConsistentSchemePackage
  moriTanaka : MoriTanakaMethodPackage
  boundsConsistent : Prop
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

instance : AdmissibleClass HomogenizationAdmissibleClass where
  object A := A.object
  endpointSatisfied A := A.endpointSatisfied
  remainderRecorded A := A.remainderRecorded
  gateWitness A := A.gateWitness

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse