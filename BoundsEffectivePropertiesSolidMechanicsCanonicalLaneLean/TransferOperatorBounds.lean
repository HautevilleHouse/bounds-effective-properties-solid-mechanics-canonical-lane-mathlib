import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure TransferOperatorBoundsPackage where
  transferKernel : Prop
  operatorNorm : Prop
  spectralRadius : Prop
  convergenceRate : Prop
  stabilityCondition : Prop

structure TransferOperatorBoundsEvidence (T : TransferOperatorBoundsPackage) where
  transferKernelClosed : T.transferKernel
  operatorNormClosed : T.operatorNorm
  spectralRadiusClosed : T.spectralRadius
  convergenceRateClosed : T.convergenceRate
  stabilityConditionClosed : T.stabilityCondition

def TransferOperatorBoundsClosed (T : TransferOperatorBoundsPackage) : Prop :=
  T.transferKernel ∧ T.operatorNorm ∧ T.spectralRadius ∧ T.convergenceRate ∧ T.stabilityCondition

theorem transfer_operator_bounds_closed_from_evidence (T : TransferOperatorBoundsPackage) (E : TransferOperatorBoundsEvidence T) :
    TransferOperatorBoundsClosed T := by
  exact And.intro E.transferKernelClosed
    (And.intro E.operatorNormClosed
      (And.intro E.spectralRadiusClosed
        (And.intro E.convergenceRateClosed E.stabilityConditionClosed)))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse