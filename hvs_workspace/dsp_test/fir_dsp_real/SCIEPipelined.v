module SCIEPipelined(
  input         clock,
  input         reset,
  input         io_valid,
  input  [31:0] io_insn,
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  output [31:0] io_rd
);
  reg [31:0] coeffs_0; // @[SCIEPipelined.scala 23:23]
  reg [31:0] coeffs_1; // @[SCIEPipelined.scala 23:23]
  reg [31:0] coeffs_2; // @[SCIEPipelined.scala 23:23]
  reg [31:0] coeffs_3; // @[SCIEPipelined.scala 23:23]
  reg [31:0] coeffs_4; // @[SCIEPipelined.scala 23:23]
  reg [31:0] data_0; // @[SCIEPipelined.scala 24:21]
  reg [31:0] data_1; // @[SCIEPipelined.scala 24:21]
  reg [31:0] data_2; // @[SCIEPipelined.scala 24:21]
  reg [31:0] data_3; // @[SCIEPipelined.scala 24:21]
  reg [31:0] data_4; // @[SCIEPipelined.scala 24:21]
  reg [31:0] result; // @[SCIEPipelined.scala 25:23]
  wire [63:0] _result_T = $signed(data_0) * $signed(coeffs_0); // @[SCIEPipelined.scala 34:57]
  wire [63:0] _result_T_1 = $signed(data_1) * $signed(coeffs_1); // @[SCIEPipelined.scala 34:57]
  wire [63:0] _result_T_2 = $signed(data_2) * $signed(coeffs_2); // @[SCIEPipelined.scala 34:57]
  wire [63:0] _result_T_3 = $signed(data_3) * $signed(coeffs_3); // @[SCIEPipelined.scala 34:57]
  wire [63:0] _result_T_4 = $signed(data_4) * $signed(coeffs_4); // @[SCIEPipelined.scala 34:57]
  wire [63:0] _result_T_7 = $signed(_result_T) + $signed(_result_T_1); // @[SCIEPipelined.scala 34:72]
  wire [63:0] _result_T_10 = $signed(_result_T_7) + $signed(_result_T_2); // @[SCIEPipelined.scala 34:72]
  wire [63:0] _result_T_13 = $signed(_result_T_10) + $signed(_result_T_3); // @[SCIEPipelined.scala 34:72]
  wire [63:0] _result_T_16 = $signed(_result_T_13) + $signed(_result_T_4); // @[SCIEPipelined.scala 34:72]
  wire [47:0] _GEN_34 = {$signed(result), 16'h0}; // @[SCIEPipelined.scala 33:48 34:14 25:23]
  wire [63:0] _GEN_5 = io_insn[6:0] == 7'h5b ? $signed(_result_T_16) : $signed({{16{_GEN_34[47]}},_GEN_34}); // @[SCIEPipelined.scala 33:48 34:14 25:23]
  wire [63:0] _GEN_11 = io_insn[6:0] == 7'h2b ? $signed({{16{_GEN_34[47]}},_GEN_34}) : $signed(_GEN_5); // @[SCIEPipelined.scala 25:23 30:48]
  wire [63:0] _GEN_22 = io_insn[6:0] == 7'hb ? $signed({{16{_GEN_34[47]}},_GEN_34}) : $signed(_GEN_11); // @[SCIEPipelined.scala 25:23 28:42]
  wire [63:0] _GEN_33 = io_valid ? $signed(_GEN_22) : $signed({{16{_GEN_34[47]}},_GEN_34}); // @[SCIEPipelined.scala 27:17 25:23]
  wire [47:0] _GEN_38 = reset ? $signed(48'sh0) : $signed(_GEN_33[63:16]); // @[SCIEPipelined.scala 25:{23,23}]
  assign io_rd = result; // @[SCIEPipelined.scala 37:9]
  always @(posedge clock) begin
    if (reset) begin // @[SCIEPipelined.scala 23:23]
      coeffs_0 <= 32'sh0; // @[SCIEPipelined.scala 23:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 27:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 28:42]
        if (3'h0 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 29:22]
          coeffs_0 <= io_rs1; // @[SCIEPipelined.scala 29:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 23:23]
      coeffs_1 <= 32'sh0; // @[SCIEPipelined.scala 23:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 27:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 28:42]
        if (3'h1 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 29:22]
          coeffs_1 <= io_rs1; // @[SCIEPipelined.scala 29:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 23:23]
      coeffs_2 <= 32'sh0; // @[SCIEPipelined.scala 23:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 27:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 28:42]
        if (3'h2 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 29:22]
          coeffs_2 <= io_rs1; // @[SCIEPipelined.scala 29:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 23:23]
      coeffs_3 <= 32'sh0; // @[SCIEPipelined.scala 23:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 27:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 28:42]
        if (3'h3 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 29:22]
          coeffs_3 <= io_rs1; // @[SCIEPipelined.scala 29:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 23:23]
      coeffs_4 <= 32'sh0; // @[SCIEPipelined.scala 23:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 27:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 28:42]
        if (3'h4 == io_rs2[2:0]) begin // @[SCIEPipelined.scala 29:22]
          coeffs_4 <= io_rs1; // @[SCIEPipelined.scala 29:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 24:21]
      data_0 <= 32'sh0; // @[SCIEPipelined.scala 24:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 27:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 28:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 30:48]
          data_0 <= io_rs1; // @[SCIEPipelined.scala 32:15]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 24:21]
      data_1 <= 32'sh0; // @[SCIEPipelined.scala 24:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 27:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 28:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 30:48]
          data_1 <= data_0; // @[SCIEPipelined.scala 31:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 24:21]
      data_2 <= 32'sh0; // @[SCIEPipelined.scala 24:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 27:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 28:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 30:48]
          data_2 <= data_1; // @[SCIEPipelined.scala 31:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 24:21]
      data_3 <= 32'sh0; // @[SCIEPipelined.scala 24:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 27:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 28:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 30:48]
          data_3 <= data_2; // @[SCIEPipelined.scala 31:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 24:21]
      data_4 <= 32'sh0; // @[SCIEPipelined.scala 24:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 27:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 28:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 30:48]
          data_4 <= data_3; // @[SCIEPipelined.scala 31:54]
        end
      end
    end
    result <= _GEN_38[31:0]; // @[SCIEPipelined.scala 25:{23,23}]
  end
endmodule
