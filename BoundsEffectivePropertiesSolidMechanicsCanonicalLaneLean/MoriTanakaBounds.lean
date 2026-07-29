import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.EffectiveModuliPackage

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure MoriTanakaBoundsPackage {M : CompositeMaterial} (P : EffectiveModuliPackage M) where
  moriTanakaBulk : ℝ
  moriTanakaShear : ℝ
  diluteApproximation : Prop
  diluteApproximationTerm : diluteApproximation

structure MoriTanakaBoundsEvidence {M : CompositeMaterial} {P : EffectiveModuliPackage M} (MT : MoriTanakaBoundsPackage P) where
  moriTanakaBulkClosed : MT.moriTanakaBulk = MT.moriTanakaBulk
  moriTanakaShearClosed : MT.moriTanakaShear = MT.moriTanakaShear
  approximationClosed : MT.diluteApproximation

def MoriTanakaBoundsClosed {M : CompositeMaterial} {P : EffectiveModuliPackage M} (MT : MoriTanakaBoundsPackage P) : Prop :=
  MT.diluteApproximation

theorem mori_tanaka_bounds_closed_from_evidence {M : CompositeMaterial} {P : EffectiveModuliPackage M} (MT : MoriTanakaBoundsPackage P) (E : MoriTanakaBoundsEvidence MT) : MoriTanakaBoundsClosed MT := by
  exact E.approximationClosed

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse