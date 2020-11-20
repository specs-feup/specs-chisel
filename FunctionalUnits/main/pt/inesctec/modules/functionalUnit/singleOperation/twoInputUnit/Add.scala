package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import pt.inesctec.modules.functionalUnit.portlist.{SBiFunctionPorts, UBiFunctionPorts}
import pt.inesctec.modules.functionalUnit.{AFunctionalUnit, SInlineApply, UInlineApply}

protected class UAdd(ports: UBiFunctionPorts) extends AFunctionalUnit(ports) {
  val mio = this.io.asInstanceOf[UBiFunctionPorts]
  mio.outa := mio.ina + mio.inb
}

protected class SAdd(ports: SBiFunctionPorts) extends AFunctionalUnit(ports) {
  val mio = this.io.asInstanceOf[SBiFunctionPorts]
  mio.outa := mio.ina + mio.inb
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