package pt.inesctec.modules

import Chisel.fromtIntToLiteral
import chisel3.Module
import pt.inesctec.modules.functionalUnit.AFunctionalUnit
import pt.inesctec.modules.functionalUnit.portlist.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit.Add

class MultiAdd extends AFunctionalUnit(new BiFunctionPorts(32)) {
  val mio = this.io.asInstanceOf[BiFunctionPorts]

  val add1 = Module(Add(32))
  add1.mio.ina := mio.ina
  add1.mio.inb := 2.U

  val outport = mio.portlist(0)   // TODO: order is not preserved in the elements vector!
  outport := add1.mio.outa + mio.inb
  //mio.elements("outa") := add1.mio.outa + mio.inb
  //mio.outa := add1.mio.outa + mio.inb

  //mio.outa := Add(mio.ina, 2.U) //+ mio.inb
}
