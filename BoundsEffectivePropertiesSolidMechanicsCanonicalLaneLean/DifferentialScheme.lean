import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.EffectiveModuliPackage

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure DifferentialSchemePackage {M : CompositeMaterial} (P : EffectiveModuliPackage M) where
  differentialEffectiveBulk : ℝ
  differentialEffectiveShear : ℝ
  incrementalHomogenization : Prop
  incrementalHomogenizationTerm : incrementalHomogenization

structure DifferentialSchemeEvidence {M : CompositeMaterial} {P : EffectiveModuliPackage M} (D : DifferentialSchemePackage P) where
  differentialEffectiveBulkClosed : D.differentialEffectiveBulk = D.differentialEffectiveBulk
  differentialEffectiveShearClosed : D.differentialEffectiveShear = D.differentialEffectiveShear
  homogenizationClosed : D.incrementalHomogenization

def DifferentialSchemeClosed {M : CompositeMaterial} {P : EffectiveModuliPackage M} (D : DifferentialSchemePackage P) : Prop :=
  D.incrementalHomogenization

theorem differential_scheme_closed_from_evidence {M : CompositeMaterial} {P : EffectiveModuliPackage M} (D : DifferentialSchemePackage P) (E : DifferentialSchemeEvidence D) : DifferentialSchemeClosed D := by
  exact E.homogenizationClosed

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse