package pt.inesctec.modules.functionalUnit

import chisel3.util.MixedVec
import chisel3.{Bundle, Input, Module, Output, UInt}
import pt.inesctec.modules.functionalUnit.port.PortDirection
import pt.inesctec.modules.functionalUnit.portlist.PortList

import scala.collection.mutable.ListBuffer

abstract class AFunctionalUnit(plist: PortList) extends Module {

  private var iolist = ListBuffer[UInt]()
  for(p <- plist.ports) {
    p.portDir match {
      case PortDirection.Input => iolist += Input(p.portData)
      case PortDirection.Output => iolist += Output(p.portData)
    }
  }

  val io = IO(new Bundle {val ports = MixedVec(iolist.toList)}) // wrap in IO for proper Chisel scoping

  /*

   */
  override def getPortList: PortList = this.plist
}