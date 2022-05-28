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

  //io.pipelined := io.insn(15,0) === "b0001011".U || io.insn(6,0) ===  "b0101011".U || io.insn(6,0) ===  "b1011011".U
  io.pipelined := io.insn(6,0) === "h0b".U || io.insn(6,0) ===  "h2b".U || io.insn(6,0) ===  "h3b".U
  io.unpipelined := 0.U
  io.multicycle := 0.U
}
