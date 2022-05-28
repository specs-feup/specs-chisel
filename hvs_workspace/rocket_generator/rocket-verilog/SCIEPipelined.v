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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] coeffs_0; // @[SCIEPipelined.scala 19:23]
  reg [31:0] coeffs_1; // @[SCIEPipelined.scala 19:23]
  reg [31:0] coeffs_2; // @[SCIEPipelined.scala 19:23]
  reg [31:0] coeffs_3; // @[SCIEPipelined.scala 19:23]
  reg [31:0] data_0; // @[SCIEPipelined.scala 20:21]
  reg [31:0] data_1; // @[SCIEPipelined.scala 20:21]
  reg [31:0] data_2; // @[SCIEPipelined.scala 20:21]
  reg [31:0] data_3; // @[SCIEPipelined.scala 20:21]
  reg [31:0] result; // @[SCIEPipelined.scala 21:23]
  wire [63:0] _result_T = data_0 * coeffs_0; // @[SCIEPipelined.scala 32:57]
  wire [63:0] _result_T_1 = data_1 * coeffs_1; // @[SCIEPipelined.scala 32:57]
  wire [63:0] _result_T_2 = data_2 * coeffs_2; // @[SCIEPipelined.scala 32:57]
  wire [63:0] _result_T_3 = data_3 * coeffs_3; // @[SCIEPipelined.scala 32:57]
  wire [63:0] _result_T_5 = _result_T + _result_T_1; // @[SCIEPipelined.scala 32:72]
  wire [63:0] _result_T_7 = _result_T_5 + _result_T_2; // @[SCIEPipelined.scala 32:72]
  wire [63:0] _result_T_9 = _result_T_7 + _result_T_3; // @[SCIEPipelined.scala 32:72]
  wire [63:0] _GEN_4 = io_insn[6:0] == 7'h5b ? _result_T_9 : {{32'd0}, result}; // @[SCIEPipelined.scala 31:48 32:14 21:23]
  wire [63:0] _GEN_9 = io_insn[6:0] == 7'h2b ? 64'h1 : _GEN_4; // @[SCIEPipelined.scala 27:48 30:14]
  wire [63:0] _GEN_14 = io_insn[6:0] == 7'hb ? 64'h1 : _GEN_9; // @[SCIEPipelined.scala 24:42 26:14]
  wire [63:0] _GEN_23 = io_valid ? _GEN_14 : {{32'd0}, result}; // @[SCIEPipelined.scala 23:17 21:23]
  wire [63:0] _GEN_28 = reset ? 64'h0 : _GEN_23; // @[SCIEPipelined.scala 21:{23,23}]
  assign io_rd = result; // @[SCIEPipelined.scala 35:9]
  always @(posedge clock) begin
    if (reset) begin // @[SCIEPipelined.scala 19:23]
      coeffs_0 <= 32'h0; // @[SCIEPipelined.scala 19:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 24:42]
        if (2'h0 == io_rs2[1:0]) begin // @[SCIEPipelined.scala 25:22]
          coeffs_0 <= io_rs1; // @[SCIEPipelined.scala 25:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 19:23]
      coeffs_1 <= 32'h0; // @[SCIEPipelined.scala 19:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 24:42]
        if (2'h1 == io_rs2[1:0]) begin // @[SCIEPipelined.scala 25:22]
          coeffs_1 <= io_rs1; // @[SCIEPipelined.scala 25:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 19:23]
      coeffs_2 <= 32'h0; // @[SCIEPipelined.scala 19:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 24:42]
        if (2'h2 == io_rs2[1:0]) begin // @[SCIEPipelined.scala 25:22]
          coeffs_2 <= io_rs1; // @[SCIEPipelined.scala 25:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 19:23]
      coeffs_3 <= 32'h0; // @[SCIEPipelined.scala 19:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 23:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 24:42]
        if (2'h3 == io_rs2[1:0]) begin // @[SCIEPipelined.scala 25:22]
          coeffs_3 <= io_rs1; // @[SCIEPipelined.scala 25:22]
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
    result <= _GEN_28[31:0]; // @[SCIEPipelined.scala 21:{23,23}]
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
  data_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  data_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  data_2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  data_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  result = _RAND_8[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
