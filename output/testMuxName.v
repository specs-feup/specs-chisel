module Mux(
  input  [15:0] io_a,
  input  [15:0] io_b,
  output [15:0] io_c,
  input         io_e
);
  assign io_c = io_e ? io_b : io_a; // @[Mux.scala 26:16 Mux.scala 27:14 Mux.scala 29:14]
endmodule
module MultiMux(
  input         clock,
  input         reset,
  input  [15:0] io_a,
  input  [15:0] io_b,
  input  [15:0] io_c,
  input  [15:0] io_d,
  output [15:0] io_e,
  input  [1:0]  io_f
);
  wire [15:0] Mux_io_a; // @[Mux.scala 10:23]
  wire [15:0] Mux_io_b; // @[Mux.scala 10:23]
  wire [15:0] Mux_io_c; // @[Mux.scala 10:23]
  wire  Mux_io_e; // @[Mux.scala 10:23]
  wire [15:0] Mux_1_io_a; // @[Mux.scala 10:23]
  wire [15:0] Mux_1_io_b; // @[Mux.scala 10:23]
  wire [15:0] Mux_1_io_c; // @[Mux.scala 10:23]
  wire  Mux_1_io_e; // @[Mux.scala 10:23]
  wire [15:0] Mux_2_io_a; // @[Mux.scala 10:23]
  wire [15:0] Mux_2_io_b; // @[Mux.scala 10:23]
  wire [15:0] Mux_2_io_c; // @[Mux.scala 10:23]
  wire  Mux_2_io_e; // @[Mux.scala 10:23]
  Mux Mux ( // @[Mux.scala 10:23]
    .io_a(Mux_io_a),
    .io_b(Mux_io_b),
    .io_c(Mux_io_c),
    .io_e(Mux_io_e)
  );
  Mux Mux_1 ( // @[Mux.scala 10:23]
    .io_a(Mux_1_io_a),
    .io_b(Mux_1_io_b),
    .io_c(Mux_1_io_c),
    .io_e(Mux_1_io_e)
  );
  Mux Mux_2 ( // @[Mux.scala 10:23]
    .io_a(Mux_2_io_a),
    .io_b(Mux_2_io_b),
    .io_c(Mux_2_io_c),
    .io_e(Mux_2_io_e)
  );
  assign io_e = Mux_2_io_c; // @[MultiMux.scala 17:15]
  assign Mux_io_a = io_a; // @[Mux.scala 11:16]
  assign Mux_io_b = io_b; // @[Mux.scala 12:16]
  assign Mux_io_e = io_f[0]; // @[MultiMux.scala 18:22]
  assign Mux_1_io_a = io_c; // @[Mux.scala 11:16]
  assign Mux_1_io_b = io_d; // @[Mux.scala 12:16]
  assign Mux_1_io_e = io_f[0]; // @[MultiMux.scala 19:22]
  assign Mux_2_io_a = Mux_io_c; // @[Mux.scala 11:16]
  assign Mux_2_io_b = Mux_1_io_c; // @[Mux.scala 12:16]
  assign Mux_2_io_e = io_f[1]; // @[MultiMux.scala 17:31]
endmodule
