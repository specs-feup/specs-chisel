package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.FunctionalUnitPorts
import pt.inesctec.modules.functionalUnit.{InlineApply, LambdaUnit}

class Add(bits: Int) extends LambdaUnit(bits, (ports: FunctionalUnitPorts) => ports.out := ports.ina + ports.inb)

object Add extends InlineApply[Add] {
  override final def newInstance(bits: Int): Add = new Add(bits)
}