package modules

import chisel3._

abstract class FunctionalUnit(bits: Int) extends Module with FunctionalUnitProperties {
  val ports = FunctionalUnitPorts(bits)
  val io = IO(ports)

  override def getName(): String = this.getClass.getSimpleName

  override def getIO(): Bundle = this.io
}
