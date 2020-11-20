package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.{AFunctionalUnit, InlineApply}

protected class Mul(bits: Int) extends AFunctionalUnit(new BiFunctionPorts(bits)) {
  val mio = this.io.asInstanceOf[BiFunctionPorts]
  mio.outa := mio.ina * mio.inb
}

object Mul extends InlineApply[Mul] {

  // public constructor
  def apply(bits: Int) = {
    new Mul(bits)
  }

  override def newInstance(bits: Int): Mul = Mul(bits)
}
