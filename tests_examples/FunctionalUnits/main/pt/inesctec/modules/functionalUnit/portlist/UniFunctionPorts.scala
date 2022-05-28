package pt.inesctec.modules.functionalUnit.portlist

import Chisel.{Input, Output}
import chisel3.{Data, SInt, UInt}
import pt.inesctec.modules.{DataN, SDataN}

abstract class UniFunctionPorts[T <: Data](bits: Int) extends FunctionPorts {
  def ina: T

  def outa: T
}

class UUniFunctionPorts(bits: Int) extends UniFunctionPorts[UInt](bits) {
  val ina = Input(DataN(bits))
  val outa = Output(DataN(bits))

  override def cloneType: this.type = new UUniFunctionPorts(bits).asInstanceOf[this.type]
}

class SUniFunctionPorts(bits: Int) extends UniFunctionPorts[SInt](bits) {
  val ina = Input(SDataN(bits))
  val outa = Output(SDataN(bits))

  override def cloneType: this.type = new SUniFunctionPorts(bits).asInstanceOf[this.type]
}
