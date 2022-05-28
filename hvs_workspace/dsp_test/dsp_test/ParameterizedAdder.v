module ParameterizedAdder(
  input         clock,
  input         reset,
  input  [63:0] io_a1_node,
  input  [63:0] io_a2_node,
  output [63:0] io_c_node
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] register1_blackbox_in1; // @[DspReal.scala 41:36]
  wire [63:0] register1_blackbox_in2; // @[DspReal.scala 41:36]
  wire [63:0] register1_blackbox_out; // @[DspReal.scala 41:36]
  reg [63:0] register1_node; // @[dsp_test.scala 72:22]
  BBFAdd register1_blackbox ( // @[DspReal.scala 41:36]
    .in1(register1_blackbox_in1),
    .in2(register1_blackbox_in2),
    .out(register1_blackbox_out)
  );
  assign io_c_node = register1_node; // @[dsp_test.scala 76:8]
  assign register1_blackbox_in1 = io_a1_node; // @[DspReal.scala 24:21]
  assign register1_blackbox_in2 = io_a2_node; // @[DspReal.scala 25:21]
  always @(posedge clock) begin
    register1_node <= register1_blackbox_out; // @[DspReal.scala 26:19 27:14]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  register1_node = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
