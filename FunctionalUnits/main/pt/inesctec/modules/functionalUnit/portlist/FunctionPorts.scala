package pt.inesctec.modules.functionalUnit.portlist

import chisel3.{Bundle, Data}

abstract class FunctionPorts extends Bundle {

  def portlist = this.getElements

  def getNumPorts: Int = portlist.size

  def getPortByIndex(idx: Int): Data = this.portlist(idx)

  def getPortByName(name: String): Data = this.portlist.filter(p => p.toString == name)(0)
}
