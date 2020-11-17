package pt.inesctec.modules.functionalUnit.portlist

import chisel3.{Bundle, Input, Output, UInt}
import pt.inesctec.modules.Data

class FunctionalUnitPorts(bits: Int) extends Bundle {
  val ina = Input(Data(bits))
  val inb = Input(Data(bits))
  val out = Output(Data(bits))

  private val portList: List[UInt] = List(this.ina, this.inb, this.out);

  def getPort(idx: Int) = this.portList.lift(idx)

  //??
  //override def cloneType = new FunctionalUnitPorts(bits).asInstanceOf[this.type]
}
