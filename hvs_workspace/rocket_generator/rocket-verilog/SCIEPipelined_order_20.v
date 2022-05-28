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
  reg [31:0] coeffs_5;
  reg [31:0] coeffs_6;
  reg [31:0] coeffs_7;
  reg [31:0] coeffs_8;
  reg [31:0] coeffs_9;
  reg [31:0] coeffs_10;
  reg [31:0] coeffs_11;
  reg [31:0] coeffs_12;
  reg [31:0] coeffs_13;
  reg [31:0] coeffs_14;
  reg [31:0] coeffs_15;
  reg [31:0] coeffs_16;
  reg [31:0] coeffs_17;
  reg [31:0] coeffs_18;
  reg [31:0] coeffs_19;
  reg [31:0] data_0;
  reg [31:0] data_1;
  reg [31:0] data_2;
  reg [31:0] data_3;
  reg [31:0] data_4;
  reg [31:0] data_5;
  reg [31:0] data_6;
  reg [31:0] data_7;
  reg [31:0] data_8;
  reg [31:0] data_9;
  reg [31:0] data_10;
  reg [31:0] data_11;
  reg [31:0] data_12;
  reg [31:0] data_13;
  reg [31:0] data_14;
  reg [31:0] data_15;
  reg [31:0] data_16;
  reg [31:0] data_17;
  reg [31:0] data_18;
  reg [31:0] data_19;
  reg [63:0] result;
  wire [31:0] _GEN_21 = 5'h1 == rs2[4:0] ? $signed(coeffs_1) : $signed(coeffs_0);
  wire [31:0] _GEN_22 = 5'h2 == rs2[4:0] ? $signed(coeffs_2) : $signed(_GEN_21);
  wire [31:0] _GEN_23 = 5'h3 == rs2[4:0] ? $signed(coeffs_3) : $signed(_GEN_22);
  wire [31:0] _GEN_24 = 5'h4 == rs2[4:0] ? $signed(coeffs_4) : $signed(_GEN_23);
  wire [31:0] _GEN_25 = 5'h5 == rs2[4:0] ? $signed(coeffs_5) : $signed(_GEN_24);
  wire [31:0] _GEN_26 = 5'h6 == rs2[4:0] ? $signed(coeffs_6) : $signed(_GEN_25);
  wire [31:0] _GEN_27 = 5'h7 == rs2[4:0] ? $signed(coeffs_7) : $signed(_GEN_26);
  wire [31:0] _GEN_28 = 5'h8 == rs2[4:0] ? $signed(coeffs_8) : $signed(_GEN_27);
  wire [31:0] _GEN_29 = 5'h9 == rs2[4:0] ? $signed(coeffs_9) : $signed(_GEN_28);
  wire [31:0] _GEN_30 = 5'ha == rs2[4:0] ? $signed(coeffs_10) : $signed(_GEN_29);
  wire [31:0] _GEN_31 = 5'hb == rs2[4:0] ? $signed(coeffs_11) : $signed(_GEN_30);
  wire [31:0] _GEN_32 = 5'hc == rs2[4:0] ? $signed(coeffs_12) : $signed(_GEN_31);
  wire [31:0] _GEN_33 = 5'hd == rs2[4:0] ? $signed(coeffs_13) : $signed(_GEN_32);
  wire [31:0] _GEN_34 = 5'he == rs2[4:0] ? $signed(coeffs_14) : $signed(_GEN_33);
  wire [31:0] _GEN_35 = 5'hf == rs2[4:0] ? $signed(coeffs_15) : $signed(_GEN_34);
  wire [31:0] _GEN_36 = 5'h10 == rs2[4:0] ? $signed(coeffs_16) : $signed(_GEN_35);
  wire [31:0] _GEN_37 = 5'h11 == rs2[4:0] ? $signed(coeffs_17) : $signed(_GEN_36);
  wire [31:0] _GEN_38 = 5'h12 == rs2[4:0] ? $signed(coeffs_18) : $signed(_GEN_37);
  wire [31:0] _GEN_39 = 5'h13 == rs2[4:0] ? $signed(coeffs_19) : $signed(_GEN_38);
  wire [63:0] _result_T_2 = $signed(data_0) * $signed(coeffs_0);
  wire [63:0] _result_T_3 = $signed(data_1) * $signed(coeffs_1);
  wire [63:0] _result_T_4 = $signed(data_2) * $signed(coeffs_2);
  wire [63:0] _result_T_5 = $signed(data_3) * $signed(coeffs_3);
  wire [63:0] _result_T_6 = $signed(data_4) * $signed(coeffs_4);
  wire [63:0] _result_T_7 = $signed(data_5) * $signed(coeffs_5);
  wire [63:0] _result_T_8 = $signed(data_6) * $signed(coeffs_6);
  wire [63:0] _result_T_9 = $signed(data_7) * $signed(coeffs_7);
  wire [63:0] _result_T_10 = $signed(data_8) * $signed(coeffs_8);
  wire [63:0] _result_T_11 = $signed(data_9) * $signed(coeffs_9);
  wire [63:0] _result_T_12 = $signed(data_10) * $signed(coeffs_10);
  wire [63:0] _result_T_13 = $signed(data_11) * $signed(coeffs_11);
  wire [63:0] _result_T_14 = $signed(data_12) * $signed(coeffs_12);
  wire [63:0] _result_T_15 = $signed(data_13) * $signed(coeffs_13);
  wire [63:0] _result_T_16 = $signed(data_14) * $signed(coeffs_14);
  wire [63:0] _result_T_17 = $signed(data_15) * $signed(coeffs_15);
  wire [63:0] _result_T_18 = $signed(data_16) * $signed(coeffs_16);
  wire [63:0] _result_T_19 = $signed(data_17) * $signed(coeffs_17);
  wire [63:0] _result_T_20 = $signed(data_18) * $signed(coeffs_18);
  wire [63:0] _result_T_21 = $signed(data_19) * $signed(coeffs_19);
  wire [63:0] _result_T_24 = $signed(_result_T_2) + $signed(_result_T_3);
  wire [63:0] _result_T_27 = $signed(_result_T_24) + $signed(_result_T_4);
  wire [63:0] _result_T_30 = $signed(_result_T_27) + $signed(_result_T_5);
  wire [63:0] _result_T_33 = $signed(_result_T_30) + $signed(_result_T_6);
  wire [63:0] _result_T_36 = $signed(_result_T_33) + $signed(_result_T_7);
  wire [63:0] _result_T_39 = $signed(_result_T_36) + $signed(_result_T_8);
  wire [63:0] _result_T_42 = $signed(_result_T_39) + $signed(_result_T_9);
  wire [63:0] _result_T_45 = $signed(_result_T_42) + $signed(_result_T_10);
  wire [63:0] _result_T_48 = $signed(_result_T_45) + $signed(_result_T_11);
  wire [63:0] _result_T_51 = $signed(_result_T_48) + $signed(_result_T_12);
  wire [63:0] _result_T_54 = $signed(_result_T_51) + $signed(_result_T_13);
  wire [63:0] _result_T_57 = $signed(_result_T_54) + $signed(_result_T_14);
  wire [63:0] _result_T_60 = $signed(_result_T_57) + $signed(_result_T_15);
  wire [63:0] _result_T_63 = $signed(_result_T_60) + $signed(_result_T_16);
  wire [63:0] _result_T_66 = $signed(_result_T_63) + $signed(_result_T_17);
  wire [63:0] _result_T_69 = $signed(_result_T_66) + $signed(_result_T_18);
  wire [63:0] _result_T_72 = $signed(_result_T_69) + $signed(_result_T_19);
  wire [63:0] _result_T_75 = $signed(_result_T_72) + $signed(_result_T_20);
  wire [63:0] _result_T_78 = $signed(_result_T_75) + $signed(_result_T_21);
  wire [63:0] _GEN_40 = insn[6:0] == 7'h3b ? $signed(_result_T_78) : $signed(result);
  assign rd = result[31:0];
  always @(posedge clock) begin
    if (reset) begin
      coeffs_0 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h0 == rs2[4:0]) begin
          coeffs_0 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_1 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h1 == rs2[4:0]) begin
          coeffs_1 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_2 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h2 == rs2[4:0]) begin
          coeffs_2 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_3 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h3 == rs2[4:0]) begin
          coeffs_3 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_4 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h4 == rs2[4:0]) begin
          coeffs_4 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_5 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h5 == rs2[4:0]) begin
          coeffs_5 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_6 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h6 == rs2[4:0]) begin
          coeffs_6 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_7 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h7 == rs2[4:0]) begin
          coeffs_7 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_8 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h8 == rs2[4:0]) begin
          coeffs_8 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_9 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h9 == rs2[4:0]) begin
          coeffs_9 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_10 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'ha == rs2[4:0]) begin
          coeffs_10 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_11 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'hb == rs2[4:0]) begin
          coeffs_11 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_12 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'hc == rs2[4:0]) begin
          coeffs_12 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_13 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'hd == rs2[4:0]) begin
          coeffs_13 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_14 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'he == rs2[4:0]) begin
          coeffs_14 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_15 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'hf == rs2[4:0]) begin
          coeffs_15 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_16 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h10 == rs2[4:0]) begin
          coeffs_16 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_17 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h11 == rs2[4:0]) begin
          coeffs_17 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_18 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h12 == rs2[4:0]) begin
          coeffs_18 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_19 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (5'h13 == rs2[4:0]) begin
          coeffs_19 <= rs1;
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
    if (reset) begin
      data_5 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_5 <= data_4;
        end
      end
    end
    if (reset) begin
      data_6 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_6 <= data_5;
        end
      end
    end
    if (reset) begin
      data_7 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_7 <= data_6;
        end
      end
    end
    if (reset) begin
      data_8 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_8 <= data_7;
        end
      end
    end
    if (reset) begin
      data_9 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_9 <= data_8;
        end
      end
    end
    if (reset) begin
      data_10 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_10 <= data_9;
        end
      end
    end
    if (reset) begin
      data_11 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_11 <= data_10;
        end
      end
    end
    if (reset) begin
      data_12 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_12 <= data_11;
        end
      end
    end
    if (reset) begin
      data_13 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_13 <= data_12;
        end
      end
    end
    if (reset) begin
      data_14 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_14 <= data_13;
        end
      end
    end
    if (reset) begin
      data_15 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_15 <= data_14;
        end
      end
    end
    if (reset) begin
      data_16 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_16 <= data_15;
        end
      end
    end
    if (reset) begin
      data_17 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_17 <= data_16;
        end
      end
    end
    if (reset) begin
      data_18 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_18 <= data_17;
        end
      end
    end
    if (reset) begin
      data_19 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_19 <= data_18;
        end
      end
    end
    if (reset) begin
      result <= 64'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        result <= {{32{_GEN_39[31]}},_GEN_39};
      end else if (insn[6:0] == 7'h2b) begin
        result <= {{32{data_0[31]}},data_0};
      end else begin
        result <= _GEN_40;
      end
    end
  end
endmodule
