package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.PortPreset.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.{InlineApply, AFunctionalUnit}

class Add(bits: Int) extends AFunctionalUnit(BiFunctionPorts(bits)) {

}
//, plist => plist.ports(2) := plist.ports(1) + plist.ports(0))

object Add extends InlineApply[Add] {
  override final def newInstance(bits: Int): Add = new Add(bits)
}