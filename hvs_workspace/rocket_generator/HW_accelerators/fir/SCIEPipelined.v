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
  reg [31:0] data_0;
  reg [31:0] data_1;
  reg [31:0] data_2;
  reg [31:0] data_3;
  reg [31:0] result;
  wire [63:0] _result_T = data_0 * coeffs_0;
  wire [63:0] _result_T_1 = data_1 * coeffs_1;
  wire [63:0] _result_T_2 = data_2 * coeffs_2;
  wire [63:0] _result_T_3 = data_3 * coeffs_3;
  wire [63:0] _result_T_5 = _result_T + _result_T_1;
  wire [63:0] _result_T_7 = _result_T_5 + _result_T_2;
  wire [63:0] _result_T_9 = _result_T_7 + _result_T_3;
  wire [63:0] _GEN_4 = insn[6:0] == 7'h5b ? _result_T_9 : {{32'd0}, result};
  wire [63:0] _GEN_9 = insn[6:0] == 7'h2b ? 64'h1 : _GEN_4;
  wire [63:0] _GEN_14 = insn[6:0] == 7'hb ? 64'h1 : _GEN_9;
  wire [63:0] _GEN_23 = valid ? _GEN_14 : {{32'd0}, result};
  wire [63:0] _GEN_28 = reset ? 64'h0 : _GEN_23;
  assign rd = result;
  always @(posedge clock) begin
    if (reset) begin
      coeffs_0 <= 32'h0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (2'h0 == rs2[1:0]) begin
          coeffs_0 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_1 <= 32'h0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (2'h1 == rs2[1:0]) begin
          coeffs_1 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_2 <= 32'h0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (2'h2 == rs2[1:0]) begin
          coeffs_2 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_3 <= 32'h0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (2'h3 == rs2[1:0]) begin
          coeffs_3 <= rs1;
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
    result <= _GEN_28[31:0];
  end
endmodule
