package modules.singleOperation.twoInputUnit

import modules.functionalUnit.{FunctionalUnitPorts, LambdaUnit}
import modules.singleOperation.InlineApply

class Add(bits: Int) extends LambdaUnit(bits, (ports: FunctionalUnitPorts) => ports.out := ports.ina + ports.inb)

object Add extends InlineApply[Add] {
  override final def newInstance(bits: Int): Add = new Add(bits)
}