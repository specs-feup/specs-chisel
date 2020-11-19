package pt.inesctec.modules.functionalUnit.portlist

import Chisel.{Input, Output}
import pt.inesctec.modules.DataN

class UniFunctionPorts(bits: Int) extends FunctionPorts {
  val ina = Input(DataN(bits))
  val outa = Output(DataN(bits))

  override def cloneType: this.type = new UniFunctionPorts(bits).asInstanceOf[this.type]
}
