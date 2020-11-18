package pt.inesctec.modules.functionalUnit.portlist

import pt.inesctec.modules.functionalUnit.port.{Port, PortDirection}
import pt.inesctec.modules.{DataN, PortList}

object PortPreset {

  def UniFunctionPorts(bits: Int): PortList = {
    val ina = new Port("ina", DataN(bits), PortDirection.Input)
    val outa = new Port("outa", DataN(bits), PortDirection.Output)
    //val ina = Input(DataN(bits))
    //val outa = Output(DataN(bits))
    PortList(ina, outa)
  }

  def BiFunctionPorts(bits: Int): PortList = {
    val ina = new Port("ina", DataN(bits), PortDirection.Input)
    val inb = new Port("inb", DataN(bits), PortDirection.Input)
    val outa = new Port("outa", DataN(bits), PortDirection.Output)
    //val ina = Input(DataN(bits))
    //val inb = Input(DataN(bits))
    //val outa = Output(DataN(bits))
    PortList(ina, inb, outa)
  }

  // TODO, others
}
