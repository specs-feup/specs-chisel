module LeftShift(
  input  [31:0] io_ina,
  output [31:0] io_out
);
  wire [33:0] _GEN_0 = {io_ina, 2'h0}; // @[LeftShift.scala 20:21]
  wire [94:0] z1 = {{61'd0}, _GEN_0}; // @[LeftShift.scala 20:21]
  assign io_out = z1[31:0]; // @[LeftShift.scala 21:12]
endmodule
module MultiShift(
  input         clock,
  input         reset,
  input  [31:0] io_a,
  output [31:0] io_b
);
  wire [31:0] LeftShift_io_ina; // @[LeftShift.scala 12:23]
  wire [31:0] LeftShift_io_out; // @[LeftShift.scala 12:23]
  wire [31:0] LeftShift_1_io_ina; // @[LeftShift.scala 12:23]
  wire [31:0] LeftShift_1_io_out; // @[LeftShift.scala 12:23]
  LeftShift LeftShift ( // @[LeftShift.scala 12:23]
    .io_ina(LeftShift_io_ina),
    .io_out(LeftShift_io_out)
  );
  LeftShift LeftShift_1 ( // @[LeftShift.scala 12:23]
    .io_ina(LeftShift_1_io_ina),
    .io_out(LeftShift_1_io_out)
  );
  assign io_b = LeftShift_1_io_out; // @[LeftShift.scala 34:10]
  assign LeftShift_io_ina = io_a; // @[LeftShift.scala 13:18]
  assign LeftShift_1_io_ina = LeftShift_io_out; // @[LeftShift.scala 13:18]
endmodule
