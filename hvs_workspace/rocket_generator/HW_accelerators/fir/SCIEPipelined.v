module SCIEPipelined(
  input         clock,
  input         reset,
  input         io_valid,
  input  [31:0] io_insn,
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  output [31:0] io_rd
);
  reg [31:0] coeffs_0; // @[SCIEPipelined.scala 20:23]
  reg [31:0] coeffs_1; // @[SCIEPipelined.scala 20:23]
  reg [31:0] coeffs_2; // @[SCIEPipelined.scala 20:23]
  reg [31:0] coeffs_3; // @[SCIEPipelined.scala 20:23]
  reg [31:0] coeffs_4; // @[SCIEPipelined.scala 20:23]
  reg [31:0] data_0; // @[SCIEPipelined.scala 21:21]
  reg [31:0] data_1; // @[SCIEPipelined.scala 21:21]
  reg [31:0] data_2; // @[SCIEPipelined.scala 21:21]
  reg [31:0] data_3; // @[SCIEPipelined.scala 21:21]
  reg [31:0] data_4; // @[SCIEPipelined.scala 21:21]
  reg [63:0] result; // @[SCIEPipelined.scala 22:23]
  wire [31:0] _GEN_6 = 3'h1 == io_rs2[2:0] ? coeffs_1 : coeffs_0; // @[SCIEPipelined.scala 28:{16,16}]
  wire [31:0] _GEN_7 = 3'h2 == io_rs2[2:0] ? coeffs_2 : _GEN_6; // @[SCIEPipelined.scala 28:{16,16}]
  wire [31:0] _GEN_8 = 3'h3 == io_rs2[2:0] ? coeffs_3 : _GEN_7; // @[SCIEPipelined.scala 28:{16,16}]
  wire [31:0] _GEN_9 = 3'h4 == io_rs2[2:0] ? coeffs_4 : _GEN_8; // @[SCIEPipelined.scala 28:{16,16}]
  wire [63:0] _result_T_1 = data_0 * coeffs_0; // @[UIntTypeClass.scala 40:41]
  wire [63:0] _result_T_2 = data_1 * coeffs_1; // @[UIntTypeClass.scala 40:41]
  wire [63:0] _result_T_3 = data_2 * coeffs_2; // @[UIntTypeClass.scala 40:41]
  wire [63:0] _result_T_4 = data_3 * coeffs_3; // @[UIntTypeClass.scala 40:41]
  wire [63:0] _result_T_5 = data_4 * coeffs_4; // @[UIntTypeClass.scala 40:41]
  wire [63:0] _result_T_7 = _result_T_1 + _result_T_2; // @[UIntTypeClass.scala 19:40]
  wire [63:0] _result_T_9 = _result_T_7 + _result_T_3; // @[UIntTypeClass.scala 19:40]
  wire [63:0] _result_T_11 = _result_T_9 + _result_T_4; // @[UIntTypeClass.scala 19:40]
  wire [63:0] _result_T_13 = _result_T_11 + _result_T_5; // @[UIntTypeClass.scala 19:40]
  wire [63:0] _GEN_10 = io_insn[6:0] == 7'h3b ? _result_T_13 : result; // @[SCIEPipelined.scala 34:44 36:14 22:23]
  assign io_rd = result[31:0]; // @[SCIEPipelined.scala 39:9]
  always @(posedge clock) begin
    if (reset) begin // @[SCIEPipelined.scala 20:23]
      coeffs_0 <= 32'h0; // @[SCIEPipelined.scala 20:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 26:39]
        if (3'h0 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 27:24]
          coeffs_0 <= io_rs1; // @[SCIEPipelined.scala 27:24]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:23]
      coeffs_1 <= 32'h0; // @[SCIEPipelined.scala 20:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 26:39]
        if (3'h1 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 27:24]
          coeffs_1 <= io_rs1; // @[SCIEPipelined.scala 27:24]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:23]
      coeffs_2 <= 32'h0; // @[SCIEPipelined.scala 20:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 26:39]
        if (3'h2 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 27:24]
          coeffs_2 <= io_rs1; // @[SCIEPipelined.scala 27:24]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:23]
      coeffs_3 <= 32'h0; // @[SCIEPipelined.scala 20:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 26:39]
        if (3'h3 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 27:24]
          coeffs_3 <= io_rs1; // @[SCIEPipelined.scala 27:24]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:23]
      coeffs_4 <= 32'h0; // @[SCIEPipelined.scala 20:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 26:39]
        if (3'h4 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 27:24]
          coeffs_4 <= io_rs1; // @[SCIEPipelined.scala 27:24]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 21:21]
      data_0 <= 32'h0; // @[SCIEPipelined.scala 21:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 26:39]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 29:44]
          data_0 <= io_rs1; // @[SCIEPipelined.scala 32:15]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 21:21]
      data_1 <= 32'h0; // @[SCIEPipelined.scala 21:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 26:39]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 29:44]
          data_1 <= data_0; // @[SCIEPipelined.scala 31:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 21:21]
      data_2 <= 32'h0; // @[SCIEPipelined.scala 21:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 26:39]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 29:44]
          data_2 <= data_1; // @[SCIEPipelined.scala 31:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 21:21]
      data_3 <= 32'h0; // @[SCIEPipelined.scala 21:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 26:39]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 29:44]
          data_3 <= data_2; // @[SCIEPipelined.scala 31:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 21:21]
      data_4 <= 32'h0; // @[SCIEPipelined.scala 21:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 26:39]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 29:44]
          data_4 <= data_3; // @[SCIEPipelined.scala 31:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 22:23]
      result <= 64'h0; // @[SCIEPipelined.scala 22:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 26:39]
        result <= {{32'd0}, _GEN_9}; // @[SCIEPipelined.scala 28:16]
      end else if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 29:44]
        result <= {{32'd0}, data_0}; // @[SCIEPipelined.scala 33:14]
      end else begin
        result <= _GEN_10;
      end
    end
  end
endmodule
