package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.{InlineApply, AFunctionalUnit}

class Sub(bits: Int) extends AFunctionalUnit(bits, (ports: TwoOperandOneResult) => ports.out := ports.ina - ports.inb)

object Sub extends InlineApply[Sub] {
  override final def newInstance(bits: Int): Sub = new Sub(bits)
}