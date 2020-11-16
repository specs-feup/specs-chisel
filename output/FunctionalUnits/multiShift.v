module Mul(
  input         clock,
  input         reset,
  input  [31:0] io_ina,
  input  [31:0] io_inb,
  output [31:0] io_out
);
  wire [63:0] _io_out_T = io_ina * io_inb; // @[TwoInputUnit.scala 7:103]
  assign io_out = _io_out_T[31:0]; // @[TwoInputUnit.scala 7:90]
endmodule
