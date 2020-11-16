package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.{FunctionalUnitPorts, InlineApply, LambdaUnit}

class Div(bits: Int) extends LambdaUnit(bits, (ports: FunctionalUnitPorts) => ports.out := ports.ina + ports.inb)

object Div extends InlineApply[Div] {
  override final def newInstance(bits: Int): Div = new Div(bits)
}
