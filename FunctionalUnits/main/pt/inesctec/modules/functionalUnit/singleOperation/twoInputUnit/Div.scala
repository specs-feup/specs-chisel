package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.{AFunctionalUnit, InlineApply}

protected class Div(ports: BiFunctionPorts) extends AFunctionalUnit(ports) {
  val mio = this.io.asInstanceOf[BiFunctionPorts]
  mio.outa := mio.ina / mio.inb
}

object Div extends InlineApply[Div] {

  // public constructor
  def apply(bits: Int) = {
    new Div(new BiFunctionPorts(bits))
  }

  override def newInstance(bits: Int): Div = Div(32)
}
