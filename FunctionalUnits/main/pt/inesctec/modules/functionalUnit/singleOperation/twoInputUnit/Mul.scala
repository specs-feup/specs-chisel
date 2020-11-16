package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.{FunctionalUnitPorts, InlineApply, LambdaUnit}

class Mul(bits: Int) extends LambdaUnit(bits, (ports: FunctionalUnitPorts) => ports.out := ports.ina - ports.inb)

object Mul extends InlineApply[Mul] {
  override final def newInstance(bits: Int): Mul = new Mul(bits)
}