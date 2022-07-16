module ALU(
  input         clock,
  input         reset,
  input         io_dw,
  input  [3:0]  io_fn,
  input  [31:0] io_in2,
  input  [31:0] io_in1,
  output [31:0] io_out,
  output [31:0] io_adder_out,
  output        io_cmp_out
);
  wire [31:0] _in2_inv_T_1 = ~io_in2; // @[ALU.scala 99:35]
  wire [31:0] in2_inv = io_fn[3] ? _in2_inv_T_1 : io_in2; // @[ALU.scala 99:20]
  wire [31:0] in1_xor_in2 = io_in1 ^ in2_inv; // @[ALU.scala 100:28]
  wire [31:0] _io_adder_out_T_1 = io_in1 + in2_inv; // @[ALU.scala 101:26]
  wire [31:0] _GEN_0 = {{31'd0}, io_fn[3]}; // @[ALU.scala 101:36]
  wire  _slt_T_7 = io_fn[1] ? io_in2[31] : io_in1[31]; // @[ALU.scala 106:8]
  wire  slt = io_in1[31] == io_in2[31] ? io_adder_out[31] : _slt_T_7; // @[ALU.scala 105:8]
  wire  _io_cmp_out_T_2 = ~io_fn[3]; // @[ALU.scala 82:26]
  wire  _io_cmp_out_T_4 = _io_cmp_out_T_2 ? in1_xor_in2 == 32'h0 : slt; // @[ALU.scala 107:41]
  wire [4:0] shamt = io_in2[4:0]; // @[ALU.scala 111:28]
  wire  _shin_T_2 = io_fn == 4'h5 | io_fn == 4'hb; // @[ALU.scala 119:35]
  wire [31:0] _GEN_1 = {{16'd0}, io_in1[31:16]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_6 = _GEN_1 & 32'hffff; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_8 = {io_in1[15:0], 16'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_10 = _shin_T_8 & 32'hffff0000; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_11 = _shin_T_6 | _shin_T_10; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_2 = {{8'd0}, _shin_T_11[31:8]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_16 = _GEN_2 & 32'hff00ff; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_18 = {_shin_T_11[23:0], 8'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_20 = _shin_T_18 & 32'hff00ff00; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_21 = _shin_T_16 | _shin_T_20; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_3 = {{4'd0}, _shin_T_21[31:4]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_26 = _GEN_3 & 32'hf0f0f0f; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_28 = {_shin_T_21[27:0], 4'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_30 = _shin_T_28 & 32'hf0f0f0f0; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_31 = _shin_T_26 | _shin_T_30; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_4 = {{2'd0}, _shin_T_31[31:2]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_36 = _GEN_4 & 32'h33333333; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_38 = {_shin_T_31[29:0], 2'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_40 = _shin_T_38 & 32'hcccccccc; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_41 = _shin_T_36 | _shin_T_40; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_5 = {{1'd0}, _shin_T_41[31:1]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_46 = _GEN_5 & 32'h55555555; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_48 = {_shin_T_41[30:0], 1'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_50 = _shin_T_48 & 32'haaaaaaaa; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_51 = _shin_T_46 | _shin_T_50; // @[Bitwise.scala 105:39]
  wire [31:0] shin = io_fn == 4'h5 | io_fn == 4'hb ? io_in1 : _shin_T_51; // @[ALU.scala 119:17]
  wire  _shout_r_T_2 = io_fn[3] & shin[31]; // @[ALU.scala 120:35]
  wire [32:0] _shout_r_T_4 = {_shout_r_T_2,shin}; // @[ALU.scala 120:57]
  wire [32:0] _shout_r_T_5 = $signed(_shout_r_T_4) >>> shamt; // @[ALU.scala 120:64]
  wire [31:0] shout_r = _shout_r_T_5[31:0]; // @[ALU.scala 120:73]
  wire [31:0] _GEN_6 = {{16'd0}, shout_r[31:16]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shout_l_T_3 = _GEN_6 & 32'hffff; // @[Bitwise.scala 105:31]
  wire [31:0] _shout_l_T_5 = {shout_r[15:0], 16'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shout_l_T_7 = _shout_l_T_5 & 32'hffff0000; // @[Bitwise.scala 105:80]
  wire [31:0] _shout_l_T_8 = _shout_l_T_3 | _shout_l_T_7; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_7 = {{8'd0}, _shout_l_T_8[31:8]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shout_l_T_13 = _GEN_7 & 32'hff00ff; // @[Bitwise.scala 105:31]
  wire [31:0] _shout_l_T_15 = {_shout_l_T_8[23:0], 8'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shout_l_T_17 = _shout_l_T_15 & 32'hff00ff00; // @[Bitwise.scala 105:80]
  wire [31:0] _shout_l_T_18 = _shout_l_T_13 | _shout_l_T_17; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_8 = {{4'd0}, _shout_l_T_18[31:4]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shout_l_T_23 = _GEN_8 & 32'hf0f0f0f; // @[Bitwise.scala 105:31]
  wire [31:0] _shout_l_T_25 = {_shout_l_T_18[27:0], 4'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shout_l_T_27 = _shout_l_T_25 & 32'hf0f0f0f0; // @[Bitwise.scala 105:80]
  wire [31:0] _shout_l_T_28 = _shout_l_T_23 | _shout_l_T_27; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_9 = {{2'd0}, _shout_l_T_28[31:2]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shout_l_T_33 = _GEN_9 & 32'h33333333; // @[Bitwise.scala 105:31]
  wire [31:0] _shout_l_T_35 = {_shout_l_T_28[29:0], 2'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shout_l_T_37 = _shout_l_T_35 & 32'hcccccccc; // @[Bitwise.scala 105:80]
  wire [31:0] _shout_l_T_38 = _shout_l_T_33 | _shout_l_T_37; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_10 = {{1'd0}, _shout_l_T_38[31:1]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shout_l_T_43 = _GEN_10 & 32'h55555555; // @[Bitwise.scala 105:31]
  wire [31:0] _shout_l_T_45 = {_shout_l_T_38[30:0], 1'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shout_l_T_47 = _shout_l_T_45 & 32'haaaaaaaa; // @[Bitwise.scala 105:80]
  wire [31:0] shout_l = _shout_l_T_43 | _shout_l_T_47; // @[Bitwise.scala 105:39]
  wire [31:0] _shout_T_3 = _shin_T_2 ? shout_r : 32'h0; // @[ALU.scala 122:18]
  wire [31:0] _shout_T_5 = io_fn == 4'h1 ? shout_l : 32'h0; // @[ALU.scala 123:18]
  wire [31:0] shout = _shout_T_3 | _shout_T_5; // @[ALU.scala 122:70]
  wire  _logic_T_1 = io_fn == 4'h6; // @[ALU.scala 126:45]
  wire [31:0] _logic_T_3 = io_fn == 4'h4 | io_fn == 4'h6 ? in1_xor_in2 : 32'h0; // @[ALU.scala 126:18]
  wire [31:0] _logic_T_7 = io_in1 & io_in2; // @[ALU.scala 127:63]
  wire [31:0] _logic_T_8 = _logic_T_1 | io_fn == 4'h7 ? _logic_T_7 : 32'h0; // @[ALU.scala 127:18]
  wire [31:0] logic_ = _logic_T_3 | _logic_T_8; // @[ALU.scala 126:74]
  wire  _shift_logic_T = io_fn >= 4'hc; // @[ALU.scala 79:30]
  wire  _shift_logic_T_1 = _shift_logic_T & slt; // @[ALU.scala 128:35]
  wire [31:0] _GEN_11 = {{31'd0}, _shift_logic_T_1}; // @[ALU.scala 128:43]
  wire [31:0] _shift_logic_T_2 = _GEN_11 | logic_; // @[ALU.scala 128:43]
  wire [31:0] shift_logic = _shift_logic_T_2 | shout; // @[ALU.scala 128:51]
  assign io_out = io_fn == 4'h0 | io_fn == 4'ha ? io_adder_out : shift_logic; // @[ALU.scala 129:16]
  assign io_adder_out = _io_adder_out_T_1 + _GEN_0; // @[ALU.scala 101:36]
  assign io_cmp_out = io_fn[0] ^ _io_cmp_out_T_4; // @[ALU.scala 107:36]
endmodule
