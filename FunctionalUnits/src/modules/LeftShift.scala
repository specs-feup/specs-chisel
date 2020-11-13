package modules

import chisel3.core.fromIntToWidth
import chisel3.util.log2Up
import chisel3.{Bundle, Input, Module, Output, UInt, fromIntToLiteral}

/*
Companion object for construction and connection
 */
object LeftShift {
    def apply(value: UInt, shiftBy: UInt) = {
        val m = Module(new LeftShift(FunctionalUnitPorts(value.getWidth)))
        m.io.ina := value
        m.io.inb := shiftBy
        m.io.out // returns computation result
    }
}

class LeftShift(ports: FunctionalUnitPorts) extends FunctionalUnit(ports) {
    val z1 = io.ina << io.inb(log2Up(io.ina.getWidth), 0)
    io.out := z1

    def this(bits: Int) {
        this(FunctionalUnitPorts(bits))
    }
}

class MultiShift extends Module {
    val io = IO(new Bundle {
        val a = Input(UInt(32.W))
        val b = Output(UInt(32.W))
    })

    io.b := LeftShift(LeftShift(io.a, 2.U), 2.U)
}
