package pt.inesctec.muxTest

import chisel3._

/*
Companion object for construction and connection
 */
object Mux {
    def apply(sel: Bool, in0: UInt, in1: UInt) = {
        val m = Module(new Mux(in0.getWidth))
        m.io.a := in0
        m.io.b := in1
        m.io.e := sel
        m.io.c // returns selection
    }
}

private class Mux(bits: Int) extends Module {
    val io = IO(new Bundle {
        val a = Input(UInt(bits.W))
        val b = Input(UInt(bits.W))
        val c = Output(UInt(bits.W))
        val e = Input(Bool())
    })

    when(io.e) {
        io.c := io.b
    }.otherwise {
        io.c := io.a
    }
}
