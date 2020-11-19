package pt.inesctec.modules.functionalUnit.portlist

import Chisel.{Input, Output}
import pt.inesctec.modules.DataN

class BiFunctionPorts(bits: Int) extends FunctionPorts {
  val ina = Input(DataN(bits))
  val inb = Input(DataN(bits))
  val outa = Output(DataN(bits))

  override def cloneType: this.type = new BiFunctionPorts(bits).asInstanceOf[this.type]
}
