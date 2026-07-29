import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure EffectiveModuliBoundsPackage where
  voigtReussBounds : Prop
  hashinShtrikmanBounds : Prop
  willisBounds : Prop
  boundsComparison : Prop

structure EffectiveModuliBoundsEvidence (E : EffectiveModuliBoundsPackage) where
  voigtReussBoundsClosed : E.voigtReussBounds
  hashinShtrikmanBoundsClosed : E.hashinShtrikmanBounds
  willisBoundsClosed : E.willisBounds
  boundsComparisonClosed : E.boundsComparison

def EffectiveModuliBoundsClosed (E : EffectiveModuliBoundsPackage) : Prop :=
  E.voigtReussBounds ∧ E.hashinShtrikmanBounds ∧ E.willisBounds ∧ E.boundsComparison

theorem effective_moduli_bounds_closed_from_evidence
    (E : EffectiveModuliBoundsPackage) (Ev : EffectiveModuliBoundsEvidence E) :
    EffectiveModuliBoundsClosed E := by
  exact And.intro Ev.voigtReussBoundsClosed
    (And.intro Ev.hashinShtrikmanBoundsClosed
      (And.intro Ev.willisBoundsClosed Ev.boundsComparisonClosed))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse