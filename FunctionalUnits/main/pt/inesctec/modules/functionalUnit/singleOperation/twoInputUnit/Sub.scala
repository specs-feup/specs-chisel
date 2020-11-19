package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.{AFunctionalUnit, InlineApply}

protected class Sub(ports: BiFunctionPorts) extends AFunctionalUnit(ports) {
  val mio = this.io.asInstanceOf[BiFunctionPorts]
  mio.outa := mio.ina - mio.inb
}

object Sub extends InlineApply[Sub] {

  // public constructor
  def apply(bits: Int) = {
    new Sub(new BiFunctionPorts(bits))
  }

  override def newInstance(bits: Int): Sub = Sub(32)
}
