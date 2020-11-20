package pt.inesctec.modules

import chisel3.fromIntToLiteral
import pt.inesctec.modules.functionalUnit.AFunctionalUnit
import pt.inesctec.modules.functionalUnit.portlist.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit.UAdd

class MultiAdd extends AFunctionalUnit(new BiFunctionPorts(32)) {
  val mio = this.io.asInstanceOf[BiFunctionPorts]

  // method 1
  /*
  val add1 = Module(Add(32))
  add1.mio.ina := mio.ina
  add1.mio.inb := 2.U
  */

  // method 2
  // NOTE: order is reserved in elements vector thats a
  // part of Bundle class, so "portlist" in FunctionPorts is reversed on return
  /*
  val outport = mio.portlist(2)
  outport := add1.mio.outa + mio.inb
   */

  // method 3
  //mio.elements("outa") := add1.mio.outa + mio.inb
  //mio.outa := add1.mio.outa + mio.inb

  mio.outa := UAdd(mio.ina, 2.U) + mio.inb
}
