package pt.inesctec.modules.functionalUnit.portlist

import pt.inesctec.modules.Data
import pt.inesctec.modules.functionalUnit.port.{Port, PortDirection}

object PortPreset {

  def UniFunctionPorts(bits: Int) = {
    val ina = new Port("ina", Data(bits), PortDirection.Input)
    val outa = new Port("outa", Data(bits), PortDirection.Output)
    new PortList(List(ina, outa))
  }

  def BiFunctionPorts(bits: Int) = {
    val ina = new Port("ina", Data(bits), PortDirection.Input)
    val inb = new Port("inb", Data(bits), PortDirection.Input)
    val outa = new Port("outa", Data(bits), PortDirection.Output)
    new PortList(List(ina, inb, outa))
  }

  // TODO, others
}
