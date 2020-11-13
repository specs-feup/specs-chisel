package modules.singleOperation

import chisel3.util.log2Up
import chisel3.{Module, UInt}

/*
Companion object for construction and connection
 */
object LeftShift {
  def apply(value: UInt, shiftBy: UInt) = {
    val m = Module(new LeftShift(value.getWidth))
    m.io.ina := value
    m.io.inb := shiftBy
    m.io.out // returns computation result
  }
}

class LeftShift(bits: Int) extends TwoInputUnit(bits) {
  io.out := io.ina << io.inb(log2Up(io.ina.getWidth), 0)
}
