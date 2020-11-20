package pt.inesctec.modules.functionalUnit.portlist

import chisel3.{Input, Output}
import pt.inesctec.modules.{DataN, SDataN}

class BiFunctionPorts(signed: Boolean, bits: Int) extends FunctionPorts {
  val ina = Input(if(signed) SDataN(bits) else DataN(bits))
  val inb = Input(if(signed) SDataN(bits) else DataN(bits))
  val outa = Output(if(signed) SDataN(bits) else DataN(bits))

  override def cloneType: this.type = new BiFunctionPorts(this.signed, this.bits).asInstanceOf[this.type]

  def this(bits: Int) = {
    this(false, bits)
  }

}
