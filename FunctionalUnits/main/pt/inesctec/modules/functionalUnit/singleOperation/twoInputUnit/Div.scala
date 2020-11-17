package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.{InlineApply, AFunctionalUnit}

class Div(bits: Int) extends AFunctionalUnit(bits, (ports: TwoOperandOneResult) => ports.out := ports.ina + ports.inb)

object Div extends InlineApply[Div] {
  override final def newInstance(bits: Int): Div = new Div(bits)
}
