package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.{SBiFunctionPorts, UBiFunctionPorts}
import pt.inesctec.modules.functionalUnit.{SInlineApply, TwoInputUnit, UInlineApply}

protected class UMul(ports: UBiFunctionPorts) extends TwoInputUnit[UBiFunctionPorts](ports) {
  io.outa := io.ina * io.inb
}

protected class SMul(ports: SBiFunctionPorts) extends TwoInputUnit[SBiFunctionPorts](ports) {
  io.outa := io.ina * io.inb
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