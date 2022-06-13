package scie

import chisel3._
import dsptools.numbers._
import params._

class SCIEPipelinedInterface[T<:Data:Ring](gen : T) extends Bundle{
  val valid = Input(Bool())
  val insn = Input(UInt(32.W))
  val rs1 = Input(gen.cloneType)
  val rs2 = Input(UInt(32.W))
  val rd = Output(gen.cloneType)
}

class SCIEPipelined[T<:Data:Ring](testParams : TestParams, gen : T) extends Module{

  val io = IO(new SCIEPipelinedInterface(gen))

}
