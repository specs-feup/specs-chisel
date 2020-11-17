package pt.inesctec.modules.functionalUnit.portlist

import chisel3.{Bundle, Data, Input, Output}
import pt.inesctec.modules.functionalUnit.port.{Port, PortDirection}

import scala.collection.mutable.ListBuffer

/*
private object PortListMethods {

  def ListToBundle(ports : List[Port]): Bundle = {
    var iolist = ListBuffer[Data]()
    for(p <- ports) {
      p.portDir match {
        case PortDirection.Input => iolist += Input(p.portData)
        case PortDirection.Output => iolist += Output(p.portData)
      }
    }
    new Bundle {val _ports = iolist; def ports = this._ports}
  }
}
*/

class PortList(plist: List[Port]) extends PortListProperties {

  private var iolist = ListBuffer[Data]()
  for(p <- plist) {
    p.portDir match {
      case PortDirection.Input => iolist += Input(p.portData)
      case PortDirection.Output => iolist += Output(p.portData)
    }
  }

  val bundle = new Bundle {val ports = iolist.toList}
  val ports = plist

  override def getNumPorts(): Int = this.ports.size

  override def getPortByIndex(idx: Int): Option[Port] = this.ports.lift(idx)

  override def getPortByName(name: String): Option[Port] = this.ports.filter(_.portName == name).lift(0)
}
