package pt.inesctec.modules.functionalUnit

import chisel3.util.MixedVec
import chisel3.{Bundle, Data, Input, Module, Output}
import pt.inesctec.modules.functionalUnit.port.PortDirection
import pt.inesctec.modules.{GPort, PortList}

import scala.collection.mutable.ListBuffer

abstract class AFunctionalUnit(plist: PortList) extends Module with FunctionalUnitProperties {

  private var iolist = ListBuffer[Data]()
  for (p <- plist) {
    p.portDir match {
      case PortDirection.Input => iolist += Input(p.portData)
      case PortDirection.Output => iolist += Output(p.portData)
    }
  }

  val io = IO(new Bundle {
    val ports = MixedVec(iolist.toList)
  }) // wrap in IO for proper Chisel scoping

  override def getNumPorts: Int = this.plist.size

  override def getPortByIndex(idx: Int): GPort = this.plist(idx)

  override def getPortByName(name: String): GPort = this.plist.filter(p => p.portName==name)(0)
}