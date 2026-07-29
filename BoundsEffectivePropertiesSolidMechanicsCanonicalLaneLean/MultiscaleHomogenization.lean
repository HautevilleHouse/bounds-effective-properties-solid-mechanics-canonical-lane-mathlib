import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure MultiscaleHomogenizationPackage where
  representativeVolumeElement : Prop
  asymptoticExpansion : Prop
  cellProblem : Prop
  effectiveTensorComputed : Prop

structure MultiscaleHomogenizationEvidence (M : MultiscaleHomogenizationPackage) where
  representativeVolumeElementClosed : M.representativeVolumeElement
  asymptoticExpansionClosed : M.asymptoticExpansion
  cellProblemClosed : M.cellProblem
  effectiveTensorComputedClosed : M.effectiveTensorComputed

def MultiscaleHomogenizationClosed (M : MultiscaleHomogenizationPackage) : Prop :=
  M.representativeVolumeElement ∧ M.asymptoticExpansion ∧ M.cellProblem ∧ M.effectiveTensorComputed

theorem multiscale_homogenization_closed_from_evidence
    (M : MultiscaleHomogenizationPackage) (Ev : MultiscaleHomogenizationEvidence M) :
    MultiscaleHomogenizationClosed M := by
  exact And.intro Ev.representativeVolumeElementClosed
    (And.intro Ev.asymptoticExpansionClosed
      (And.intro Ev.cellProblemClosed Ev.effectiveTensorComputedClosed))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse