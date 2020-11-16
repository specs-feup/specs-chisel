package modules.functionalUnit

import chisel3.{Bundle, Module}
import modules.FunctionalUnitPorts

abstract class LambdaUnit(bits: Int, func: (FunctionalUnitPorts) => Unit) extends Module with FunctionalUnitProperties {

  /*

   */
  val ports = FunctionalUnitPorts(bits)
  val io = IO(ports) // wrap in IO for proper Chisel scoping
  this.func(this.io)

  /*

   */
  override def getIO(): Bundle = this.io
}