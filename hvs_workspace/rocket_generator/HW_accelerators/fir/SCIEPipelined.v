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
  reg [31:0] data_0; // @[SCIEPipelined.scala 21:21]
  reg [31:0] data_1; // @[SCIEPipelined.scala 21:21]
  reg [31:0] data_2; // @[SCIEPipelined.scala 21:21]
  reg [63:0] result; // @[SCIEPipelined.scala 22:23]
  wire [31:0] _GEN_4 = 2'h1 == io_rs2[1:0] ? coeffs_1 : coeffs_0; // @[SCIEPipelined.scala 27:{14,14}]
  wire [31:0] _GEN_5 = 2'h2 == io_rs2[1:0] ? coeffs_2 : _GEN_4; // @[SCIEPipelined.scala 27:{14,14}]
  wire [63:0] _result_T_1 = data_0 * coeffs_0; // @[UIntTypeClass.scala 40:41]
  wire [63:0] _result_T_2 = data_1 * coeffs_1; // @[UIntTypeClass.scala 40:41]
  wire [63:0] _result_T_3 = data_2 * coeffs_2; // @[UIntTypeClass.scala 40:41]
  wire [63:0] _result_T_5 = _result_T_1 + _result_T_2; // @[UIntTypeClass.scala 19:40]
  wire [63:0] _result_T_7 = _result_T_5 + _result_T_3; // @[UIntTypeClass.scala 19:40]
  wire [63:0] _GEN_6 = io_insn[6:0] == 7'h5b ? _result_T_7 : result; // @[SCIEPipelined.scala 32:48 33:14 22:23]
  assign io_rd = result[31:0]; // @[SCIEPipelined.scala 36:9]
  always @(posedge clock) begin
    if (reset) begin // @[SCIEPipelined.scala 20:23]
      coeffs_0 <= 32'h0; // @[SCIEPipelined.scala 20:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 25:42]
        if (2'h0 == io_rs2[1:0]) begin // @[SCIEPipelined.scala 26:22]
          coeffs_0 <= io_rs1; // @[SCIEPipelined.scala 26:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:23]
      coeffs_1 <= 32'h0; // @[SCIEPipelined.scala 20:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 25:42]
        if (2'h1 == io_rs2[1:0]) begin // @[SCIEPipelined.scala 26:22]
          coeffs_1 <= io_rs1; // @[SCIEPipelined.scala 26:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 20:23]
      coeffs_2 <= 32'h0; // @[SCIEPipelined.scala 20:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 25:42]
        if (2'h2 == io_rs2[1:0]) begin // @[SCIEPipelined.scala 26:22]
          coeffs_2 <= io_rs1; // @[SCIEPipelined.scala 26:22]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 21:21]
      data_0 <= 32'h0; // @[SCIEPipelined.scala 21:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 25:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 28:48]
          data_0 <= io_rs1; // @[SCIEPipelined.scala 30:15]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 21:21]
      data_1 <= 32'h0; // @[SCIEPipelined.scala 21:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 25:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 28:48]
          data_1 <= data_0; // @[SCIEPipelined.scala 29:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 21:21]
      data_2 <= 32'h0; // @[SCIEPipelined.scala 21:21]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (!(io_insn[6:0] == 7'hb)) begin // @[SCIEPipelined.scala 25:42]
        if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 28:48]
          data_2 <= data_1; // @[SCIEPipelined.scala 29:54]
        end
      end
    end
    if (reset) begin // @[SCIEPipelined.scala 22:23]
      result <= 64'h0; // @[SCIEPipelined.scala 22:23]
    end else if (io_valid) begin // @[SCIEPipelined.scala 24:17]
      if (io_insn[6:0] == 7'hb) begin // @[SCIEPipelined.scala 25:42]
        result <= {{32'd0}, _GEN_5}; // @[SCIEPipelined.scala 27:14]
      end else if (io_insn[6:0] == 7'h2b) begin // @[SCIEPipelined.scala 28:48]
        result <= {{32'd0}, data_0}; // @[SCIEPipelined.scala 31:14]
      end else begin
        result <= _GEN_6;
      end
    end
  end
endmodule
