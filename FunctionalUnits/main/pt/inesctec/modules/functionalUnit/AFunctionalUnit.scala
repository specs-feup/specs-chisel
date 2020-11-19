package pt.inesctec.modules.functionalUnit

import chisel3.Module
import pt.inesctec.modules.functionalUnit.portlist.FunctionPorts

abstract class AFunctionalUnit(ports: FunctionPorts) extends Module {
  val io = IO(ports)
}