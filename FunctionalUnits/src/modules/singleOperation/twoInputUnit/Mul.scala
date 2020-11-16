package modules.singleOperation.twoInputUnit

import modules.functionalUnit.{FunctionalUnitPorts, LambdaUnit}
import modules.singleOperation.InlineApply

class Mul(bits: Int) extends LambdaUnit(bits, (ports: FunctionalUnitPorts) => ports.out := ports.ina - ports.inb)

object Mul extends InlineApply[Mul] {
  override final def newInstance(bits: Int): Mul = new Mul(bits)
}