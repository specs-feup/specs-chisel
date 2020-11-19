package pt.inesctec.modules.functionalUnit.portlist

import chisel3.{Bundle, Data}

abstract class FunctionPorts extends Bundle {

  def portlist = this.getElements.to[collection.mutable.Seq]

  def getNumPorts: Int = this.portlist.size

  def getPortByIndex(idx: Int): Data = this.portlist(idx)

  def getPortByName(name: String): Data = this.elements(name) //this.portlist.filter(p => p.toString == name)(0)
}
