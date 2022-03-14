package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.{SBiFunctionPorts, UBiFunctionPorts}
import pt.inesctec.modules.functionalUnit.{SInlineApply, TwoInputUnit, UInlineApply}

protected class UAdd(ports: UBiFunctionPorts) extends TwoInputUnit[UBiFunctionPorts](ports) {
  io.outa := io.ina + io.inb
}

protected class SAdd(ports: SBiFunctionPorts) extends TwoInputUnit[SBiFunctionPorts](ports) {
  io.outa := io.ina + io.inb
}

object UAdd extends UInlineApply[UAdd] {

  // public constructor
  def apply(bits: Int) = {
    new UAdd(new UBiFunctionPorts(bits))
  }

  override def newInstance(bits: Int): UAdd = UAdd(bits)
}

object SAdd extends SInlineApply[SAdd] {

  // public constructor
  def apply(bits: Int) = {
    new SAdd(new SBiFunctionPorts(bits))
  }

  override def newInstance(bits: Int): SAdd = SAdd(bits)
}