package scie

import chisel3._
import params._

class SCIEPipelinedInterface(width : Int) extends Bundle{
  val valid = Input(Bool())
  val insn = Input(UInt(32.W))
  val rs1 = Input(UInt(width.W))
  val rs2 = Input(UInt(width.W))
  val rd = Output(UInt(width.W))
}

class SCIEPipelined(testParams : TestParams) extends Module{
  val order = testParams.getInt("order")
  val width = testParams.getInt("width")

  val io = IO(new SCIEPipelinedInterface(width))
  val coeffs = RegInit(VecInit(Seq.fill(order)(0.U(width.W))))
  val data = RegInit(VecInit(Seq.fill(order)(0.U(width.W))))
  val result = RegInit(0.U(32.W))

  when(io.valid){
    when(io.insn(6, 0) === "b0001011".U) {
      coeffs(io.rs2) := io.rs1
      result := 1.U
    }.elsewhen(io.insn(6, 0) === "b0101011".U) {
      data.zip(data.tail).foreach { case (a, b) => b := a }
      data(0) := io.rs1
      result := 1.U
    }.elsewhen(io.insn(6, 0) === "b1011011".U) {
      result := data.zip(coeffs).map { case (a, b) => a * b }.reduce(_ + _)
    }
  }
  io.rd := result
}
