import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure RepresentativeVolumeElementPackage where
  domain : Type u
  topology : TopologicalSpace domain
  volumeFraction : Prop
  statisticalHomogeneity : Prop
  ergodicAssumption : Prop
  rveSizeConverged : Prop

structure RVEEvidence (R : RepresentativeVolumeElementPackage) where
  volumeFractionClosed : R.volumeFraction
  statisticalHomogeneityClosed : R.statisticalHomogeneity
  ergodicAssumptionClosed : R.ergodicAssumption
  rveSizeConvergedClosed : R.rveSizeConverged

def RVEClosed (R : RepresentativeVolumeElementPackage) : Prop :=
  R.volumeFraction ∧ R.statisticalHomogeneity ∧ R.ergodicAssumption ∧ R.rveSizeConverged

theorem rve_closed_from_evidence (R : RepresentativeVolumeElementPackage) (E : RVEEvidence R) :
    RVEClosed R := by
  exact And.intro E.volumeFractionClosed (And.intro E.statisticalHomogeneityClosed (And.intro E.ergodicAssumptionClosed E.rveSizeConvergedClosed))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse
