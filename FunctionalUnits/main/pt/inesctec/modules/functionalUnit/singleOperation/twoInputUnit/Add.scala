package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.PortPreset.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.{InlineApply, AFunctionalUnit}

class Add(bits: Int) extends AFunctionalUnit(BiFunctionPorts(bits)) {
  val ina = this.getPortByIndex(0)
  val inb = this.getPortByIndex(1)
  val out = this.getPortByIndex(2)
  out := ina + inb
}

object Add extends InlineApply[Add] {
  override final def newInstance(bits: Int): Add = new Add(bits)
}