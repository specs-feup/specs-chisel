package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.{AFunctionalUnit, InlineApply}

protected class Add(ports: BiFunctionPorts) extends AFunctionalUnit(ports) {
  //val mio = this.io.asInstanceOf[BiFunctionPorts]
  //mio.outa := mio.ina + mio.inb
}

object Add extends InlineApply[Add] {

  // public constructor
  def apply(bits: Int) = {
    new Add(new BiFunctionPorts(bits))
  }

  override def newInstance(bits: Int): Add = Add(32)
}
