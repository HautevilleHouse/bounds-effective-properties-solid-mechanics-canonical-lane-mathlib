import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure EffectiveElasticPropertiesPackage where
  stiffnessTensor : Type u
  complianceTensor : Type v
  moduliEstimates : Prop
  boundsSatisfied : Prop
  voigtReussBounds : Prop
  hashinShtrikmanBounds : Prop
  homogenizationConsistent : Prop

structure EffectiveElasticPropertiesEvidence (E : EffectiveElasticPropertiesPackage) where
  moduliEstimatesClosed : E.moduliEstimates
  boundsSatisfiedClosed : E.boundsSatisfied
  voigtReussBoundsClosed : E.voigtReussBounds
  hashinShtrikmanBoundsClosed : E.hashinShtrikmanBounds
  homogenizationConsistentClosed : E.homogenizationConsistent

def EffectiveElasticPropertiesClosed (E : EffectiveElasticPropertiesPackage) : Prop :=
  E.moduliEstimates ∧ E.boundsSatisfied ∧ E.voigtReussBounds ∧ E.hashinShtrikmanBounds ∧ E.homogenizationConsistent

theorem effective_elastic_properties_closed_from_evidence
    (E : EffectiveElasticPropertiesPackage) (Ev : EffectiveElasticPropertiesEvidence E) :
    EffectiveElasticPropertiesClosed E := by
  exact And.intro Ev.moduliEstimatesClosed
    (And.intro Ev.boundsSatisfiedClosed
      (And.intro Ev.voigtReussBoundsClosed
        (And.intro Ev.hashinShtrikmanBoundsClosed Ev.homogenizationConsistentClosed)))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse