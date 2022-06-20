package scie

import chisel3._
import params._
import dsptools.numbers._

class SCIEUnpipelinedInterface[T<:Data:Order](gen : T) extends Bundle {
  val insn = Input(UInt(32.W))
  val rs1 = Input(gen.cloneType)
  val rs2 = Input(UInt(32.W))
  val rd = Output(gen.cloneType)
}


class SCIEUnpipelined[T<:Data:Order](testParams : TestParams, gen : T) extends Module{
  val width = testParams.getInt("width")
  val io = IO(new SCIEUnpipelinedInterface(gen))

  io.rd := Mux(Order[T].gt((io.rs1).asTypeOf(gen.cloneType), (0.U).asTypeOf(gen.cloneType)) , (io.rs1).asTypeOf(gen.cloneType), (0.U).asTypeOf(gen.cloneType))

}
