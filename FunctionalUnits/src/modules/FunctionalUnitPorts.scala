package modules

import chisel3.{Bundle, Input, Output}

class FunctionalUnitPorts(bits: Int) extends Bundle {
  val ina = Input(Data(bits))
  val inb = Input(Data(bits))
  var out = Output(Data(bits))

  override def cloneType = new FunctionalUnitPorts(bits).asInstanceOf[this.type]
}
