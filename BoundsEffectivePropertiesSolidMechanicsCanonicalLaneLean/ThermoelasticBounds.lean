import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean

structure ThermoelasticBoundsPackage where
  thermalExpansionCoeffBounds : Prop
  specificHeatBounds : Prop
  thermalConductivityBounds : Prop
  coupledThermoelasticBounds : Prop

structure ThermoelasticBoundsEvidence (T : ThermoelasticBoundsPackage) where
  thermalExpansionCoeffBoundsClosed : T.thermalExpansionCoeffBounds
  specificHeatBoundsClosed : T.specificHeatBounds
  thermalConductivityBoundsClosed : T.thermalConductivityBounds
  coupledThermoelasticBoundsClosed : T.coupledThermoelasticBounds

def ThermoelasticBoundsClosed (T : ThermoelasticBoundsPackage) : Prop :=
  T.thermalExpansionCoeffBounds ∧ T.specificHeatBounds ∧ T.thermalConductivityBounds ∧ T.coupledThermoelasticBounds

theorem thermoelastic_bounds_closed_from_evidence
    (T : ThermoelasticBoundsPackage) (Ev : ThermoelasticBoundsEvidence T) :
    ThermoelasticBoundsClosed T := by
  exact And.intro Ev.thermalExpansionCoeffBoundsClosed
    (And.intro Ev.specificHeatBoundsClosed
      (And.intro Ev.thermalConductivityBoundsClosed Ev.coupledThermoelasticBoundsClosed))

end BoundsEffectivePropertiesSolidMechanicsCanonicalLaneLean
end HautevilleHouse