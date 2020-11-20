package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import chisel3.Data
import pt.inesctec.modules.functionalUnit.portlist.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.{AFunctionalUnit, InlineApply}

class Add(bits: Int) extends AFunctionalUnit(new BiFunctionPorts(bits)) {
  val mio = this.io.asInstanceOf[BiFunctionPorts]
  mio.outa := mio.ina + mio.inb
}

object Add extends InlineApply[Add] {

  // public constructor
  def apply(bits: Int) = {
    new Add(bits)
  }

  def apply(operands: Data*) = super.apply(operands).asUInt()

  override def newInstance(bits: Int): Add = Add(bits)
}
