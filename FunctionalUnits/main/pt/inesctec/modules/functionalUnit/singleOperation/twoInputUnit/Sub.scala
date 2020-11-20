package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.{SBiFunctionPorts, UBiFunctionPorts}
import pt.inesctec.modules.functionalUnit.{AFunctionalUnit, SInlineApply, UInlineApply}

protected class USub(ports: UBiFunctionPorts) extends AFunctionalUnit(ports) {
  io.outa := io.ina - io.inb
}

protected class SSub(ports: SBiFunctionPorts) extends AFunctionalUnit(ports) {
  io.outa := io.ina - io.inb
}

object USub extends UInlineApply[USub] {

  // public constructor
  def apply(bits: Int) = {
    new USub(new UBiFunctionPorts(bits))
  }

  override def newInstance(bits: Int): USub = USub(bits)
}

object SSub extends SInlineApply[SSub] {

  // public constructor
  def apply(bits: Int) = {
    new SSub(new SBiFunctionPorts(bits))
  }

  override def newInstance(bits: Int): SSub = SSub(bits)
}