package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.PortPreset.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.{InlineApply, AFunctionalUnit}

class Add(bits: Int) extends AFunctionalUnit(BiFunctionPorts(bits)) {
  val ina = this.io.ports(0)
  val inb = this.io.ports(1)
  val out = this.io.ports(2)
  out := ina.asUInt() + inb.asUInt() //  WARNING: requires explict cast here... TODO how to fix?
}
//, plist => plist.ports(2) := plist.ports(1) + plist.ports(0))

object Add extends InlineApply[Add] {
  override final def newInstance(bits: Int): Add = new Add(bits)
}