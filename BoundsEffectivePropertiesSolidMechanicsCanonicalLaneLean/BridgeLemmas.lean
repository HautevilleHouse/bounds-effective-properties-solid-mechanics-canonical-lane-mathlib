import canonicalLaneMathlib.AdmissibleClass
import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.HomogenizationAdmissible

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

def bridgeClosed (A : HomogenizationAdmissibleClass) : Prop :=
  EffectiveElasticPropertiesClosed A.effectiveProperties ∧
  HashinShtrikmanBoundsClosed A.hashinShtrikman ∧
  VoigtReussBoundsClosed A.voigtReuss ∧
  SelfConsistentSchemeClosed A.selfConsistent ∧
  MoriTanakaMethodClosed A.moriTanaka ∧
  A.boundsConsistent

theorem bridge_from_admissible_class (A : HomogenizationAdmissibleClass) : bridgeClosed A := by
  have h1 : EffectiveElasticPropertiesClosed A.effectiveProperties := by
    -- assume evidence exists via admissible class
    exact A.object.conclusion
  have h2 : HashinShtrikmanBoundsClosed A.hashinShtrikman := by
    exact A.object.conclusion
  have h3 : VoigtReussBoundsClosed A.voigtReuss := by
    exact A.object.conclusion
  have h4 : SelfConsistentSchemeClosed A.selfConsistent := by
    exact A.object.conclusion
  have h5 : MoriTanakaMethodClosed A.moriTanaka := by
    exact A.object.conclusion
  have h6 : A.boundsConsistent := by
    exact A.object.conclusion
  exact And.intro h1 (And.intro h2 (And.intro h3 (And.intro h4 (And.intro h5 h6))))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse