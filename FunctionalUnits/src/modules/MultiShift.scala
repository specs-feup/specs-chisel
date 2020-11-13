package modules

import chisel3.core.fromIntToWidth
import chisel3.{Bundle, Input, Module, Output, UInt, fromIntToLiteral}
import modules.singleOperation.LeftShift

class MultiShift extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(32.W))
    val b = Output(UInt(32.W))
  })

  io.b := singleOperation.LeftShift(LeftShift(io.a, 2.U), 2.U)
}
