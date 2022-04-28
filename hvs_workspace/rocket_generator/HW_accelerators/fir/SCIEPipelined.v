module SCIEPipelined #(parameter XLEN = 32)(
  input         clock,

  input         valid,
  input  [31:0] insn,
  input  [31:0] rs1,
  input  [31:0] rs2,
  output [31:0] rd
);
reg reset = 0;
  reg [31:0] coeffs_0;
  reg [31:0] coeffs_1;
  reg [31:0] coeffs_2;
  reg [31:0] coeffs_3;
  reg [31:0] data_0;
  reg [31:0] data_1;
  reg [31:0] data_2;
  reg [31:0] data_3;
  reg [63:0] result;
  wire [31:0] _GEN_5 = 2'h1 == rs2[1:0] ? $signed(coeffs_1) : $signed(coeffs_0);
  wire [31:0] _GEN_6 = 2'h2 == rs2[1:0] ? $signed(coeffs_2) : $signed(_GEN_5);
  wire [31:0] _GEN_7 = 2'h3 == rs2[1:0] ? $signed(coeffs_3) : $signed(_GEN_6);
  wire [63:0] _result_T_2 = $signed(data_0) * $signed(coeffs_0);
  wire [63:0] _result_T_3 = $signed(data_1) * $signed(coeffs_1);
  wire [63:0] _result_T_4 = $signed(data_2) * $signed(coeffs_2);
  wire [63:0] _result_T_5 = $signed(data_3) * $signed(coeffs_3);
  wire [63:0] _result_T_8 = $signed(_result_T_2) + $signed(_result_T_3);
  wire [63:0] _result_T_11 = $signed(_result_T_8) + $signed(_result_T_4);
  wire [63:0] _result_T_14 = $signed(_result_T_11) + $signed(_result_T_5);
  wire [67:0] _GEN_8 = insn[6:0] == 7'h5b ? $signed({{4{_result_T_14[63]}},_result_T_14}) : $signed({$signed(result)
    , 4'h0});
  wire [35:0] _GEN_32 = {$signed(data_0), 4'h0};
  wire [67:0] _GEN_13 = insn[6:0] == 7'h2b ? $signed({{32{_GEN_32[35]}},_GEN_32}) : $signed(_GEN_8);
  wire [35:0] _GEN_33 = {$signed(_GEN_7), 4'h0};
  wire [67:0] _GEN_18 = insn[6:0] == 7'hb ? $signed({{32{_GEN_33[35]}},_GEN_33}) : $signed(_GEN_13);
  wire [67:0] _GEN_27 = valid ? $signed(_GEN_18) : $signed({$signed(result), 4'h0});
  assign rd = result[31:0];
  always @(posedge clock) begin
    if (reset) begin
      coeffs_0 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (2'h0 == rs2[1:0]) begin
          coeffs_0 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_1 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (2'h1 == rs2[1:0]) begin
          coeffs_1 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_2 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (2'h2 == rs2[1:0]) begin
          coeffs_2 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_3 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (2'h3 == rs2[1:0]) begin
          coeffs_3 <= rs1;
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
      result <= 64'sh0;
    end else begin
      result <= _GEN_27[67:4];
    end
  end
endmodule
