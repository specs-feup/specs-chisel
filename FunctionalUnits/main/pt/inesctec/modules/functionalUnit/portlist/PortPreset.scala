package pt.inesctec.modules.functionalUnit.portlist

import pt.inesctec.modules.functionalUnit.port.{Port, PortDirection}
import pt.inesctec.modules.{Data, PortList}

object PortPreset {

  def UniFunctionPorts(bits: Int): PortList = {
    val ina = new Port("ina", Data(bits), PortDirection.Input)
    val outa = new Port("outa", Data(bits), PortDirection.Output)
    PortList(ina, outa)
  }

  def BiFunctionPorts(bits: Int): PortList = {
    val ina = new Port("ina", Data(bits), PortDirection.Input)
    val inb = new Port("inb", Data(bits), PortDirection.Input)
    val outa = new Port("outa", Data(bits), PortDirection.Output)
    PortList(ina, inb, outa)
  }

  // TODO, others
}
