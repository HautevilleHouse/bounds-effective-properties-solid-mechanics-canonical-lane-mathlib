import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure EffectiveModuliPackage where
  homogenizationMethod : Prop
  representativeVolumeElement : Prop
  effectiveElasticTensor : Prop
  boundsComparison : Prop
  convergenceUnderRefinement : Prop

structure EffectiveModuliEvidence (E : EffectiveModuliPackage) where
  homogenizationMethodClosed : E.homogenizationMethod
  representativeVolumeElementClosed : E.representativeVolumeElement
  effectiveElasticTensorClosed : E.effectiveElasticTensor
  boundsComparisonClosed : E.boundsComparison
  convergenceUnderRefinementClosed : E.convergenceUnderRefinement

def EffectiveModuliClosed (E : EffectiveModuliPackage) : Prop :=
  E.homogenizationMethod ∧ E.representativeVolumeElement ∧ E.effectiveElasticTensor ∧ E.boundsComparison ∧ E.convergenceUnderRefinement

theorem effective_moduli_closed_from_evidence (E : EffectiveModuliPackage) (Ev : EffectiveModuliEvidence E) :
    EffectiveModuliClosed E := by
  exact And.intro Ev.homogenizationMethodClosed
    (And.intro Ev.representativeVolumeElementClosed
      (And.intro Ev.effectiveElasticTensorClosed
        (And.intro Ev.boundsComparisonClosed Ev.convergenceUnderRefinementClosed)))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse