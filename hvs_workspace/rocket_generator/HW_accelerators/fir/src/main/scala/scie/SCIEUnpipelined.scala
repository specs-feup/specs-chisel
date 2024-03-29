package scie

import chisel3._
import params._

class SCIEUnpipelinedInterface(xLen: Int) extends Bundle {
  val insn = Input(UInt(32.W))
  val rs1 = Input(UInt(32.W))
  val rs2 = Input(UInt(32.W))
  val rd = Output(UInt(32.W))
}


class SCIEUnpipelined(testParams : TestParams) extends RawModule{
  val width = testParams.getInt("width")
  val io = IO(new SCIEUnpipelinedInterface(width))

  io.rd := 0.U

}
