package pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit

import chisel3.Data
import pt.inesctec.modules.functionalUnit.portlist.{BiFunctionPorts, FunctionPorts}
import pt.inesctec.modules.functionalUnit.{AFunctionalUnit, UInlineApply}

protected class Add(ports: BiFunctionPorts) extends AFunctionalUnit(ports) {
  val mio = this.io.asInstanceOf[BiFunctionPorts]
  mio.outa := mio.ina + mio.inb
}

object UAdd extends UInlineApply[Add] {

  // public constructor
  def apply(bits: Int) = {
    new Add(new BiFunctionPorts(false, bits))
  }

  override def newInstance(bits: Int): Add = UAdd(bits)
}

object SAdd extends UInlineApply[Add] {

  // public constructor
  def apply(bits: Int) = {
    new Add(new BiFunctionPorts(true, bits))
  }

  override def newInstance(bits: Int): Add = SAdd(bits)
}