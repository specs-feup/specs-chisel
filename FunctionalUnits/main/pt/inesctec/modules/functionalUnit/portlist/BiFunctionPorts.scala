package pt.inesctec.modules.functionalUnit.portlist

import chisel3.{Data, Input, Output, SInt, UInt}
import pt.inesctec.modules.{DataN, SDataN}

abstract class BiFunctionPorts[T <: Data](bits: Int) extends FunctionPorts {
  def ina: T
  def inb: T
  def outa: T
}

class UBiFunctionPorts(bits: Int) extends BiFunctionPorts[UInt](bits) {
  val ina = Input(DataN(bits))
  val inb = Input(DataN(bits))
  val outa = Output(DataN(bits))

  override def cloneType: this.type = new UBiFunctionPorts(this.bits).asInstanceOf[this.type]
}

class SBiFunctionPorts(bits: Int) extends BiFunctionPorts[SInt](bits) {
  val ina = Input(SDataN(bits))
  val inb = Input(SDataN(bits))
  val outa = Output(SDataN(bits))

  override def cloneType: this.type = new SBiFunctionPorts(this.bits).asInstanceOf[this.type]
}
