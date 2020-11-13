import chisel3._

package object modules {

  /*
   * Short-handles
   */
  def Data(bits: Int) = UInt(bits.W)

  def Data8 = UInt(8.W)

  def Data16 = UInt(16.W)

  def Data32 = UInt(32.W)

  def Data64 = UInt(64.W)

  /*
   *
   */
  def FunctionalUnitPorts(bitWidth: Int) = {
    new FunctionalUnitPorts(bitWidth)
  }
}
