package scie

import chisel3._

class SCIEDecoderInterface extends Bundle{
  val insn = Input(UInt(32.W))
  val unpipelined = Output(Bool())
  val pipelined = Output(Bool())
  val multicycle = Output(Bool())
}


class SCIEDecoder extends RawModule{
  val io = IO(new SCIEDecoderInterface)
  io.unpipelined := io.insn(6,0) === "h7b".U
  io.pipelined := 0.U
  io.multicycle := 0.U
}
