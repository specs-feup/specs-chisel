package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.PortPreset.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.{AFunctionalUnit, InlineApply}

class Div(bits: Int) extends AFunctionalUnit(BiFunctionPorts(bits)) {
  val ina = this.io.ports(0)
  val inb = this.io.ports(1)
  val out = this.io.ports(2)
  out := ina.asUInt() / inb.asUInt() //  WARNING: requires explict cast here... TODO how to fix?
}

object Div extends InlineApply[Div] {
  override final def newInstance(bits: Int): Div = new Div(bits)
}
