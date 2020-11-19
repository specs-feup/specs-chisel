package pt.inesctec.modules

import Chisel.fromtIntToLiteral
import pt.inesctec.modules.functionalUnit.AFunctionalUnit
import pt.inesctec.modules.functionalUnit.portlist.BiFunctionPorts
import pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit.Add

class MultiAdd extends AFunctionalUnit(new BiFunctionPorts(32)) {
  val mio = this.io.asInstanceOf[BiFunctionPorts]
  mio.outa := Add(Add(mio.ina, 2.U), 2.U)
}
