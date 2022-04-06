package scie

import chisel3._
import params._
import chisel3.stage.{ChiselStage, ChiselGeneratorAnnotation}
import firrtl.options.{StageMain}

//fir_send_coeff; fir_send_data; fir_exec
class SCIEUnpipelinedInterface(width : Int) extends Bundle{
  val insn = Input(UInt(32.W))
  val rs1 = Input(UInt(width.W))
  val rs2 = Input(UInt(width.W))
  val rd = Output(UInt(width.W))
}


object SCIEUnpipelined{
  val fir_send_coeff = "h700b".asUInt(15.W)
  val fir_send_data = "h702b".asUInt(15.W)
  val fir_exec = "h705b".asUInt(15.W)
}

class SCIEUnpipelined(testParams : TestParams) extends Module{
  val order = testParams.getInt("order")
  val width = testParams.getInt("width")

  val io = IO(new SCIEUnpipelinedInterface(width))
  val coeffs = RegInit(VecInit(Seq.fill(order)(0.U(width.W))))
  val data = RegInit(VecInit(Seq.fill(order)(0.U(width.W))))
  val result = RegInit(0.U(32.W))

  when(io.insn(15, 0) === SCIEUnpipelined.fir_send_coeff){
    coeffs(io.rs2) := io.rs1
    result := 1.U
  }.elsewhen(io.insn(15, 0) === SCIEUnpipelined.fir_send_data){
    data.zip(data.tail).foreach{ case(a, b) => b := a}
    data(0) := io.rs1
    result := 1.U
  }.elsewhen(io.insn(15, 0) === SCIEUnpipelined.fir_exec){
    result := data.zip(coeffs).map { case (a, b) => a * b }.reduce(_ + _)
  }
  io.rd := result
}

class SCIEGenStage extends GenericTesterStage((params, annotations) => {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new SCIEUnpipelined(params))))})

object SCIEGen extends StageMain(new SCIEGenStage)