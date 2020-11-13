package modules.singleOperation

import chisel3.{Module, UInt}

/*
Companion object for construction and connection
 */
object Add {
  def apply(value: UInt, shiftBy: UInt) = {
    val m = Module(new Add(value.getWidth))
    m.io.ina := value
    m.io.inb := shiftBy
    m.io.out // returns computation result
  }
}

class Add(bits: Int) extends TwoInputUnit(bits) {
  io.out := io.ina + io.inb
}
