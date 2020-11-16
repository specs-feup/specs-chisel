package pt.inesctec.modules.functionalUnit

import chisel3._
import pt.inesctec.modules.FunctionalUnitPorts

abstract class FunctionalUnit(bits: Int) extends Module with FunctionalUnitProperties {
  val ports = FunctionalUnitPorts(bits)
  val io = IO(ports)

  override def getPort(idx: Int): Option[UInt] = this.io.getPort(idx)

  override def getIO(): Bundle = this.io
}
