package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import chisel3.Data
import pt.inesctec.modules.functionalUnit.portlist.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.{AFunctionalUnit, InlineApply}

protected class Sub(bits: Int) extends AFunctionalUnit(new BiFunctionPorts(bits)) {
  val mio = this.io.asInstanceOf[BiFunctionPorts]
  mio.outa := mio.ina - mio.inb
}

object Sub extends InlineApply[Sub] {

  // public constructor
  def apply(bits: Int) = {
    new Sub(bits)
  }

  def apply(operands: Data*) = super.apply(operands).asUInt()

  override def newInstance(bits: Int): Sub = Sub(bits)
}
