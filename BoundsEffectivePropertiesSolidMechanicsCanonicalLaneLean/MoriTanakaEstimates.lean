import BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure MoriTanakaEstimatesPackage where
  inclusionShape : Prop
  diluteConcentration : Prop
  effectiveStiffness : Prop

structure MoriTanakaEstimatesEvidence (M : MoriTanakaEstimatesPackage) where
  inclusionShapeClosed : M.inclusionShape
  diluteConcentrationClosed : M.diluteConcentration
  effectiveStiffnessClosed : M.effectiveStiffness

def MoriTanakaEstimatesClosed (M : MoriTanakaEstimatesPackage) : Prop :=
  M.inclusionShape ∧ M.diluteConcentration ∧ M.effectiveStiffness

theorem mori_tanaka_estimates_closed_from_evidence (M : MoriTanakaEstimatesPackage)
    (Ev : MoriTanakaEstimatesEvidence M) : MoriTanakaEstimatesClosed M := by
  exact And.intro Ev.inclusionShapeClosed (And.intro Ev.diluteConcentrationClosed Ev.effectiveStiffnessClosed)

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse
