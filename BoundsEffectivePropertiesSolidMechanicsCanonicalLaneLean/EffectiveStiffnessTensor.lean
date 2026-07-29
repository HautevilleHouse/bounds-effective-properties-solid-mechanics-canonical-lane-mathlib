import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.HashinShtrikmanBounds

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure EffectiveStiffnessTensorPackage (H : HashinShtrikmanBoundsPackage) where
  microstructureGeometry : Prop
  isotropyAssumption : Prop
  stiffnessTensorComputed : ℝ × ℝ × ℝ × ℝ
  bulkModulusInBounds : H.bulkModulusLowerBound ≤ stiffnessTensorComputed.1 ∧ stiffnessTensorComputed.1 ≤ H.bulkModulusUpperBound
  shearModulusInBounds : H.shearModulusLowerBound ≤ stiffnessTensorComputed.2 ∧ stiffnessTensorComputed.2 ≤ H.shearModulusUpperBound

structure EffectiveStiffnessTensorEvidence (H : HashinShtrikmanBoundsPackage) (E : EffectiveStiffnessTensorPackage H) where
  microstructureGeometryClosed : E.microstructureGeometry
  isotropyAssumptionClosed : E.isotropyAssumption
  stiffnessTensorComputedClosed : E.stiffnessTensorComputed = E.stiffnessTensorComputed
  bulkModulusInBoundsClosed : E.bulkModulusInBounds
  shearModulusInBoundsClosed : E.shearModulusInBounds

def EffectiveStiffnessTensorClosed (H : HashinShtrikmanBoundsPackage) (E : EffectiveStiffnessTensorPackage H) : Prop :=
  E.microstructureGeometry ∧ E.isotropyAssumption ∧ E.bulkModulusInBounds ∧ E.shearModulusInBounds

theorem effective_stiffness_tensor_closed_from_evidence (H : HashinShtrikmanBoundsPackage) (E : EffectiveStiffnessTensorPackage H) (Ev : EffectiveStiffnessTensorEvidence H E) : EffectiveStiffnessTensorClosed H E := by
  exact And.intro Ev.microstructureGeometryClosed (And.intro Ev.isotropyAssumptionClosed (And.intro Ev.bulkModulusInBoundsClosed Ev.shearModulusInBoundsClosed))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse
