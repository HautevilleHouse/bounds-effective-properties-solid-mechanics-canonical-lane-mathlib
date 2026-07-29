import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure SolidMechanicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  measure : carrier → ℝ

structure SolidMechanicsAdmittedObject where
  space : SolidMechanicsSpace
  satisfiesBounds : Prop
  effectivePropertyComputed : Prop
  conclusion : satisfiesBounds ∧ effectivePropertyComputed

structure SolidMechanicsEndgameState where
  object : SolidMechanicsAdmittedObject

def BoundsEffectivePropertiesClosed (O : SolidMechanicsAdmittedObject) : Prop :=
  O.satisfiesBounds ∧ O.effectivePropertyComputed

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse
