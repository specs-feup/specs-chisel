package pt.inesctec.modules.functionalUnit

import chisel3.{Bundle, Data, Input, Module, Output, UInt}
import pt.inesctec.modules.functionalUnit.port.{Port, PortDirection}
import pt.inesctec.modules.functionalUnit.portlist.PortList

abstract class AFunctionalUnit(plist: PortList) extends Module with FunctionalUnitProperties {

  //val bundle: Bundle = ListToBundle(plist.ports)
  val io = IO(plist.bundle) // wrap in IO for proper Chisel scoping
  //this.func(this.io)

  /*

   */
  override def getPort(idx: Int): Option[UInt] = this.io.getPort(idx)

  /*

   */
  override def getIO(): Bundle = this.io
}