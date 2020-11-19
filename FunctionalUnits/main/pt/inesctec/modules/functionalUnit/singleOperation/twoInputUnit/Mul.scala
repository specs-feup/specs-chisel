package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.{AFunctionalUnit, InlineApply}

protected class Mul(ports: BiFunctionPorts) extends AFunctionalUnit(ports) {
  val mio = this.io.asInstanceOf[BiFunctionPorts]
  mio.outa := mio.ina * mio.inb
}

object Mul extends InlineApply[Mul] {

  // public constructor
  def apply(bits: Int) = {
    new Mul(new BiFunctionPorts(bits))
  }

  override def newInstance(bits: Int): Mul = Mul(bits)
}
