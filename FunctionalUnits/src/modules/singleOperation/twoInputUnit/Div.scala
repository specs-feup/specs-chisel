package modules.singleOperation.twoInputUnit

import modules.functionalUnit.{FunctionalUnitPorts, LambdaUnit}
import modules.singleOperation.InlineApply

class Div(bits: Int) extends LambdaUnit(bits, (ports: FunctionalUnitPorts) => ports.out := ports.ina + ports.inb)

object Div extends InlineApply[Div] {
  override final def newInstance(bits: Int): Div = new Div(bits)
}
