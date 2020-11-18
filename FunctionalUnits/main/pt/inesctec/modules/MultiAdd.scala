package pt.inesctec.modules

import Chisel.fromtIntToLiteral
import pt.inesctec.modules.functionalUnit.AFunctionalUnit
import pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit.Add

class MultiAdd extends AFunctionalUnit(List(UInput(32), UOutput(32))) {
  val a = this.getPortByIndex(0)
  val b = this.getPortByIndex(1)
  b := Add(Add(a, UConst(2.U), UConst(2.U)))
}
