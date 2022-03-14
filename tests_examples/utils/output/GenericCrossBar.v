module GenericCrossBar(
  input  [1:0] io_select,
  input  [7:0] io_inputs_0_valuein,
  output [7:0] io_inputs_0_valueout,
  output [7:0] io_output_0_valuein,
  input  [7:0] io_output_0_valueout,
  output [7:0] io_output_1_valuein,
  input  [7:0] io_output_1_valueout
);
  assign io_inputs_0_valueout = io_output_1_valueout; // @[GenericMux.scala 47:18]
  assign io_output_0_valuein = io_inputs_0_valuein; // @[GenericMux.scala 47:18]
  assign io_output_1_valuein = io_inputs_0_valuein; // @[GenericMux.scala 47:18]
endmodule
