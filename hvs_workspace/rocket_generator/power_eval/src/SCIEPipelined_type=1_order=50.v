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
  reg [31:0] coeffs_20;
  reg [31:0] coeffs_21;
  reg [31:0] coeffs_22;
  reg [31:0] coeffs_23;
  reg [31:0] coeffs_24;
  reg [31:0] coeffs_25;
  reg [31:0] coeffs_26;
  reg [31:0] coeffs_27;
  reg [31:0] coeffs_28;
  reg [31:0] coeffs_29;
  reg [31:0] coeffs_30;
  reg [31:0] coeffs_31;
  reg [31:0] coeffs_32;
  reg [31:0] coeffs_33;
  reg [31:0] coeffs_34;
  reg [31:0] coeffs_35;
  reg [31:0] coeffs_36;
  reg [31:0] coeffs_37;
  reg [31:0] coeffs_38;
  reg [31:0] coeffs_39;
  reg [31:0] coeffs_40;
  reg [31:0] coeffs_41;
  reg [31:0] coeffs_42;
  reg [31:0] coeffs_43;
  reg [31:0] coeffs_44;
  reg [31:0] coeffs_45;
  reg [31:0] coeffs_46;
  reg [31:0] coeffs_47;
  reg [31:0] coeffs_48;
  reg [31:0] coeffs_49;
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
  reg [31:0] data_20;
  reg [31:0] data_21;
  reg [31:0] data_22;
  reg [31:0] data_23;
  reg [31:0] data_24;
  reg [31:0] data_25;
  reg [31:0] data_26;
  reg [31:0] data_27;
  reg [31:0] data_28;
  reg [31:0] data_29;
  reg [31:0] data_30;
  reg [31:0] data_31;
  reg [31:0] data_32;
  reg [31:0] data_33;
  reg [31:0] data_34;
  reg [31:0] data_35;
  reg [31:0] data_36;
  reg [31:0] data_37;
  reg [31:0] data_38;
  reg [31:0] data_39;
  reg [31:0] data_40;
  reg [31:0] data_41;
  reg [31:0] data_42;
  reg [31:0] data_43;
  reg [31:0] data_44;
  reg [31:0] data_45;
  reg [31:0] data_46;
  reg [31:0] data_47;
  reg [31:0] data_48;
  reg [31:0] data_49;
  reg [63:0] result;
  wire [31:0] _GEN_51 = 6'h1 == rs2[5:0] ? $signed(coeffs_1) : $signed(coeffs_0);
  wire [31:0] _GEN_52 = 6'h2 == rs2[5:0] ? $signed(coeffs_2) : $signed(_GEN_51);
  wire [31:0] _GEN_53 = 6'h3 == rs2[5:0] ? $signed(coeffs_3) : $signed(_GEN_52);
  wire [31:0] _GEN_54 = 6'h4 == rs2[5:0] ? $signed(coeffs_4) : $signed(_GEN_53);
  wire [31:0] _GEN_55 = 6'h5 == rs2[5:0] ? $signed(coeffs_5) : $signed(_GEN_54);
  wire [31:0] _GEN_56 = 6'h6 == rs2[5:0] ? $signed(coeffs_6) : $signed(_GEN_55);
  wire [31:0] _GEN_57 = 6'h7 == rs2[5:0] ? $signed(coeffs_7) : $signed(_GEN_56);
  wire [31:0] _GEN_58 = 6'h8 == rs2[5:0] ? $signed(coeffs_8) : $signed(_GEN_57);
  wire [31:0] _GEN_59 = 6'h9 == rs2[5:0] ? $signed(coeffs_9) : $signed(_GEN_58);
  wire [31:0] _GEN_60 = 6'ha == rs2[5:0] ? $signed(coeffs_10) : $signed(_GEN_59);
  wire [31:0] _GEN_61 = 6'hb == rs2[5:0] ? $signed(coeffs_11) : $signed(_GEN_60);
  wire [31:0] _GEN_62 = 6'hc == rs2[5:0] ? $signed(coeffs_12) : $signed(_GEN_61);
  wire [31:0] _GEN_63 = 6'hd == rs2[5:0] ? $signed(coeffs_13) : $signed(_GEN_62);
  wire [31:0] _GEN_64 = 6'he == rs2[5:0] ? $signed(coeffs_14) : $signed(_GEN_63);
  wire [31:0] _GEN_65 = 6'hf == rs2[5:0] ? $signed(coeffs_15) : $signed(_GEN_64);
  wire [31:0] _GEN_66 = 6'h10 == rs2[5:0] ? $signed(coeffs_16) : $signed(_GEN_65);
  wire [31:0] _GEN_67 = 6'h11 == rs2[5:0] ? $signed(coeffs_17) : $signed(_GEN_66);
  wire [31:0] _GEN_68 = 6'h12 == rs2[5:0] ? $signed(coeffs_18) : $signed(_GEN_67);
  wire [31:0] _GEN_69 = 6'h13 == rs2[5:0] ? $signed(coeffs_19) : $signed(_GEN_68);
  wire [31:0] _GEN_70 = 6'h14 == rs2[5:0] ? $signed(coeffs_20) : $signed(_GEN_69);
  wire [31:0] _GEN_71 = 6'h15 == rs2[5:0] ? $signed(coeffs_21) : $signed(_GEN_70);
  wire [31:0] _GEN_72 = 6'h16 == rs2[5:0] ? $signed(coeffs_22) : $signed(_GEN_71);
  wire [31:0] _GEN_73 = 6'h17 == rs2[5:0] ? $signed(coeffs_23) : $signed(_GEN_72);
  wire [31:0] _GEN_74 = 6'h18 == rs2[5:0] ? $signed(coeffs_24) : $signed(_GEN_73);
  wire [31:0] _GEN_75 = 6'h19 == rs2[5:0] ? $signed(coeffs_25) : $signed(_GEN_74);
  wire [31:0] _GEN_76 = 6'h1a == rs2[5:0] ? $signed(coeffs_26) : $signed(_GEN_75);
  wire [31:0] _GEN_77 = 6'h1b == rs2[5:0] ? $signed(coeffs_27) : $signed(_GEN_76);
  wire [31:0] _GEN_78 = 6'h1c == rs2[5:0] ? $signed(coeffs_28) : $signed(_GEN_77);
  wire [31:0] _GEN_79 = 6'h1d == rs2[5:0] ? $signed(coeffs_29) : $signed(_GEN_78);
  wire [31:0] _GEN_80 = 6'h1e == rs2[5:0] ? $signed(coeffs_30) : $signed(_GEN_79);
  wire [31:0] _GEN_81 = 6'h1f == rs2[5:0] ? $signed(coeffs_31) : $signed(_GEN_80);
  wire [31:0] _GEN_82 = 6'h20 == rs2[5:0] ? $signed(coeffs_32) : $signed(_GEN_81);
  wire [31:0] _GEN_83 = 6'h21 == rs2[5:0] ? $signed(coeffs_33) : $signed(_GEN_82);
  wire [31:0] _GEN_84 = 6'h22 == rs2[5:0] ? $signed(coeffs_34) : $signed(_GEN_83);
  wire [31:0] _GEN_85 = 6'h23 == rs2[5:0] ? $signed(coeffs_35) : $signed(_GEN_84);
  wire [31:0] _GEN_86 = 6'h24 == rs2[5:0] ? $signed(coeffs_36) : $signed(_GEN_85);
  wire [31:0] _GEN_87 = 6'h25 == rs2[5:0] ? $signed(coeffs_37) : $signed(_GEN_86);
  wire [31:0] _GEN_88 = 6'h26 == rs2[5:0] ? $signed(coeffs_38) : $signed(_GEN_87);
  wire [31:0] _GEN_89 = 6'h27 == rs2[5:0] ? $signed(coeffs_39) : $signed(_GEN_88);
  wire [31:0] _GEN_90 = 6'h28 == rs2[5:0] ? $signed(coeffs_40) : $signed(_GEN_89);
  wire [31:0] _GEN_91 = 6'h29 == rs2[5:0] ? $signed(coeffs_41) : $signed(_GEN_90);
  wire [31:0] _GEN_92 = 6'h2a == rs2[5:0] ? $signed(coeffs_42) : $signed(_GEN_91);
  wire [31:0] _GEN_93 = 6'h2b == rs2[5:0] ? $signed(coeffs_43) : $signed(_GEN_92);
  wire [31:0] _GEN_94 = 6'h2c == rs2[5:0] ? $signed(coeffs_44) : $signed(_GEN_93);
  wire [31:0] _GEN_95 = 6'h2d == rs2[5:0] ? $signed(coeffs_45) : $signed(_GEN_94);
  wire [31:0] _GEN_96 = 6'h2e == rs2[5:0] ? $signed(coeffs_46) : $signed(_GEN_95);
  wire [31:0] _GEN_97 = 6'h2f == rs2[5:0] ? $signed(coeffs_47) : $signed(_GEN_96);
  wire [31:0] _GEN_98 = 6'h30 == rs2[5:0] ? $signed(coeffs_48) : $signed(_GEN_97);
  wire [31:0] _GEN_99 = 6'h31 == rs2[5:0] ? $signed(coeffs_49) : $signed(_GEN_98);
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
  wire [63:0] _result_T_22 = $signed(data_20) * $signed(coeffs_20);
  wire [63:0] _result_T_23 = $signed(data_21) * $signed(coeffs_21);
  wire [63:0] _result_T_24 = $signed(data_22) * $signed(coeffs_22);
  wire [63:0] _result_T_25 = $signed(data_23) * $signed(coeffs_23);
  wire [63:0] _result_T_26 = $signed(data_24) * $signed(coeffs_24);
  wire [63:0] _result_T_27 = $signed(data_25) * $signed(coeffs_25);
  wire [63:0] _result_T_28 = $signed(data_26) * $signed(coeffs_26);
  wire [63:0] _result_T_29 = $signed(data_27) * $signed(coeffs_27);
  wire [63:0] _result_T_30 = $signed(data_28) * $signed(coeffs_28);
  wire [63:0] _result_T_31 = $signed(data_29) * $signed(coeffs_29);
  wire [63:0] _result_T_32 = $signed(data_30) * $signed(coeffs_30);
  wire [63:0] _result_T_33 = $signed(data_31) * $signed(coeffs_31);
  wire [63:0] _result_T_34 = $signed(data_32) * $signed(coeffs_32);
  wire [63:0] _result_T_35 = $signed(data_33) * $signed(coeffs_33);
  wire [63:0] _result_T_36 = $signed(data_34) * $signed(coeffs_34);
  wire [63:0] _result_T_37 = $signed(data_35) * $signed(coeffs_35);
  wire [63:0] _result_T_38 = $signed(data_36) * $signed(coeffs_36);
  wire [63:0] _result_T_39 = $signed(data_37) * $signed(coeffs_37);
  wire [63:0] _result_T_40 = $signed(data_38) * $signed(coeffs_38);
  wire [63:0] _result_T_41 = $signed(data_39) * $signed(coeffs_39);
  wire [63:0] _result_T_42 = $signed(data_40) * $signed(coeffs_40);
  wire [63:0] _result_T_43 = $signed(data_41) * $signed(coeffs_41);
  wire [63:0] _result_T_44 = $signed(data_42) * $signed(coeffs_42);
  wire [63:0] _result_T_45 = $signed(data_43) * $signed(coeffs_43);
  wire [63:0] _result_T_46 = $signed(data_44) * $signed(coeffs_44);
  wire [63:0] _result_T_47 = $signed(data_45) * $signed(coeffs_45);
  wire [63:0] _result_T_48 = $signed(data_46) * $signed(coeffs_46);
  wire [63:0] _result_T_49 = $signed(data_47) * $signed(coeffs_47);
  wire [63:0] _result_T_50 = $signed(data_48) * $signed(coeffs_48);
  wire [63:0] _result_T_51 = $signed(data_49) * $signed(coeffs_49);
  wire [63:0] _result_T_54 = $signed(_result_T_2) + $signed(_result_T_3);
  wire [63:0] _result_T_57 = $signed(_result_T_54) + $signed(_result_T_4);
  wire [63:0] _result_T_60 = $signed(_result_T_57) + $signed(_result_T_5);
  wire [63:0] _result_T_63 = $signed(_result_T_60) + $signed(_result_T_6);
  wire [63:0] _result_T_66 = $signed(_result_T_63) + $signed(_result_T_7);
  wire [63:0] _result_T_69 = $signed(_result_T_66) + $signed(_result_T_8);
  wire [63:0] _result_T_72 = $signed(_result_T_69) + $signed(_result_T_9);
  wire [63:0] _result_T_75 = $signed(_result_T_72) + $signed(_result_T_10);
  wire [63:0] _result_T_78 = $signed(_result_T_75) + $signed(_result_T_11);
  wire [63:0] _result_T_81 = $signed(_result_T_78) + $signed(_result_T_12);
  wire [63:0] _result_T_84 = $signed(_result_T_81) + $signed(_result_T_13);
  wire [63:0] _result_T_87 = $signed(_result_T_84) + $signed(_result_T_14);
  wire [63:0] _result_T_90 = $signed(_result_T_87) + $signed(_result_T_15);
  wire [63:0] _result_T_93 = $signed(_result_T_90) + $signed(_result_T_16);
  wire [63:0] _result_T_96 = $signed(_result_T_93) + $signed(_result_T_17);
  wire [63:0] _result_T_99 = $signed(_result_T_96) + $signed(_result_T_18);
  wire [63:0] _result_T_102 = $signed(_result_T_99) + $signed(_result_T_19);
  wire [63:0] _result_T_105 = $signed(_result_T_102) + $signed(_result_T_20);
  wire [63:0] _result_T_108 = $signed(_result_T_105) + $signed(_result_T_21);
  wire [63:0] _result_T_111 = $signed(_result_T_108) + $signed(_result_T_22);
  wire [63:0] _result_T_114 = $signed(_result_T_111) + $signed(_result_T_23);
  wire [63:0] _result_T_117 = $signed(_result_T_114) + $signed(_result_T_24);
  wire [63:0] _result_T_120 = $signed(_result_T_117) + $signed(_result_T_25);
  wire [63:0] _result_T_123 = $signed(_result_T_120) + $signed(_result_T_26);
  wire [63:0] _result_T_126 = $signed(_result_T_123) + $signed(_result_T_27);
  wire [63:0] _result_T_129 = $signed(_result_T_126) + $signed(_result_T_28);
  wire [63:0] _result_T_132 = $signed(_result_T_129) + $signed(_result_T_29);
  wire [63:0] _result_T_135 = $signed(_result_T_132) + $signed(_result_T_30);
  wire [63:0] _result_T_138 = $signed(_result_T_135) + $signed(_result_T_31);
  wire [63:0] _result_T_141 = $signed(_result_T_138) + $signed(_result_T_32);
  wire [63:0] _result_T_144 = $signed(_result_T_141) + $signed(_result_T_33);
  wire [63:0] _result_T_147 = $signed(_result_T_144) + $signed(_result_T_34);
  wire [63:0] _result_T_150 = $signed(_result_T_147) + $signed(_result_T_35);
  wire [63:0] _result_T_153 = $signed(_result_T_150) + $signed(_result_T_36);
  wire [63:0] _result_T_156 = $signed(_result_T_153) + $signed(_result_T_37);
  wire [63:0] _result_T_159 = $signed(_result_T_156) + $signed(_result_T_38);
  wire [63:0] _result_T_162 = $signed(_result_T_159) + $signed(_result_T_39);
  wire [63:0] _result_T_165 = $signed(_result_T_162) + $signed(_result_T_40);
  wire [63:0] _result_T_168 = $signed(_result_T_165) + $signed(_result_T_41);
  wire [63:0] _result_T_171 = $signed(_result_T_168) + $signed(_result_T_42);
  wire [63:0] _result_T_174 = $signed(_result_T_171) + $signed(_result_T_43);
  wire [63:0] _result_T_177 = $signed(_result_T_174) + $signed(_result_T_44);
  wire [63:0] _result_T_180 = $signed(_result_T_177) + $signed(_result_T_45);
  wire [63:0] _result_T_183 = $signed(_result_T_180) + $signed(_result_T_46);
  wire [63:0] _result_T_186 = $signed(_result_T_183) + $signed(_result_T_47);
  wire [63:0] _result_T_189 = $signed(_result_T_186) + $signed(_result_T_48);
  wire [63:0] _result_T_192 = $signed(_result_T_189) + $signed(_result_T_49);
  wire [63:0] _result_T_195 = $signed(_result_T_192) + $signed(_result_T_50);
  wire [63:0] _result_T_198 = $signed(_result_T_195) + $signed(_result_T_51);
  wire [63:0] _GEN_100 = insn[6:0] == 7'h3b ? $signed(_result_T_198) : $signed(result);
  assign rd = result[31:0];
  always @(posedge clock) begin
    if (reset) begin
      coeffs_0 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h0 == rs2[5:0]) begin
          coeffs_0 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_1 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h1 == rs2[5:0]) begin
          coeffs_1 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_2 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h2 == rs2[5:0]) begin
          coeffs_2 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_3 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h3 == rs2[5:0]) begin
          coeffs_3 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_4 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h4 == rs2[5:0]) begin
          coeffs_4 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_5 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h5 == rs2[5:0]) begin
          coeffs_5 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_6 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h6 == rs2[5:0]) begin
          coeffs_6 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_7 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h7 == rs2[5:0]) begin
          coeffs_7 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_8 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h8 == rs2[5:0]) begin
          coeffs_8 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_9 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h9 == rs2[5:0]) begin
          coeffs_9 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_10 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'ha == rs2[5:0]) begin
          coeffs_10 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_11 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'hb == rs2[5:0]) begin
          coeffs_11 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_12 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'hc == rs2[5:0]) begin
          coeffs_12 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_13 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'hd == rs2[5:0]) begin
          coeffs_13 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_14 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'he == rs2[5:0]) begin
          coeffs_14 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_15 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'hf == rs2[5:0]) begin
          coeffs_15 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_16 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h10 == rs2[5:0]) begin
          coeffs_16 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_17 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h11 == rs2[5:0]) begin
          coeffs_17 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_18 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h12 == rs2[5:0]) begin
          coeffs_18 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_19 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h13 == rs2[5:0]) begin
          coeffs_19 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_20 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h14 == rs2[5:0]) begin
          coeffs_20 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_21 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h15 == rs2[5:0]) begin
          coeffs_21 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_22 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h16 == rs2[5:0]) begin
          coeffs_22 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_23 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h17 == rs2[5:0]) begin
          coeffs_23 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_24 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h18 == rs2[5:0]) begin
          coeffs_24 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_25 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h19 == rs2[5:0]) begin
          coeffs_25 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_26 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h1a == rs2[5:0]) begin
          coeffs_26 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_27 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h1b == rs2[5:0]) begin
          coeffs_27 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_28 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h1c == rs2[5:0]) begin
          coeffs_28 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_29 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h1d == rs2[5:0]) begin
          coeffs_29 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_30 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h1e == rs2[5:0]) begin
          coeffs_30 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_31 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h1f == rs2[5:0]) begin
          coeffs_31 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_32 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h20 == rs2[5:0]) begin
          coeffs_32 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_33 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h21 == rs2[5:0]) begin
          coeffs_33 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_34 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h22 == rs2[5:0]) begin
          coeffs_34 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_35 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h23 == rs2[5:0]) begin
          coeffs_35 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_36 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h24 == rs2[5:0]) begin
          coeffs_36 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_37 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h25 == rs2[5:0]) begin
          coeffs_37 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_38 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h26 == rs2[5:0]) begin
          coeffs_38 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_39 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h27 == rs2[5:0]) begin
          coeffs_39 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_40 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h28 == rs2[5:0]) begin
          coeffs_40 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_41 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h29 == rs2[5:0]) begin
          coeffs_41 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_42 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h2a == rs2[5:0]) begin
          coeffs_42 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_43 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h2b == rs2[5:0]) begin
          coeffs_43 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_44 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h2c == rs2[5:0]) begin
          coeffs_44 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_45 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h2d == rs2[5:0]) begin
          coeffs_45 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_46 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h2e == rs2[5:0]) begin
          coeffs_46 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_47 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h2f == rs2[5:0]) begin
          coeffs_47 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_48 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h30 == rs2[5:0]) begin
          coeffs_48 <= rs1;
        end
      end
    end
    if (reset) begin
      coeffs_49 <= 32'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        if (6'h31 == rs2[5:0]) begin
          coeffs_49 <= rs1;
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
      data_20 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_20 <= data_19;
        end
      end
    end
    if (reset) begin
      data_21 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_21 <= data_20;
        end
      end
    end
    if (reset) begin
      data_22 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_22 <= data_21;
        end
      end
    end
    if (reset) begin
      data_23 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_23 <= data_22;
        end
      end
    end
    if (reset) begin
      data_24 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_24 <= data_23;
        end
      end
    end
    if (reset) begin
      data_25 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_25 <= data_24;
        end
      end
    end
    if (reset) begin
      data_26 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_26 <= data_25;
        end
      end
    end
    if (reset) begin
      data_27 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_27 <= data_26;
        end
      end
    end
    if (reset) begin
      data_28 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_28 <= data_27;
        end
      end
    end
    if (reset) begin
      data_29 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_29 <= data_28;
        end
      end
    end
    if (reset) begin
      data_30 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_30 <= data_29;
        end
      end
    end
    if (reset) begin
      data_31 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_31 <= data_30;
        end
      end
    end
    if (reset) begin
      data_32 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_32 <= data_31;
        end
      end
    end
    if (reset) begin
      data_33 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_33 <= data_32;
        end
      end
    end
    if (reset) begin
      data_34 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_34 <= data_33;
        end
      end
    end
    if (reset) begin
      data_35 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_35 <= data_34;
        end
      end
    end
    if (reset) begin
      data_36 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_36 <= data_35;
        end
      end
    end
    if (reset) begin
      data_37 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_37 <= data_36;
        end
      end
    end
    if (reset) begin
      data_38 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_38 <= data_37;
        end
      end
    end
    if (reset) begin
      data_39 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_39 <= data_38;
        end
      end
    end
    if (reset) begin
      data_40 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_40 <= data_39;
        end
      end
    end
    if (reset) begin
      data_41 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_41 <= data_40;
        end
      end
    end
    if (reset) begin
      data_42 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_42 <= data_41;
        end
      end
    end
    if (reset) begin
      data_43 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_43 <= data_42;
        end
      end
    end
    if (reset) begin
      data_44 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_44 <= data_43;
        end
      end
    end
    if (reset) begin
      data_45 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_45 <= data_44;
        end
      end
    end
    if (reset) begin
      data_46 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_46 <= data_45;
        end
      end
    end
    if (reset) begin
      data_47 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_47 <= data_46;
        end
      end
    end
    if (reset) begin
      data_48 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_48 <= data_47;
        end
      end
    end
    if (reset) begin
      data_49 <= 32'sh0;
    end else if (valid) begin
      if (!(insn[6:0] == 7'hb)) begin
        if (insn[6:0] == 7'h2b) begin
          data_49 <= data_48;
        end
      end
    end
    if (reset) begin
      result <= 64'sh0;
    end else if (valid) begin
      if (insn[6:0] == 7'hb) begin
        result <= {{32{_GEN_99[31]}},_GEN_99};
      end else if (insn[6:0] == 7'h2b) begin
        result <= {{32{data_0[31]}},data_0};
      end else begin
        result <= _GEN_100;
      end
    end
  end
endmodule
