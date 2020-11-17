package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.{InlineApply, AFunctionalUnit}

class Mul(bits: Int) extends AFunctionalUnit(bits, (ports: TwoOperandOneResult) => ports.out := ports.ina - ports.inb)

object Mul extends InlineApply[Mul] {
  override final def newInstance(bits: Int): Mul = new Mul(bits)
}