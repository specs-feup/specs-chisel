module SimpleDspModule(
  input         clock,
  input         reset,
  input  [15:0] io_x,
  input  [15:0] io_y,
  output [15:0] io_z
);
  assign io_z = $signed(io_x) + $signed(io_y); // @[FixedPointTypeClass.scala 21:58]
endmodule
