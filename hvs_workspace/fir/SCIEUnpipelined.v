module SCIEUnpipelined(
  input         clock,
  input         reset,
  input  [31:0] io_insn,
  input  [10:0] io_rs1,
  input  [10:0] io_rs2,
  output [10:0] io_rd
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
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
`endif // RANDOMIZE_REG_INIT
  reg [10:0] coeffs_0; // @[SCIEUnpipelined.scala 28:23]
  reg [10:0] coeffs_1; // @[SCIEUnpipelined.scala 28:23]
  reg [10:0] coeffs_2; // @[SCIEUnpipelined.scala 28:23]
  reg [10:0] coeffs_3; // @[SCIEUnpipelined.scala 28:23]
  reg [10:0] coeffs_4; // @[SCIEUnpipelined.scala 28:23]
  reg [10:0] coeffs_5; // @[SCIEUnpipelined.scala 28:23]
  reg [10:0] coeffs_6; // @[SCIEUnpipelined.scala 28:23]
  reg [10:0] coeffs_7; // @[SCIEUnpipelined.scala 28:23]
  reg [10:0] coeffs_8; // @[SCIEUnpipelined.scala 28:23]
  reg [10:0] coeffs_9; // @[SCIEUnpipelined.scala 28:23]
  reg [10:0] coeffs_10; // @[SCIEUnpipelined.scala 28:23]
  reg [10:0] data_0; // @[SCIEUnpipelined.scala 29:21]
  reg [10:0] data_1; // @[SCIEUnpipelined.scala 29:21]
  reg [10:0] data_2; // @[SCIEUnpipelined.scala 29:21]
  reg [10:0] data_3; // @[SCIEUnpipelined.scala 29:21]
  reg [10:0] data_4; // @[SCIEUnpipelined.scala 29:21]
  reg [10:0] data_5; // @[SCIEUnpipelined.scala 29:21]
  reg [10:0] data_6; // @[SCIEUnpipelined.scala 29:21]
  reg [10:0] data_7; // @[SCIEUnpipelined.scala 29:21]
  reg [10:0] data_8; // @[SCIEUnpipelined.scala 29:21]
  reg [10:0] data_9; // @[SCIEUnpipelined.scala 29:21]
  reg [10:0] data_10; // @[SCIEUnpipelined.scala 29:21]
  reg [31:0] result; // @[SCIEUnpipelined.scala 30:23]
  wire [21:0] _result_T = data_0 * coeffs_0; // @[SCIEUnpipelined.scala 40:55]
  wire [21:0] _result_T_1 = data_1 * coeffs_1; // @[SCIEUnpipelined.scala 40:55]
  wire [21:0] _result_T_2 = data_2 * coeffs_2; // @[SCIEUnpipelined.scala 40:55]
  wire [21:0] _result_T_3 = data_3 * coeffs_3; // @[SCIEUnpipelined.scala 40:55]
  wire [21:0] _result_T_4 = data_4 * coeffs_4; // @[SCIEUnpipelined.scala 40:55]
  wire [21:0] _result_T_5 = data_5 * coeffs_5; // @[SCIEUnpipelined.scala 40:55]
  wire [21:0] _result_T_6 = data_6 * coeffs_6; // @[SCIEUnpipelined.scala 40:55]
  wire [21:0] _result_T_7 = data_7 * coeffs_7; // @[SCIEUnpipelined.scala 40:55]
  wire [21:0] _result_T_8 = data_8 * coeffs_8; // @[SCIEUnpipelined.scala 40:55]
  wire [21:0] _result_T_9 = data_9 * coeffs_9; // @[SCIEUnpipelined.scala 40:55]
  wire [21:0] _result_T_10 = data_10 * coeffs_10; // @[SCIEUnpipelined.scala 40:55]
  wire [21:0] _result_T_12 = _result_T + _result_T_1; // @[SCIEUnpipelined.scala 40:70]
  wire [21:0] _result_T_14 = _result_T_12 + _result_T_2; // @[SCIEUnpipelined.scala 40:70]
  wire [21:0] _result_T_16 = _result_T_14 + _result_T_3; // @[SCIEUnpipelined.scala 40:70]
  wire [21:0] _result_T_18 = _result_T_16 + _result_T_4; // @[SCIEUnpipelined.scala 40:70]
  wire [21:0] _result_T_20 = _result_T_18 + _result_T_5; // @[SCIEUnpipelined.scala 40:70]
  wire [21:0] _result_T_22 = _result_T_20 + _result_T_6; // @[SCIEUnpipelined.scala 40:70]
  wire [21:0] _result_T_24 = _result_T_22 + _result_T_7; // @[SCIEUnpipelined.scala 40:70]
  wire [21:0] _result_T_26 = _result_T_24 + _result_T_8; // @[SCIEUnpipelined.scala 40:70]
  wire [21:0] _result_T_28 = _result_T_26 + _result_T_9; // @[SCIEUnpipelined.scala 40:70]
  wire [21:0] _result_T_30 = _result_T_28 + _result_T_10; // @[SCIEUnpipelined.scala 40:70]
  assign io_rd = result[10:0]; // @[SCIEUnpipelined.scala 42:9]
  always @(posedge clock) begin
    if (reset) begin // @[SCIEUnpipelined.scala 28:23]
      coeffs_0 <= 11'h0; // @[SCIEUnpipelined.scala 28:23]
    end else if (io_insn[15:0] == 16'h700b) begin // @[SCIEUnpipelined.scala 32:58]
      if (4'h0 == io_rs2[3:0]) begin // @[SCIEUnpipelined.scala 33:20]
        coeffs_0 <= io_rs1; // @[SCIEUnpipelined.scala 33:20]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 28:23]
      coeffs_1 <= 11'h0; // @[SCIEUnpipelined.scala 28:23]
    end else if (io_insn[15:0] == 16'h700b) begin // @[SCIEUnpipelined.scala 32:58]
      if (4'h1 == io_rs2[3:0]) begin // @[SCIEUnpipelined.scala 33:20]
        coeffs_1 <= io_rs1; // @[SCIEUnpipelined.scala 33:20]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 28:23]
      coeffs_2 <= 11'h0; // @[SCIEUnpipelined.scala 28:23]
    end else if (io_insn[15:0] == 16'h700b) begin // @[SCIEUnpipelined.scala 32:58]
      if (4'h2 == io_rs2[3:0]) begin // @[SCIEUnpipelined.scala 33:20]
        coeffs_2 <= io_rs1; // @[SCIEUnpipelined.scala 33:20]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 28:23]
      coeffs_3 <= 11'h0; // @[SCIEUnpipelined.scala 28:23]
    end else if (io_insn[15:0] == 16'h700b) begin // @[SCIEUnpipelined.scala 32:58]
      if (4'h3 == io_rs2[3:0]) begin // @[SCIEUnpipelined.scala 33:20]
        coeffs_3 <= io_rs1; // @[SCIEUnpipelined.scala 33:20]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 28:23]
      coeffs_4 <= 11'h0; // @[SCIEUnpipelined.scala 28:23]
    end else if (io_insn[15:0] == 16'h700b) begin // @[SCIEUnpipelined.scala 32:58]
      if (4'h4 == io_rs2[3:0]) begin // @[SCIEUnpipelined.scala 33:20]
        coeffs_4 <= io_rs1; // @[SCIEUnpipelined.scala 33:20]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 28:23]
      coeffs_5 <= 11'h0; // @[SCIEUnpipelined.scala 28:23]
    end else if (io_insn[15:0] == 16'h700b) begin // @[SCIEUnpipelined.scala 32:58]
      if (4'h5 == io_rs2[3:0]) begin // @[SCIEUnpipelined.scala 33:20]
        coeffs_5 <= io_rs1; // @[SCIEUnpipelined.scala 33:20]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 28:23]
      coeffs_6 <= 11'h0; // @[SCIEUnpipelined.scala 28:23]
    end else if (io_insn[15:0] == 16'h700b) begin // @[SCIEUnpipelined.scala 32:58]
      if (4'h6 == io_rs2[3:0]) begin // @[SCIEUnpipelined.scala 33:20]
        coeffs_6 <= io_rs1; // @[SCIEUnpipelined.scala 33:20]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 28:23]
      coeffs_7 <= 11'h0; // @[SCIEUnpipelined.scala 28:23]
    end else if (io_insn[15:0] == 16'h700b) begin // @[SCIEUnpipelined.scala 32:58]
      if (4'h7 == io_rs2[3:0]) begin // @[SCIEUnpipelined.scala 33:20]
        coeffs_7 <= io_rs1; // @[SCIEUnpipelined.scala 33:20]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 28:23]
      coeffs_8 <= 11'h0; // @[SCIEUnpipelined.scala 28:23]
    end else if (io_insn[15:0] == 16'h700b) begin // @[SCIEUnpipelined.scala 32:58]
      if (4'h8 == io_rs2[3:0]) begin // @[SCIEUnpipelined.scala 33:20]
        coeffs_8 <= io_rs1; // @[SCIEUnpipelined.scala 33:20]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 28:23]
      coeffs_9 <= 11'h0; // @[SCIEUnpipelined.scala 28:23]
    end else if (io_insn[15:0] == 16'h700b) begin // @[SCIEUnpipelined.scala 32:58]
      if (4'h9 == io_rs2[3:0]) begin // @[SCIEUnpipelined.scala 33:20]
        coeffs_9 <= io_rs1; // @[SCIEUnpipelined.scala 33:20]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 28:23]
      coeffs_10 <= 11'h0; // @[SCIEUnpipelined.scala 28:23]
    end else if (io_insn[15:0] == 16'h700b) begin // @[SCIEUnpipelined.scala 32:58]
      if (4'ha == io_rs2[3:0]) begin // @[SCIEUnpipelined.scala 33:20]
        coeffs_10 <= io_rs1; // @[SCIEUnpipelined.scala 33:20]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 29:21]
      data_0 <= 11'h0; // @[SCIEUnpipelined.scala 29:21]
    end else if (!(io_insn[15:0] == 16'h700b)) begin // @[SCIEUnpipelined.scala 32:58]
      if (io_insn[15:0] == 16'h702b) begin // @[SCIEUnpipelined.scala 35:63]
        data_0 <= io_rs1; // @[SCIEUnpipelined.scala 37:13]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 29:21]
      data_1 <= 11'h0; // @[SCIEUnpipelined.scala 29:21]
    end else if (!(io_insn[15:0] == 16'h700b)) begin // @[SCIEUnpipelined.scala 32:58]
      if (io_insn[15:0] == 16'h702b) begin // @[SCIEUnpipelined.scala 35:63]
        data_1 <= data_0; // @[SCIEUnpipelined.scala 36:50]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 29:21]
      data_2 <= 11'h0; // @[SCIEUnpipelined.scala 29:21]
    end else if (!(io_insn[15:0] == 16'h700b)) begin // @[SCIEUnpipelined.scala 32:58]
      if (io_insn[15:0] == 16'h702b) begin // @[SCIEUnpipelined.scala 35:63]
        data_2 <= data_1; // @[SCIEUnpipelined.scala 36:50]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 29:21]
      data_3 <= 11'h0; // @[SCIEUnpipelined.scala 29:21]
    end else if (!(io_insn[15:0] == 16'h700b)) begin // @[SCIEUnpipelined.scala 32:58]
      if (io_insn[15:0] == 16'h702b) begin // @[SCIEUnpipelined.scala 35:63]
        data_3 <= data_2; // @[SCIEUnpipelined.scala 36:50]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 29:21]
      data_4 <= 11'h0; // @[SCIEUnpipelined.scala 29:21]
    end else if (!(io_insn[15:0] == 16'h700b)) begin // @[SCIEUnpipelined.scala 32:58]
      if (io_insn[15:0] == 16'h702b) begin // @[SCIEUnpipelined.scala 35:63]
        data_4 <= data_3; // @[SCIEUnpipelined.scala 36:50]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 29:21]
      data_5 <= 11'h0; // @[SCIEUnpipelined.scala 29:21]
    end else if (!(io_insn[15:0] == 16'h700b)) begin // @[SCIEUnpipelined.scala 32:58]
      if (io_insn[15:0] == 16'h702b) begin // @[SCIEUnpipelined.scala 35:63]
        data_5 <= data_4; // @[SCIEUnpipelined.scala 36:50]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 29:21]
      data_6 <= 11'h0; // @[SCIEUnpipelined.scala 29:21]
    end else if (!(io_insn[15:0] == 16'h700b)) begin // @[SCIEUnpipelined.scala 32:58]
      if (io_insn[15:0] == 16'h702b) begin // @[SCIEUnpipelined.scala 35:63]
        data_6 <= data_5; // @[SCIEUnpipelined.scala 36:50]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 29:21]
      data_7 <= 11'h0; // @[SCIEUnpipelined.scala 29:21]
    end else if (!(io_insn[15:0] == 16'h700b)) begin // @[SCIEUnpipelined.scala 32:58]
      if (io_insn[15:0] == 16'h702b) begin // @[SCIEUnpipelined.scala 35:63]
        data_7 <= data_6; // @[SCIEUnpipelined.scala 36:50]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 29:21]
      data_8 <= 11'h0; // @[SCIEUnpipelined.scala 29:21]
    end else if (!(io_insn[15:0] == 16'h700b)) begin // @[SCIEUnpipelined.scala 32:58]
      if (io_insn[15:0] == 16'h702b) begin // @[SCIEUnpipelined.scala 35:63]
        data_8 <= data_7; // @[SCIEUnpipelined.scala 36:50]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 29:21]
      data_9 <= 11'h0; // @[SCIEUnpipelined.scala 29:21]
    end else if (!(io_insn[15:0] == 16'h700b)) begin // @[SCIEUnpipelined.scala 32:58]
      if (io_insn[15:0] == 16'h702b) begin // @[SCIEUnpipelined.scala 35:63]
        data_9 <= data_8; // @[SCIEUnpipelined.scala 36:50]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 29:21]
      data_10 <= 11'h0; // @[SCIEUnpipelined.scala 29:21]
    end else if (!(io_insn[15:0] == 16'h700b)) begin // @[SCIEUnpipelined.scala 32:58]
      if (io_insn[15:0] == 16'h702b) begin // @[SCIEUnpipelined.scala 35:63]
        data_10 <= data_9; // @[SCIEUnpipelined.scala 36:50]
      end
    end
    if (reset) begin // @[SCIEUnpipelined.scala 30:23]
      result <= 32'h0; // @[SCIEUnpipelined.scala 30:23]
    end else if (io_insn[15:0] == 16'h700b) begin // @[SCIEUnpipelined.scala 32:58]
      result <= 32'h1; // @[SCIEUnpipelined.scala 34:12]
    end else if (io_insn[15:0] == 16'h702b) begin // @[SCIEUnpipelined.scala 35:63]
      result <= 32'h1; // @[SCIEUnpipelined.scala 38:12]
    end else if (io_insn[15:0] == 16'h705b) begin // @[SCIEUnpipelined.scala 39:58]
      result <= {{10'd0}, _result_T_30}; // @[SCIEUnpipelined.scala 40:12]
    end
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
  coeffs_0 = _RAND_0[10:0];
  _RAND_1 = {1{`RANDOM}};
  coeffs_1 = _RAND_1[10:0];
  _RAND_2 = {1{`RANDOM}};
  coeffs_2 = _RAND_2[10:0];
  _RAND_3 = {1{`RANDOM}};
  coeffs_3 = _RAND_3[10:0];
  _RAND_4 = {1{`RANDOM}};
  coeffs_4 = _RAND_4[10:0];
  _RAND_5 = {1{`RANDOM}};
  coeffs_5 = _RAND_5[10:0];
  _RAND_6 = {1{`RANDOM}};
  coeffs_6 = _RAND_6[10:0];
  _RAND_7 = {1{`RANDOM}};
  coeffs_7 = _RAND_7[10:0];
  _RAND_8 = {1{`RANDOM}};
  coeffs_8 = _RAND_8[10:0];
  _RAND_9 = {1{`RANDOM}};
  coeffs_9 = _RAND_9[10:0];
  _RAND_10 = {1{`RANDOM}};
  coeffs_10 = _RAND_10[10:0];
  _RAND_11 = {1{`RANDOM}};
  data_0 = _RAND_11[10:0];
  _RAND_12 = {1{`RANDOM}};
  data_1 = _RAND_12[10:0];
  _RAND_13 = {1{`RANDOM}};
  data_2 = _RAND_13[10:0];
  _RAND_14 = {1{`RANDOM}};
  data_3 = _RAND_14[10:0];
  _RAND_15 = {1{`RANDOM}};
  data_4 = _RAND_15[10:0];
  _RAND_16 = {1{`RANDOM}};
  data_5 = _RAND_16[10:0];
  _RAND_17 = {1{`RANDOM}};
  data_6 = _RAND_17[10:0];
  _RAND_18 = {1{`RANDOM}};
  data_7 = _RAND_18[10:0];
  _RAND_19 = {1{`RANDOM}};
  data_8 = _RAND_19[10:0];
  _RAND_20 = {1{`RANDOM}};
  data_9 = _RAND_20[10:0];
  _RAND_21 = {1{`RANDOM}};
  data_10 = _RAND_21[10:0];
  _RAND_22 = {1{`RANDOM}};
  result = _RAND_22[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
