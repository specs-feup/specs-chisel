package pt.inesctec.modules.functionalUnit

import chisel3.Module
import pt.inesctec.modules.functionalUnit.portlist.FunctionPorts

abstract class AFunctionalUnit[T <: FunctionPorts](ports: T) extends Module {
  val io = IO(ports)
  def getName: String = this.getClass.getSimpleName
}