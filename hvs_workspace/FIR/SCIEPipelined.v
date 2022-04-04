module SCIEPipelined(
  input         clock,
  input         reset,
  input         io_valid,
  input  [31:0] io_insn,
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  output [31:0] io_rd,
  output        io_out_valid,
  input         io_recv_signal,
  input         io_exec_signal
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] coeffs_0; // @[FIR.scala 58:23]
  reg [31:0] coeffs_1; // @[FIR.scala 58:23]
  reg [31:0] coeffs_2; // @[FIR.scala 58:23]
  reg [31:0] coeffs_3; // @[FIR.scala 58:23]
  reg [31:0] taps_0; // @[FIR.scala 59:21]
  reg [31:0] taps_1; // @[FIR.scala 59:21]
  reg [31:0] taps_2; // @[FIR.scala 59:21]
  reg [31:0] taps_3; // @[FIR.scala 59:21]
  reg [4:0] coeff_count; // @[FIR.scala 60:28]
  reg [31:0] result; // @[FIR.scala 61:23]
  wire [31:0] _GEN_0 = 2'h0 == coeff_count[1:0] ? io_rs1 : coeffs_0; // @[FIR.scala 58:23 67:{29,29}]
  wire [31:0] _GEN_1 = 2'h1 == coeff_count[1:0] ? io_rs1 : coeffs_1; // @[FIR.scala 58:23 67:{29,29}]
  wire [31:0] _GEN_2 = 2'h2 == coeff_count[1:0] ? io_rs1 : coeffs_2; // @[FIR.scala 58:23 67:{29,29}]
  wire [31:0] _GEN_3 = 2'h3 == coeff_count[1:0] ? io_rs1 : coeffs_3; // @[FIR.scala 58:23 67:{29,29}]
  wire [4:0] _coeff_count_T_1 = coeff_count + 5'h1; // @[FIR.scala 68:36]
  wire [63:0] _result_T = taps_0 * coeffs_0; // @[FIR.scala 75:57]
  wire [63:0] _result_T_1 = taps_1 * coeffs_1; // @[FIR.scala 75:57]
  wire [63:0] _result_T_2 = taps_2 * coeffs_2; // @[FIR.scala 75:57]
  wire [63:0] _result_T_3 = taps_3 * coeffs_3; // @[FIR.scala 75:57]
  wire [63:0] _result_T_5 = _result_T + _result_T_1; // @[FIR.scala 75:72]
  wire [63:0] _result_T_7 = _result_T_5 + _result_T_2; // @[FIR.scala 75:72]
  wire [63:0] _result_T_9 = _result_T_7 + _result_T_3; // @[FIR.scala 75:72]
  wire [63:0] _GEN_13 = io_exec_signal ? _result_T_9 : 64'h0; // @[FIR.scala 64:12 74:32 75:14]
  wire [63:0] _GEN_23 = io_recv_signal ? 64'h1 : _GEN_13; // @[FIR.scala 65:26 73:14]
  wire [63:0] _GEN_24 = io_valid ? _GEN_23 : {{32'd0}, result}; // @[FIR.scala 63:18 61:23]
  wire [63:0] _GEN_34 = reset ? 64'h0 : _GEN_24; // @[FIR.scala 61:{23,23}]
  assign io_rd = result; // @[FIR.scala 79:9]
  assign io_out_valid = result != 32'h0; // @[FIR.scala 80:30]
  always @(posedge clock) begin
    if (reset) begin // @[FIR.scala 58:23]
      coeffs_0 <= 32'h0; // @[FIR.scala 58:23]
    end else if (io_valid) begin // @[FIR.scala 63:18]
      if (io_recv_signal) begin // @[FIR.scala 65:26]
        if (coeff_count < 5'h4) begin // @[FIR.scala 66:31]
          coeffs_0 <= _GEN_0;
        end
      end
    end
    if (reset) begin // @[FIR.scala 58:23]
      coeffs_1 <= 32'h0; // @[FIR.scala 58:23]
    end else if (io_valid) begin // @[FIR.scala 63:18]
      if (io_recv_signal) begin // @[FIR.scala 65:26]
        if (coeff_count < 5'h4) begin // @[FIR.scala 66:31]
          coeffs_1 <= _GEN_1;
        end
      end
    end
    if (reset) begin // @[FIR.scala 58:23]
      coeffs_2 <= 32'h0; // @[FIR.scala 58:23]
    end else if (io_valid) begin // @[FIR.scala 63:18]
      if (io_recv_signal) begin // @[FIR.scala 65:26]
        if (coeff_count < 5'h4) begin // @[FIR.scala 66:31]
          coeffs_2 <= _GEN_2;
        end
      end
    end
    if (reset) begin // @[FIR.scala 58:23]
      coeffs_3 <= 32'h0; // @[FIR.scala 58:23]
    end else if (io_valid) begin // @[FIR.scala 63:18]
      if (io_recv_signal) begin // @[FIR.scala 65:26]
        if (coeff_count < 5'h4) begin // @[FIR.scala 66:31]
          coeffs_3 <= _GEN_3;
        end
      end
    end
    if (reset) begin // @[FIR.scala 59:21]
      taps_0 <= 32'h0; // @[FIR.scala 59:21]
    end else if (io_valid) begin // @[FIR.scala 63:18]
      if (io_recv_signal) begin // @[FIR.scala 65:26]
        if (!(coeff_count < 5'h4)) begin // @[FIR.scala 66:31]
          taps_0 <= io_rs1; // @[FIR.scala 71:17]
        end
      end
    end
    if (reset) begin // @[FIR.scala 59:21]
      taps_1 <= 32'h0; // @[FIR.scala 59:21]
    end else if (io_valid) begin // @[FIR.scala 63:18]
      if (io_recv_signal) begin // @[FIR.scala 65:26]
        if (!(coeff_count < 5'h4)) begin // @[FIR.scala 66:31]
          taps_1 <= taps_0; // @[FIR.scala 70:56]
        end
      end
    end
    if (reset) begin // @[FIR.scala 59:21]
      taps_2 <= 32'h0; // @[FIR.scala 59:21]
    end else if (io_valid) begin // @[FIR.scala 63:18]
      if (io_recv_signal) begin // @[FIR.scala 65:26]
        if (!(coeff_count < 5'h4)) begin // @[FIR.scala 66:31]
          taps_2 <= taps_1; // @[FIR.scala 70:56]
        end
      end
    end
    if (reset) begin // @[FIR.scala 59:21]
      taps_3 <= 32'h0; // @[FIR.scala 59:21]
    end else if (io_valid) begin // @[FIR.scala 63:18]
      if (io_recv_signal) begin // @[FIR.scala 65:26]
        if (!(coeff_count < 5'h4)) begin // @[FIR.scala 66:31]
          taps_3 <= taps_2; // @[FIR.scala 70:56]
        end
      end
    end
    if (reset) begin // @[FIR.scala 60:28]
      coeff_count <= 5'h0; // @[FIR.scala 60:28]
    end else if (io_valid) begin // @[FIR.scala 63:18]
      if (io_recv_signal) begin // @[FIR.scala 65:26]
        if (coeff_count < 5'h4) begin // @[FIR.scala 66:31]
          coeff_count <= _coeff_count_T_1; // @[FIR.scala 68:21]
        end
      end
    end
    result <= _GEN_34[31:0]; // @[FIR.scala 61:{23,23}]
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
  _RAND_0 = {1{`RANDOM}};
  coeffs_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  coeffs_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  coeffs_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  coeffs_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  taps_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  taps_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  taps_2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  taps_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  coeff_count = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  result = _RAND_9[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
