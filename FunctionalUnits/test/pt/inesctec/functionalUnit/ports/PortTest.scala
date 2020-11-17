package pt.inesctec.functionalUnit.ports

import pt.inesctec.modules.functionalUnit.data.{Data16, Data8}
import pt.inesctec.modules.functionalUnit.port.Port

object PortTest extends App {

  val portData1 = Data8()
  val portData2 = Data16()

  val portA = new Port("portA", portData1)
  val portB = new Port("portB", portData2)
}
