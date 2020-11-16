package modules.functionalUnit

import chisel3._
import modules.FunctionalUnitPorts

abstract class FunctionalUnit(bits: Int) extends Module with FunctionalUnitProperties {
  val ports = FunctionalUnitPorts(bits)
  val io = IO(ports)

  override def getIO(): Bundle = this.io
}
