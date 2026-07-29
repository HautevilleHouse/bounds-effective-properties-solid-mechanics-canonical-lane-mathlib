import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure EffectiveElasticModuliPackage where
  bulkModulus : Prop
  shearModulus : Prop
  youngModulus : Prop
  poissonRatio : Prop

structure EffectiveElasticModuliEvidence (E : EffectiveElasticModuliPackage) where
  bulkModulusClosed : E.bulkModulus
  shearModulusClosed : E.shearModulus
  youngModulusClosed : E.youngModulus
  poissonRatioClosed : E.poissonRatio

def EffectiveElasticModuliClosed (E : EffectiveElasticModuliPackage) : Prop :=
  E.bulkModulus ∧ E.shearModulus ∧ E.youngModulus ∧ E.poissonRatio

theorem effective_elastic_moduli_closed_from_evidence (E : EffectiveElasticModuliPackage)
    (Ev : EffectiveElasticModuliEvidence E) : EffectiveElasticModuliClosed E := by
  exact And.intro Ev.bulkModulusClosed (And.intro Ev.shearModulusClosed
    (And.intro Ev.youngModulusClosed Ev.poissonRatioClosed))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse
