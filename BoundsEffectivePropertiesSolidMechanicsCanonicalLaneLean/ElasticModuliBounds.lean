import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure ElasticModuliBounds where
  effectiveBulkModulus : ℝ
  effectiveShearModulus : ℝ
  lowerBoundBulk : ℝ
  upperBoundBulk : ℝ
  lowerBoundShear : ℝ
  upperBoundShear : ℝ

structure ElasticModuliEvidence (E : ElasticModuliBounds) where
  bulkWithinBounds : E.lowerBoundBulk ≤ E.effectiveBulkModulus ∧ E.effectiveBulkModulus ≤ E.upperBoundBulk
  shearWithinBounds : E.lowerBoundShear ≤ E.effectiveShearModulus ∧ E.effectiveShearModulus ≤ E.upperBoundShear
  boundsConsistent : E.lowerBoundBulk ≤ E.upperBoundBulk ∧ E.lowerBoundShear ≤ E.upperBoundShear

def ElasticModuliBoundsClosed (E : ElasticModuliBounds) : Prop :=
  (E.lowerBoundBulk ≤ E.effectiveBulkModulus ∧ E.effectiveBulkModulus ≤ E.upperBoundBulk) ∧
  (E.lowerBoundShear ≤ E.effectiveShearModulus ∧ E.effectiveShearModulus ≤ E.upperBoundShear) ∧
  (E.lowerBoundBulk ≤ E.upperBoundBulk ∧ E.lowerBoundShear ≤ E.upperBoundShear)

theorem elastic_moduli_bounds_closed_from_evidence (E : ElasticModuliBounds) (Ev : ElasticModuliEvidence E) : ElasticModuliBoundsClosed E :=
  by
    exact And.intro Ev.bulkWithinBounds
      (And.intro Ev.shearWithinBounds Ev.boundsConsistent)

end HautevilleHouse.BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse