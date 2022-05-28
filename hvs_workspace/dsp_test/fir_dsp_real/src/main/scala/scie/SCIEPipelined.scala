package scie
import chisel3.experimental.FixedPoint
import chisel3.{fromDoubleToLiteral, _}
import dsptools.numbers._
import params._

class SCIEPipelinedInterface(width : Int, binarypoint : Int) extends Bundle{
  val valid = Input(Bool())
  val insn = Input(UInt(32.W))
  val rs1 = Input(FixedPoint(width.W, binarypoint.BP))
  val rs2 = Input(UInt(32.W))
  val rd = Output(FixedPoint(width.W, binarypoint.BP))
}


class SCIEPipelined(testParams : TestParams) extends Module{
  val order = testParams.getInt("order")
  val width = testParams.getInt("width")
  val binarypoint = testParams.getInt("binarypoint")

  val io = IO(new SCIEPipelinedInterface(width, binarypoint))

  val coeffs = RegInit(VecInit(Seq.fill(order)(0.0.F(width.W, binarypoint.BP))))
  val data = RegInit(VecInit(Seq.fill(order)(0.0.F(width.W, binarypoint.BP))))
  val result = RegInit(0.0.F(width.W, binarypoint.BP))

  when(io.valid){
    when(io.insn(6, 0) === "b0001011".U) {
      coeffs(io.rs2) := io.rs1
    }.elsewhen(io.insn(6, 0) === "b0101011".U) {
      data.zip(data.tail).foreach { case (a, b) => b := a }
      data(0) := io.rs1
    }.elsewhen(io.insn(6, 0) === "b1011011".U) {
      result := data.zip(coeffs).map { case (a, b) => a * b }.reduce(_ + _)
    }
  }
  io.rd := result
}
