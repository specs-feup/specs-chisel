package pt.inesctec

import chisel3._
import pt.inesctec.modules.functionalUnit.port.Port

package object modules {

  /*

   */
  type GPort = Port[_ <: Data]
  type PortList = List[GPort]
  def PortList(ports : GPort*) = List[GPort](ports: _*)
  //def PortList(list : List[Data]) = list

  /*
   * Short-handles
   */
  def Data(bits: Int) = UInt(bits.W)

  def Data8 = UInt(8.W)

  def Data16 = UInt(16.W)

  def Data32 = UInt(32.W)

  def Data64 = UInt(64.W)
}
