package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.{SBiFunctionPorts, UBiFunctionPorts}
import pt.inesctec.modules.functionalUnit.{AFunctionalUnit, SInlineApply, UInlineApply}

protected class UDiv(ports: UBiFunctionPorts) extends AFunctionalUnit(ports) {
  val mio = this.io.asInstanceOf[UBiFunctionPorts]
  mio.outa := mio.ina / mio.inb
}

protected class SDiv(ports: SBiFunctionPorts) extends AFunctionalUnit(ports) {
  val mio = this.io.asInstanceOf[SBiFunctionPorts]
  mio.outa := mio.ina / mio.inb
}

object UDiv extends UInlineApply[UDiv] {

  // public constructor
  def apply(bits: Int) = {
    new UDiv(new UBiFunctionPorts(bits))
  }

  override def newInstance(bits: Int): UDiv = UDiv(bits)
}

object SDiv extends SInlineApply[SDiv] {

  // public constructor
  def apply(bits: Int) = {
    new SDiv(new SBiFunctionPorts(bits))
  }

  override def newInstance(bits: Int): SDiv = SDiv(bits)
}