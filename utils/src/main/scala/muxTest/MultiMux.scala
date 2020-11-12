package muxTest

import chisel3.core.Module
import chisel3.{Bundle, Input, Output, UInt, fromIntToWidth}

class MultiMux(bits: Int) extends Module {
    val io = IO(new Bundle {
        val a = Input(UInt(bits.W))
        val b = Input(UInt(bits.W))
        val c = Input(UInt(bits.W))
        val d = Input(UInt(bits.W))

        val e = Output(UInt(bits.W))
        val f = Input(UInt(2.W))
    })

    this.io.e := Mux(this.io.f(1),
        Mux(this.io.f(0), this.io.a, this.io.b),
        Mux(this.io.f(0), this.io.c, this.io.d))
}
