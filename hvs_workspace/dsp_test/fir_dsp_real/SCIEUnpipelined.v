module SCIEUnpipelined(
  input  [31:0] io_insn,
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  output [31:0] io_rd
);
  assign io_rd = 32'h0; // @[SCIEUnpipelined.scala 18:9]
endmodule
