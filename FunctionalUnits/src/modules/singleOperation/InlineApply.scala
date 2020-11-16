package modules.singleOperation

import chisel3.{Module, UInt}
import modules.functionalUnit.LambdaUnit

trait InlineApply[T <: LambdaUnit] {

  def newInstance(bits: Int): T;

  final def apply(opa: UInt, opb: UInt) = {
    val m = Module(newInstance(opa.getWidth))
    m.io.ina := opa
    m.io.inb := opb
    m.io.out // returns computation result
  }
}

/*
trait InlineApply[T <: LambdaUnit] {
  def apply(m: T, opa: UInt, opb: UInt): UInt;
}
*/

