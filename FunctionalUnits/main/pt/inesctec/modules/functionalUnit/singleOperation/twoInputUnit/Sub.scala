package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.{FunctionalUnitPorts, InlineApply, LambdaUnit}

class Sub(bits: Int) extends LambdaUnit(bits, (ports: FunctionalUnitPorts) => ports.out := ports.ina - ports.inb)

object Sub extends InlineApply[Sub] {
  override final def newInstance(bits: Int): Sub = new Sub(bits)
}