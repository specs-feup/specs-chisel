package modules.singleOperation

import chisel3.{Module, UInt}

trait InlineApply[A] {
  def apply(opa: UInt, opb: UInt) = {
    val m = Module(new TwoInputUnit[A](opa.getWidth))
    m.io.ina := opa
    m.io.inb := opb
    m.io.out // returns computation result
  }
}
