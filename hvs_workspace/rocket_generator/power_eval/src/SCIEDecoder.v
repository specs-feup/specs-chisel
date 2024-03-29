module SCIEDecoder(
  input  [31:0] insn,
  output        unpipelined,
  output        pipelined,
  output        multicycle
);

  //assign unpipelined = 1'h0; // @[SCIEDecoder.scala 16:18]
  assign pipelined = insn[6:0] == 7'hb | insn[6:0] == 7'h2b | insn[6:0] == 7'h3b; // @[SCIEDecoder.scala 15:73]
  //assign multicycle = 1'h0; // @[SCIEDecoder.scala 17:17]
endmodule
