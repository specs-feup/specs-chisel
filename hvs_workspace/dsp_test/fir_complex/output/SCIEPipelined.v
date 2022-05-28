module SCIEPipelined(
  input         clock,
  input         reset,
  input         io_valid,
  input  [31:0] io_insn,
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  output [31:0] io_rd
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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] coeffs_0; // @[SCIEPipelined.scala 19:23]
  reg [31:0] coeffs_1; // @[SCIEPipelined.scala 19:23]
  reg [31:0] coeffs_2; // @[SCIEPipelined.scala 19:23]
  reg [31:0] coeffs_3; // @[SCIEPipelined.scala 19:23]
  reg [31:0] coeffs_4; // @[SCIEPipelined.scala 19:23]
  reg [31:0] coeffs_5; // @[SCIEPipelined.scala 19:23]
  reg [31:0] coeffs_6; // @[SCIEPipelined.scala 19:23]
  reg [31:0] coeffs_7; // @[SCIEPipelined.scala 19:23]
  reg [31:0] data_0; // @[SCIEPipelined.scala 20:21]
  reg [31:0] data_1; // @[SCIEPipelined.scala 20:21]
  reg [31:0] data_2; // @[SCIEPipelined.scala 20:21]
  reg [31:0] data_3; // @[SCIEPipelined.scala 20:21]
  reg [31:0] data_4; // @[SCIEPipelined.scala 20:21]
  reg [31:0] data_5; // @[SCIEPipelined.scala 20:21]
  reg [31:0] data_6; // @[SCIEPipelined.scala 20:21]
  reg [31:0] data_7; // @[SCIEPipelined.scala 20:21]
  reg [31:0] result; // @[SCIEPipelined.scala 21:23]
  wire [63:0] _result_T = data_0 * coeffs_0; // @[SCIEPipelined.scala 32:57]
  wire [63:0] _result_T_1 = data_1 * coeffs_1; // @[SCIEPipelined.scala 32:57]
  wire [63:0] _result_T_2 = data_2 * coeffs_2; // @[SCIEPipelined.scala 32:57]
  wire [63:0] _result_T_3 = data_3 * coeffs_3; // @[SCIEPipelined.scala 32:57]
  wire [63:0] _result_T_4 = data_4 * coeffs_4; // @[SCIEPipelined.scala 32:57]
  wire [63:0] _result_T_5 = data_5 * coeffs_5; // @[SCIEPipelined.scala 32:57]
  wire [63:0] _result_T_6 = data_6 * coeffs_6; // @[SCIEPipelined.scala 32:57]
  wire [63:0] _result_T_7 = data_7 * coeffs_7; // @[SCIEPipelined.scala 32:57]
  wire [63:0] _result_T_9 = _result_T + _result_T_1; // @[SCIEPipelined.scala 32:72]
  wire [63:0] _result_T_11 = _result_T_9 + _result_T_2; // @[SCIEPipelined.scala 32:72]
  wire [63:0] _result_T_13 = _result_T_11 + _result_T_3; // @[SCIEPipelined.scala 32:72]
  wire [63:0] _result_T_15 = _result_T_13 + _result_T_4; // @[SCIEPipelined.scala 32:72]
  wire [63:0] _result_T_17 = _result_T_15 + _result_T_5; // @[SCIEPipelined.scala 32:72]
  wire [63:0] _result_T_19 = _result_T_17 + _result_T_6; // @[SCIEPipelined.scala 32:72]
  wire [63:0] _result_T_21 = _result_T_19 + _result_T_7; // @[SCIEPipelined.scala 32:72]
  wire [63:0] _GEN_8 = io_insn[6:0] == 7'h5b ? _result_T_21 : {{32'd0}, result}; // @[SCIEPipelined.scala 31:48 32:14 21:23]
  wire [63:0] _GEN_17 = io_insn[6:0] == 7'h2b ? 64'h1 : _GEN_8; // @[SCIEPipelined.scala 27:48 30:14]
  wire [63:0] _GEN_26 = io_insn[6:0] == 7'hb ? 64'h1 : _GEN_17; // @[SCIEPipelined.scala 24:42 26:14]
  wire [63:0] _GEN_43 = io_valid ? _GEN_26 : {{32'd0}, result}; // @[SCIEPipelined.scala 23:17 21:23]
  wire [63:0] _GEN_52 = reset ? 64'h0 : _GEN_43; // @[SCIEPipelined.scala 21:{23,23}]
  assign io_rd = result; // @[SCIEPipelined.scala 35:9]
  always @(posedge clock) begin
    if (reset) begin // @[SCIEPipelined.scala 19:23]
      coeffs_0 <= 32'h0; // @[SCIEPipelined.scala 19:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 24:42]
        if (3'h0 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 25:22]
          coeffs_0 <= io_rs1; // @[SCIEPipelined.scala 25:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 19:23]
      coeffs_1 <= 32'h0; // @[SCIEPipelined.scala 19:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 24:42]
        if (3'h1 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 25:22]
          coeffs_1 <= io_rs1; // @[SCIEPipelined.scala 25:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 19:23]
      coeffs_2 <= 32'h0; // @[SCIEPipelined.scala 19:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 24:42]
        if (3'h2 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 25:22]
          coeffs_2 <= io_rs1; // @[SCIEPipelined.scala 25:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 19:23]
      coeffs_3 <= 32'h0; // @[SCIEPipelined.scala 19:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 24:42]
        if (3'h3 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 25:22]
          coeffs_3 <= io_rs1; // @[SCIEPipelined.scala 25:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 19:23]
      coeffs_4 <= 32'h0; // @[SCIEPipelined.scala 19:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 24:42]
        if (3'h4 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 25:22]
          coeffs_4 <= io_rs1; // @[SCIEPipelined.scala 25:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 19:23]
      coeffs_5 <= 32'h0; // @[SCIEPipelined.scala 19:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 24:42]
        if (3'h5 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 25:22]
          coeffs_5 <= io_rs1; // @[SCIEPipelined.scala 25:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 19:23]
      coeffs_6 <= 32'h0; // @[SCIEPipelined.scala 19:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 24:42]
        if (3'h6 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 25:22]
          coeffs_6 <= io_rs1; // @[SCIEPipelined.scala 25:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 19:23]
      coeffs_7 <= 32'h0; // @[SCIEPipelined.scala 19:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 24:42]
        if (3'h7 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 25:22]
          coeffs_7 <= io_rs1; // @[SCIEPipelined.scala 25:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:21]
      data_0 <= 32'h0; // @[SCIEPipelined.scala 20:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 24:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 27:48]
          data_0 <= io_rs1; // @[SCIEPipelined.scala 29:15]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:21]
      data_1 <= 32'h0; // @[SCIEPipelined.scala 20:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 24:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 27:48]
          data_1 <= data_0; // @[SCIEPipelined.scala 28:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:21]
      data_2 <= 32'h0; // @[SCIEPipelined.scala 20:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 24:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 27:48]
          data_2 <= data_1; // @[SCIEPipelined.scala 28:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:21]
      data_3 <= 32'h0; // @[SCIEPipelined.scala 20:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 24:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 27:48]
          data_3 <= data_2; // @[SCIEPipelined.scala 28:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:21]
      data_4 <= 32'h0; // @[SCIEPipelined.scala 20:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 24:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 27:48]
          data_4 <= data_3; // @[SCIEPipelined.scala 28:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:21]
      data_5 <= 32'h0; // @[SCIEPipelined.scala 20:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 24:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 27:48]
          data_5 <= data_4; // @[SCIEPipelined.scala 28:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:21]
      data_6 <= 32'h0; // @[SCIEPipelined.scala 20:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 24:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 27:48]
          data_6 <= data_5; // @[SCIEPipelined.scala 28:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:21]
      data_7 <= 32'h0; // @[SCIEPipelined.scala 20:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 24:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 27:48]
          data_7 <= data_6; // @[SCIEPipelined.scala 28:54]
        end
      end
    end
    result <= _GEN_52[31:0]; // @[SCIEPipelined.scala 21:{23,23}]
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
  coeffs_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  coeffs_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  coeffs_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  coeffs_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  data_0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  data_1 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  data_2 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  data_3 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  data_4 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  data_5 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  data_6 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  data_7 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  result = _RAND_16[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
