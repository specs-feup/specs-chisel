package pt.inesctec.genericmux

import Chisel.{MuxCase, when}
import chisel3.core.fromIntToWidth
import chisel3.{Bundle, DontCare, Flipped, Input, Output, RawModule, UInt, Vec, fromBooleanToLiteral, fromIntToLiteral}

class Test extends Bundle {
  val valuein = Input(UInt(32.W))
  //val valueout = Output(UInt(32.W))
}

class MuxIO(nins: Int) extends Bundle {
  val select = Input(UInt(nins.W))
  val inputs = Vec(nins, new Test)
  val output = Flipped(new Test)

  override def cloneType: MuxIO.this.type = new MuxIO(nins).asInstanceOf[this.type]
}

object GenericMux {
  // default mux of 2 UInts
  def apply(nins: Int) = {
    new GenericMux(new MuxIO(nins))
  }
}

protected class GenericMux(muxio: MuxIO) extends RawModule {
  val io = IO(muxio)
  //val arraySel = (io.inputs.indices map { i => io.select(i) -> io.inputs(i) })
  //io.output := MuxCase(0.U.asTypeOf(io.output), arraySel)

  for (i <- io.inputs.indices) {
    when(io.select(i) === true.B) {
      io.output <> io.inputs(i)

    }.elsewhen(io.select.asUInt().orR === false.B) {
      io.output := 0.U.asTypeOf(io.output)
      io.output <> DontCare
    }
  }
}

class UIntMux(nins: Int) extends RawModule {
  val io = IO(new Bundle {
    val select = Input(UInt(nins.W))
    val inputs = Input(Vec(nins, UInt(32.W)))
    val output = Output(UInt(32.W))
  })
  val arraySel = (io.inputs.indices map { i => io.select(i) -> io.inputs(i) })
  io.output := MuxCase(0.U.asTypeOf(io.output), arraySel)
}

/*
protected class GenericMux[T <: Bundle](out : T, ins : Seq[T]) extends Module {
  val io = IO(new Bundle {
    val select = Input(Bits(ins.size.W))
    val inputs = Vec(ins)
    val output = out
  })

  var i = 0;
  for (i <- 0 to io.inputs.size) {
    when(io.select(i)) {
      io.output <> io.inputs(i)
    }.elsewhen(io.select.asUInt().orR) {
      io.output <> 0.U
    }
  }
}
*/