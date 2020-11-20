package pt.inesctec.modules.functionalUnit.portlist

import chisel3.{Bundle, Data}

abstract class FunctionPorts extends Bundle {

  def portlist = this.getElements.reverse.to[collection.mutable.Seq]
  // reverse since things declared in bundles are stored in reverse?

  def getNumPorts: Int = this.portlist.size

  def getPortByIndex(idx: Int): Data = this.portlist(idx)

  def getPortByName(name: String): Data = this.elements(name) //this.portlist.filter(p => p.toString == name)(0)
}
