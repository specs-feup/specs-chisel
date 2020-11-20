package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.{SBiFunctionPorts, UBiFunctionPorts}
import pt.inesctec.modules.functionalUnit.{AFunctionalUnit, SInlineApply, UInlineApply}

protected class UMul(ports: UBiFunctionPorts) extends AFunctionalUnit(ports) {
  val mio = this.io.asInstanceOf[UBiFunctionPorts]
  mio.outa := mio.ina * mio.inb
}

protected class SMul(ports: SBiFunctionPorts) extends AFunctionalUnit(ports) {
  val mio = this.io.asInstanceOf[SBiFunctionPorts]
  mio.outa := mio.ina * mio.inb
}

object UMul extends UInlineApply[UMul] {

  // public constructor
  def apply(bits: Int) = {
    new UMul(new UBiFunctionPorts(bits))
  }

  override def newInstance(bits: Int): UMul = UMul(bits)
}

object SMul extends SInlineApply[SMul] {

  // public constructor
  def apply(bits: Int) = {
    new SMul(new SBiFunctionPorts(bits))
  }

  override def newInstance(bits: Int): SMul = SMul(bits)
}