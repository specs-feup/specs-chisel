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
  val order = testParams.getInt("order")

  val io = IO(new SCIEPipelinedInterface(gen))

  val coeffs = RegInit(VecInit(Seq.fill(order)(0.U(gen.getWidth.W).asTypeOf(gen.cloneType))))
  val data = RegInit(VecInit(Seq.fill(order)(0.U(gen.getWidth.W).asTypeOf(gen.cloneType))))
  val result = RegInit(0.U(gen.getWidth.W).asTypeOf(gen.cloneType))

  when(io.valid){
    when(io.insn(6, 0) === "b0001011".U) {
      coeffs(io.rs2) := io.rs1
      result := coeffs(io.rs2)
    }.elsewhen(io.insn(6, 0) === "b0101011".U) {
      data.zip(data.tail).foreach { case (a, b) => b := a }
      data(0) := io.rs1
      result := data(0)
    }.elsewhen(io.insn(6, 0) === "b1011011".U) {
      result := data.zip(coeffs).map { case (a, b) => Ring[T].times(a,b) }.reduce(Ring[T].plus(_, _))
    }
  }
  io.rd := result
}
