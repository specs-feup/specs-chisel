module LeftShift(
  input         clock,
  input         reset,
  input  [31:0] io_ina,
  input  [31:0] io_inb,
  output [31:0] io_out
);
  wire [94:0] _GEN_0 = {{63'd0}, io_ina}; // @[LeftShift.scala 20:21]
  wire [94:0] z1 = _GEN_0 << io_inb[5:0]; // @[LeftShift.scala 20:21]
  assign io_out = z1[31:0]; // @[LeftShift.scala 21:12]
endmodule
