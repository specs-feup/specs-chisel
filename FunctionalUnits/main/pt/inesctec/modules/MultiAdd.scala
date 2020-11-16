package pt.inesctec.modules

import chisel3.core.fromIntToWidth
import chisel3.{Bundle, Input, Module, Output, UInt, fromIntToLiteral}
import pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit.Add

class MultiAdd extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(32.W))
    val b = Output(UInt(32.W))
  })

  io.b := Add(Add(io.a, 2.U), 2.U)
}
