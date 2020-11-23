package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.{SBiFunctionPorts, UBiFunctionPorts}
import pt.inesctec.modules.functionalUnit.{SInlineApply, TwoInputUnit, UInlineApply}

protected class UDiv(ports: UBiFunctionPorts) extends TwoInputUnit[UBiFunctionPorts](ports) {
  io.outa := io.ina / io.inb
}

protected class SDiv(ports: SBiFunctionPorts) extends TwoInputUnit[SBiFunctionPorts](ports) {
  io.outa := io.ina / io.inb
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