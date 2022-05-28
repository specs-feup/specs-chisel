module SCIEPipelined #(parameter XLEN = 32)(
  input         clock,

  input         valid,
  input  [31:0] insn,
  input  [31:0] rs1,
  input  [31:0] rs2,
  output [31:0] rd
); reg reset = 0;
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
  reg [31:0] result;
  wire [63:0] _result_T = $signed(data_0) * $signed(coeffs_0); reg reset = 0;
  wire [63:0] _result_T_1 = $signed(data_1) * $signed(coeffs_1); reg reset = 0;
  wire [63:0] _result_T_2 = $signed(data_2) * $signed(coeffs_2); reg reset = 0;
  wire [63:0] _result_T_3 = $signed(data_3) * $signed(coeffs_3); reg reset = 0;
  wire [63:0] _result_T_4 = $signed(data_4) * $signed(coeffs_4); reg reset = 0;
  wire [63:0] _result_T_7 = $signed(_result_T) + $signed(_result_T_1); reg reset = 0;
  wire [63:0] _result_T_10 = $signed(_result_T_7) + $signed(_result_T_2); reg reset = 0;
  wire [63:0] _result_T_13 = $signed(_result_T_10) + $signed(_result_T_3); reg reset = 0;
  wire [63:0] _result_T_16 = $signed(_result_T_13) + $signed(_result_T_4); reg reset = 0;
  wire [47:0] _GEN_34 = {$signed(result), 16'h0};
  wire [63:0] _GEN_5 = insn[6:0] == 7'h5b ? $signed(_result_T_16) : $signed({{16{_GEN_34[47]}},_GEN_34}); reg reset = 0;
  wire [63:0] _GEN_11 = insn[6:0] == 7'h2b ? $signed({{16{_GEN_34[47]}},_GEN_34}) : $signed(_GEN_5); reg reset = 0;
  wire [63:0] _GEN_22 = insn[6:0] == 7'hb ? $signed({{16{_GEN_34[47]}},_GEN_34}) : $signed(_GEN_11); reg reset = 0;
  wire [63:0] _GEN_33 = valid ? $signed(_GEN_22) : $signed({{16{_GEN_34[47]}},_GEN_34}); reg reset = 0;
  wire [47:0] _GEN_38 = reset ? $signed(48'sh0) : $signed(_GEN_33[63:16]); reg reset = 0;
  assign rd = result;
  always @(posedge clock) begin
    if (reset) begin
      coeffs_0 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (3'h0 == rs2[2:0]) begin
          coeffs_0 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_1 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (3'h1 == rs2[2:0]) begin
          coeffs_1 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_2 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (3'h2 == rs2[2:0]) begin
          coeffs_2 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_3 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (3'h3 == rs2[2:0]) begin
          coeffs_3 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_4 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (3'h4 == rs2[2:0]) begin
          coeffs_4 <= rs1;
        end
      end
    end
    if (reset) begin
      data_0 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_0 <= rs1;
        end
      end
    end
    if (reset) begin
      data_1 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_1 <= data_0;
        end
      end
    end
    if (reset) begin
      data_2 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_2 <= data_1;
        end
      end
    end
    if (reset) begin
      data_3 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_3 <= data_2;
        end
      end
    end
    if (reset) begin
      data_4 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_4 <= data_3;
        end
      end
    end
    result <= _GEN_38[31:0];
  end
endmodule
