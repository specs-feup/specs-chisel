package modules

import chisel3._

abstract class FunctionalUnit(bitWidth : Int) extends Module with FunctionalUnitProperties {
    val io = IO(new Bundle {
        val ina = Input(UInt(bitWidth.W))
        val inb = Input(UInt(bitWidth.W))
        var out = Output(UInt(bitWidth.W))
    })
}
