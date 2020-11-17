package pt.inesctec.modules.functionalUnit

import chisel3.{Bundle, Module, UInt}
import pt.inesctec.modules.FunctionalUnitPorts
import pt.inesctec.modules.functionalUnit.portlist.FunctionalUnitPorts

abstract class LambdaUnit(bits: Int, func: (FunctionalUnitPorts) => Unit) extends Module with FunctionalUnitProperties {

  /*

   */
  val ports = FunctionalUnitPorts(bits)
  val io = IO(ports) // wrap in IO for proper Chisel scoping
  this.func(this.io)

  /*

   */
  override def getPort(idx: Int): Option[UInt] = this.io.getPort(idx)

  /*

   */
  override def getIO(): Bundle = this.io
}