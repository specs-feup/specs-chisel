package pt.inesctec

import chisel3._

package object modules {

  /*
   * Short-handles
   */
  def DataN(bits: Int) = UInt(bits.W)

  def Data8 = UInt(8.W)

  def Data16 = UInt(16.W)

  def Data32 = UInt(32.W)

  def Data64 = UInt(64.W)

  def SDataN(bits: Int) = SInt(bits.W)

  def SData8 = SInt(8.W)

  def SData16 = SInt(16.W)

  def SData32 = SInt(32.W)

  def SData64 = SInt(64.W)
}
