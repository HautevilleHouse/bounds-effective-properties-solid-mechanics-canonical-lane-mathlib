import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure InclusionModel where
  shape : String
  aspectRatio : ℝ
  orientationDistribution : Prop

structure MicrostructurePackage where
  inclusionModel : InclusionModel
  matrixMaterial : Prop
  volumeFraction : ℝ
  spatialDistribution : Prop
  interfaceProperties : Prop

structure MicrostructureEvidence (M : MicrostructurePackage) where
  inclusionModelClosed : M.inclusionModel.shape ≠ ""
  matrixMaterialClosed : M.matrixMaterial
  volumeFractionClosed : M.volumeFraction ≥ 0 ∧ M.volumeFraction ≤ 1
  spatialDistributionClosed : M.spatialDistribution
  interfacePropertiesClosed : M.interfaceProperties

def MicrostructureClosed (M : MicrostructurePackage) : Prop :=
  M.inclusionModel.shape ≠ "" ∧ M.matrixMaterial ∧ (M.volumeFraction ≥ 0 ∧ M.volumeFraction ≤ 1) ∧ M.spatialDistribution ∧ M.interfaceProperties

theorem microstructure_closed_from_evidence (M : MicrostructurePackage) (E : MicrostructureEvidence M) : MicrostructureClosed M :=
  by
    exact And.intro E.inclusionModelClosed
      (And.intro E.matrixMaterialClosed
        (And.intro E.volumeFractionClosed
          (And.intro E.spatialDistributionClosed E.interfacePropertiesClosed)))

end HautevilleHouse.BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse