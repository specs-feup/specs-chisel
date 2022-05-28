module GenericMux(
  input  [2:0] io_select,
  input  [7:0] io_inputs_0_valuein,
  output [7:0] io_inputs_0_valueout,
  input  [7:0] io_inputs_1_valuein,
  output [7:0] io_inputs_1_valueout,
  input  [7:0] io_inputs_2_valuein,
  output [7:0] io_inputs_2_valueout,
  output [7:0] io_output_valuein,
  input  [7:0] io_output_valueout
);
  wire [7:0] _io_output__io_output_WIRE_valuein_T = io_select[0] ? io_inputs_0_valuein : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _io_output__io_output_WIRE_valuein_T_1 = io_select[1] ? io_inputs_1_valuein : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _io_output__io_output_WIRE_valuein_T_2 = io_select[2] ? io_inputs_2_valuein : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _io_output__io_output_WIRE_valuein_T_3 = _io_output__io_output_WIRE_valuein_T |
    _io_output__io_output_WIRE_valuein_T_1; // @[Mux.scala 27:72]
  assign io_inputs_0_valueout = io_output_valueout; // @[GenericMux.scala 97:18]
  assign io_inputs_1_valueout = io_output_valueout; // @[GenericMux.scala 97:18]
  assign io_inputs_2_valueout = io_output_valueout; // @[GenericMux.scala 97:18]
  assign io_output_valuein = _io_output__io_output_WIRE_valuein_T_3 | _io_output__io_output_WIRE_valuein_T_2; // @[Mux.scala 27:72]
endmodule
