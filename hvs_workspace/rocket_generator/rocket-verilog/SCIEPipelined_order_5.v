module SCIEPipelined #(parameter XLEN = 32)(
  input         clock,
  input         reset,
  input         valid,
  input  [31:0] insn,
  input  [31:0] rs1,
  input  [31:0] rs2,
  output [31:0] rd
);
  reg [31:0] coeffs_0;
  reg [31:0] coeffs_1;
  reg [31:0] coeffs_2;
  reg [31:0] coeffs_3;
  reg [31:0] coeffs_4;
  reg [31:0] data_0;
  reg [31:0] data_1;
  reg [31:0] data_2;
  reg [31:0] data_3;
  reg [31:0] data_4;
  reg [63:0] result;
  wire [31:0] _GEN_6 = 3'h1 == rs2[2:0] ? coeffs_1 : coeffs_0;
  wire [31:0] _GEN_7 = 3'h2 == rs2[2:0] ? coeffs_2 : _GEN_6;
  wire [31:0] _GEN_8 = 3'h3 == rs2[2:0] ? coeffs_3 : _GEN_7;
  wire [31:0] _GEN_9 = 3'h4 == rs2[2:0] ? coeffs_4 : _GEN_8;
  wire [63:0] _result_T_1 = data_0 * coeffs_0;
  wire [63:0] _result_T_2 = data_1 * coeffs_1;
  wire [63:0] _result_T_3 = data_2 * coeffs_2;
  wire [63:0] _result_T_4 = data_3 * coeffs_3;
  wire [63:0] _result_T_5 = data_4 * coeffs_4;
  wire [63:0] _result_T_7 = _result_T_1 + _result_T_2;
  wire [63:0] _result_T_9 = _result_T_7 + _result_T_3;
  wire [63:0] _result_T_11 = _result_T_9 + _result_T_4;
  wire [63:0] _result_T_13 = _result_T_11 + _result_T_5;
  wire [63:0] _GEN_10 = insn[6:0] == 7'h3b ? _result_T_13 : result;
  assign rd = result[31:0];
  always @(posedge clock) begin
    if (reset) begin
      coeffs_0 <= 32'h0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (3'h0 == rs2[2:0]) begin
          coeffs_0 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_1 <= 32'h0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (3'h1 == rs2[2:0]) begin
          coeffs_1 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_2 <= 32'h0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (3'h2 == rs2[2:0]) begin
          coeffs_2 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_3 <= 32'h0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (3'h3 == rs2[2:0]) begin
          coeffs_3 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_4 <= 32'h0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (3'h4 == rs2[2:0]) begin
          coeffs_4 <= rs1;
        end
      end
    end
    if (reset) begin
      data_0 <= 32'h0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_0 <= rs1;
        end
      end
    end
    if (reset) begin
      data_1 <= 32'h0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_1 <= data_0;
        end
      end
    end
    if (reset) begin
      data_2 <= 32'h0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_2 <= data_1;
        end
      end
    end
    if (reset) begin
      data_3 <= 32'h0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_3 <= data_2;
        end
      end
    end
    if (reset) begin
      data_4 <= 32'h0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_4 <= data_3;
        end
      end
    end
    if (reset) begin
      result <= 64'h0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        result <= {{32'd0}, _GEN_9};
      end else if (insn[6:0] == 7'h2b) begin
        result <= {{32'd0}, data_0};
      end else begin
        result <= _GEN_10;
      end
    end
  end
endmodule
