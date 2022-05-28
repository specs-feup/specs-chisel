package pt.inesctec.genericmux

import Chisel.{Cat, Mux1H, MuxCase}
import chisel3.core.fromIntToWidth
import chisel3.{Bundle, Flipped, Input, Output, RawModule, UInt, Vec, fromBooleanToLiteral, fromIntToLiteral, when}

class Test extends Bundle {
  val valuein = Input(UInt(8.W))
  val valueout = Output(UInt(8.W))
}

class MuxIO(nins: Int) extends Bundle {
  val select = Input(UInt(nins.W))
  val inputs = Vec(nins, new Test)
  val output = Flipped(new Test)

  override def cloneType: MuxIO.this.type = new MuxIO(nins).asInstanceOf[this.type]
}

class CrossbarIO(nins: Int, nouts: Int) extends Bundle {
  val select = Input(UInt((nins * nouts).W))
  val inputs = Vec(nins, new Test)
  val output = Flipped(Vec(nouts, new Test))

  override def cloneType: CrossbarIO.this.type = new CrossbarIO(nins, nouts).asInstanceOf[this.type]
}

object GenericCrossBar {
  // default mux of 2 UInts
  def apply(nins: Int) = {
    new GenericCrossBar(new CrossbarIO(nins, 2))
  }
}

protected class GenericCrossBar(crossio: CrossbarIO) extends RawModule {
  val io = IO(crossio)

  for (i <- io.output.indices) {

    val outsel = io.select(io.inputs.size * (i + 1) - 1, io.inputs.size * i)
    var insel =  io.select(i).asUInt()
    for (j <- 1 until io.output.size)
      insel = Cat(insel, io.select(i + (io.inputs.size * j) - 1))

    // no input selected for output
    when(outsel.orR() === false.B) {
      io.output(i) <> 0.U.asTypeOf(io.output(i))
    }


    for (j <- io.inputs.indices) {
      when(io.select((i * io.inputs.size) + j) === true.B) {
        io.output(i) <> io.inputs(j)
      }
    }
  }
    /*
    // reverse selection
    var bitsel = io.select(i).asUInt()
    for (j <- 1 until io.output.size)
      bitsel = Cat(bitsel, io.select(i + (io.inputs.size * j) - 1))

    when(bitsel.orR() === true.B) {
      io.inputs(i) <> Mux1H(bitsel.asBools() zip io.output)
    }
  }  */

  /*
  for (i <- io.output.indices) {
    val bitrange = io.select(io.inputs.size * (i + 1) - 1, io.inputs.size * i)
    io.output(i) <> Mux1H(bitrange.asBools() zip io.inputs)
  }*/

  /*
    for (i <- io.output.indices) {
      val bitrange = io.select(io.inputs.size * (i + 1) - 1, io.inputs.size * i).asBools()
      io.output(i) <> Mux1H(bitrange zip io.inputs)
    }

    for (i <- io.inputs.indices) {
      var bitsel = io.select(i).asUInt()
      for (j <- 1 until io.output.size)
        bitsel = Cat(bitsel, io.select(i + (io.inputs.size * j) - 1))
      io.inputs(i) <> Mux1H(bitsel.asBools() zip io.output)
    }
    // NOTE: doesnt work... the last io.inputs(i) is the only one that takes effects
    // and generates hardware; this is functional programming, meaning the description is generated
    // based on the evaluation of the sequential code (i.e., previous assigns to io.output are discarded
    // one I do io.inputs(i) <> i.output
  */

  /*
  for (i <- io.output.indices) {
    val mux = Module(GenericMux(io.inputs.size))
    mux.io.inputs <> io.inputs
    mux.io.select := io.select(io.inputs.size * (i + 1) - 1, io.inputs.size * i)
    io.output(i) <> mux.io.output
  }

  for (i <- io.inputs.indices) {
    val mux = Module(GenericMux(io.output.size))
    mux.io.inputs <> Flipped(io.output)
    var bitsel = io.select(i).asUInt()
    for(i <- io.output.indices)
      bitsel = Cat(bitsel, io.select((i + 1) * io.inputs.size))
    mux.io.select := bitsel
    io.inputs(i) <> mux.io.output
  }*/
}

object GenericMux {
  // default mux of 2 UInts
  def apply(nins: Int) = {
    new GenericMux(new MuxIO(nins))
  }
}

protected class GenericMux(muxio: MuxIO) extends RawModule {
  val io = IO(muxio)

  //This works!
  for (i <- io.inputs.indices) {
    io.inputs(i) <> Mux1H(Seq((io.select.asBools()(i), io.output)))
  }
  io.output <> Mux1H(io.select.asBools() zip io.inputs)

  /*
    var combine = 0.U.asTypeOf(io.inputs(0))
    for (i <- io.inputs.indices) {
      combine = Mux(io.select(i).asBool(), io.inputs(i), combine)
      // this doesnt work because type T must contain unidirectional stuff
    }
    io.output <> combine
  */

  /*
  //val choice: List[Test] = List.fill(io.inputs.size)(Wire(new Test))

  when(io.select.asUInt().orR === false.B) {
    io.output <> 0.U.asTypeOf(io.output)
  }

  for (i <- io.inputs.indices) {
    when(io.select(i) === true.B) {
      //choice(i) := io.inputs(i)
      io.inputs(i) <> io.output
    }.otherwise {
      //choice(i) := 0.U.asTypeOf(io.inputs(i))
      io.inputs(i) <> 0.U.asTypeOf(io.inputs(i))
    }
  }*/

  //io.output <>

  /*for (i <- io.inputs.indices) {
    when(io.select(i) === true.B) {
      io.output <> io.inputs(i)

    }.elsewhen(io.select.asUInt().orR === false.B) {
      io.output <> 0.U.asTypeOf(io.output)
      io.inputs(i) <> 0.U.asTypeOf(io.inputs(i))
    }
  }*/


  /*
  io.output <> Mux1H(io.select.asBools() zip io.inputs)
  for (i <- io.inputs.indices) {
    when(io.select(i) === false.B) {
      io.inputs(i) <> 0.U.asTypeOf(io.inputs(i))
    }
  }
   */
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