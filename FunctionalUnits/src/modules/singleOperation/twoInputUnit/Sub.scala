package modules.singleOperation.twoInputUnit

import modules.functionalUnit.{FunctionalUnitPorts, LambdaUnit}
import modules.singleOperation.InlineApply

class Sub(bits: Int) extends LambdaUnit(bits, (ports: FunctionalUnitPorts) => ports.out := ports.ina - ports.inb)

object Sub extends InlineApply[Sub] {
  override final def newInstance(bits: Int): Sub = new Sub(bits)
}