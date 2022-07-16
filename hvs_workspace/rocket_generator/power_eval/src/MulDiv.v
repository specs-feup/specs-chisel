module MulDiv(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [3:0]  io_req_bits_fn,
  input         io_req_bits_dw,
  input  [31:0] io_req_bits_in1,
  input  [31:0] io_req_bits_in2,
  input  [4:0]  io_req_bits_tag,
  input         io_kill,
  input         io_resp_ready,
  output        io_resp_valid,
  output [31:0] io_resp_bits_data,
  output [4:0]  io_resp_bits_tag
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [95:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[mult.scala 195:22]
  reg [4:0] req_tag; // @[mult.scala 197:16]
  reg [5:0] count; // @[mult.scala 198:18]
  reg  neg_out; // @[mult.scala 201:20]
  reg  isHi; // @[mult.scala 202:17]
  reg  resHi; // @[mult.scala 203:18]
  reg [32:0] divisor; // @[mult.scala 204:20]
  reg [65:0] remainder; // @[mult.scala 205:22]
  wire [2:0] decoded_plaInput = io_req_bits_fn[2:0]; // @[decoder.scala 38:16 pla.scala 77:22]
  wire [2:0] decoded_invInputs = ~decoded_plaInput; // @[pla.scala 78:21]
  wire  decoded_andMatrixInput_0 = decoded_invInputs[0]; // @[pla.scala 91:29]
  wire  _decoded_T = &decoded_andMatrixInput_0; // @[pla.scala 98:74]
  wire  decoded_andMatrixInput_0_1 = decoded_invInputs[2]; // @[pla.scala 91:29]
  wire  _decoded_T_1 = &decoded_andMatrixInput_0_1; // @[pla.scala 98:74]
  wire  decoded_andMatrixInput_0_2 = decoded_invInputs[1]; // @[pla.scala 91:29]
  wire [1:0] _decoded_T_2 = {decoded_andMatrixInput_0_2,decoded_andMatrixInput_0_1}; // @[Cat.scala 31:58]
  wire  _decoded_T_3 = &_decoded_T_2; // @[pla.scala 98:74]
  wire  decoded_andMatrixInput_0_3 = decoded_plaInput[0]; // @[pla.scala 90:45]
  wire [1:0] _decoded_T_4 = {decoded_andMatrixInput_0_3,decoded_andMatrixInput_0_1}; // @[Cat.scala 31:58]
  wire  _decoded_T_5 = &_decoded_T_4; // @[pla.scala 98:74]
  wire  decoded_andMatrixInput_0_4 = decoded_plaInput[1]; // @[pla.scala 90:45]
  wire  _decoded_T_6 = &decoded_andMatrixInput_0_4; // @[pla.scala 98:74]
  wire  decoded_andMatrixInput_1_2 = decoded_plaInput[2]; // @[pla.scala 90:45]
  wire [1:0] _decoded_T_7 = {decoded_andMatrixInput_0,decoded_andMatrixInput_1_2}; // @[Cat.scala 31:58]
  wire  _decoded_T_8 = &_decoded_T_7; // @[pla.scala 98:74]
  wire [1:0] _decoded_orMatrixOutputs_T = {_decoded_T_3,_decoded_T_8}; // @[Cat.scala 31:58]
  wire  _decoded_orMatrixOutputs_T_1 = |_decoded_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [1:0] _decoded_orMatrixOutputs_T_2 = {_decoded_T,_decoded_T_3}; // @[Cat.scala 31:58]
  wire  _decoded_orMatrixOutputs_T_3 = |_decoded_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire [1:0] _decoded_orMatrixOutputs_T_4 = {_decoded_T_5,_decoded_T_6}; // @[Cat.scala 31:58]
  wire  _decoded_orMatrixOutputs_T_5 = |_decoded_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire  _decoded_orMatrixOutputs_T_6 = |_decoded_T_1; // @[pla.scala 114:39]
  wire [3:0] decoded_orMatrixOutputs = {_decoded_orMatrixOutputs_T_6,_decoded_orMatrixOutputs_T_5,
    _decoded_orMatrixOutputs_T_3,_decoded_orMatrixOutputs_T_1}; // @[Cat.scala 31:58]
  wire [3:0] decoded_invMatrixOutputs = {decoded_orMatrixOutputs[3],decoded_orMatrixOutputs[2],decoded_orMatrixOutputs[1
    ],decoded_orMatrixOutputs[0]}; // @[Cat.scala 31:58]
  wire  cmdMul = decoded_invMatrixOutputs[3]; // @[mult.scala 68:77]
  wire  cmdHi = decoded_invMatrixOutputs[2]; // @[mult.scala 68:77]
  wire  lhsSigned = decoded_invMatrixOutputs[1]; // @[mult.scala 68:77]
  wire  rhsSigned = decoded_invMatrixOutputs[0]; // @[mult.scala 68:77]
  wire  lhs_sign = lhsSigned & io_req_bits_in1[31]; // @[mult.scala 225:23]
  wire [15:0] hi = io_req_bits_in1[31:16]; // @[mult.scala 226:43]
  wire [31:0] lhs_in = {hi,io_req_bits_in1[15:0]}; // @[Cat.scala 31:58]
  wire  rhs_sign = rhsSigned & io_req_bits_in2[31]; // @[mult.scala 225:23]
  wire [15:0] hi_1 = io_req_bits_in2[31:16]; // @[mult.scala 226:43]
  wire [32:0] subtractor = remainder[64:32] - divisor; // @[mult.scala 232:37]
  wire [31:0] result = resHi ? remainder[64:33] : remainder[31:0]; // @[mult.scala 233:19]
  wire [31:0] negated_remainder = 32'h0 - result; // @[mult.scala 234:27]
  wire [65:0] _GEN_0 = remainder[31] ? {{34'd0}, negated_remainder} : remainder; // @[mult.scala 237:27 238:17 205:22]
  wire [65:0] _GEN_2 = state == 3'h1 ? _GEN_0 : remainder; // @[mult.scala 205:22 236:45]
  wire [2:0] _GEN_4 = state == 3'h1 ? 3'h3 : state; // @[mult.scala 236:45 243:11 195:22]
  wire [2:0] _GEN_6 = state == 3'h5 ? 3'h7 : _GEN_4; // @[mult.scala 245:45 247:11]
  wire  _GEN_7 = state == 3'h5 ? 1'h0 : resHi; // @[mult.scala 245:45 248:11 203:18]
  wire [64:0] mulReg = {remainder[65:33],remainder[31:0]}; // @[Cat.scala 31:58]
  wire  mplierSign = remainder[32]; // @[mult.scala 252:31]
  wire [31:0] mplier = mulReg[31:0]; // @[mult.scala 253:24]
  wire [32:0] accum = mulReg[64:32]; // @[mult.scala 254:37]
  wire [8:0] _prod_T_2 = {mplierSign,mplier[7:0]}; // @[mult.scala 256:48]
  wire [41:0] _prod_T_3 = $signed(_prod_T_2) * $signed(divisor); // @[mult.scala 256:55]
  wire [41:0] _GEN_35 = {{9{accum[32]}},accum}; // @[mult.scala 256:64]
  wire [41:0] nextMulReg_hi = $signed(_prod_T_3) + $signed(_GEN_35); // @[Cat.scala 31:58]
  wire [65:0] nextMulReg = {nextMulReg_hi,mplier[31:8]}; // @[Cat.scala 31:58]
  wire  nextMplierSign = count == 6'h2 & neg_out; // @[mult.scala 258:45]
  wire [64:0] nextMulReg1 = {nextMulReg[64:32],nextMulReg[31:0]}; // @[Cat.scala 31:58]
  wire [65:0] _remainder_T_2 = {nextMulReg1[64:32],nextMplierSign,nextMulReg1[31:0]}; // @[Cat.scala 31:58]
  wire [5:0] _count_T_1 = count + 6'h1; // @[mult.scala 268:20]
  wire [2:0] _GEN_8 = count == 6'h3 ? 3'h6 : _GEN_6; // @[mult.scala 269:39 270:13]
  wire  _GEN_9 = count == 6'h3 ? isHi : _GEN_7; // @[mult.scala 269:39 271:13]
  wire [2:0] _GEN_12 = state == 3'h2 ? _GEN_8 : _GEN_6; // @[mult.scala 250:38]
  wire  _GEN_13 = state == 3'h2 ? _GEN_9 : _GEN_7; // @[mult.scala 250:38]
  wire  unrolls_less = subtractor[32]; // @[mult.scala 278:28]
  wire [31:0] _unrolls_T_2 = unrolls_less ? remainder[63:32] : subtractor[31:0]; // @[mult.scala 279:14]
  wire  _unrolls_T_4 = ~unrolls_less; // @[mult.scala 279:67]
  wire [64:0] unrolls_0 = {_unrolls_T_2,remainder[31:0],_unrolls_T_4}; // @[Cat.scala 31:58]
  wire [2:0] _state_T = neg_out ? 3'h5 : 3'h7; // @[mult.scala 284:19]
  wire [2:0] _GEN_14 = count == 6'h20 ? _state_T : _GEN_12; // @[mult.scala 283:26 284:13]
  wire  divby0 = count == 6'h0 & _unrolls_T_4; // @[mult.scala 291:30]
  wire  _T_21 = io_resp_ready & io_resp_valid; // @[Decoupled.scala 50:35]
  wire  _T_23 = io_req_ready & io_req_valid; // @[Decoupled.scala 50:35]
  wire [32:0] _divisor_T = {rhs_sign,hi_1,io_req_bits_in2[15:0]}; // @[Cat.scala 31:58]
  wire [15:0] loOut = result[15:0]; // @[mult.scala 321:82]
  assign io_req_ready = state == 3'h0; // @[mult.scala 327:25]
  assign io_resp_valid = state == 3'h6 | state == 3'h7; // @[mult.scala 326:42]
  assign io_resp_bits_data = {result[31:16],loOut}; // @[Cat.scala 31:58]
  assign io_resp_bits_tag = req_tag; // @[mult.scala 323:20]
  always @(posedge clock) begin
    if (reset) begin // @[mult.scala 195:22]
      state <= 3'h0; // @[mult.scala 195:22]
    end else if (_T_23) begin // @[mult.scala 309:24]
      if (cmdMul) begin // @[mult.scala 310:17]
        state <= 3'h2;
      end else if (lhs_sign | rhs_sign) begin // @[mult.scala 310:36]
        state <= 3'h1;
      end else begin
        state <= 3'h3;
      end
    end else if (_T_21 | io_kill) begin // @[mult.scala 306:36]
      state <= 3'h0; // @[mult.scala 307:11]
    end else if (state == 3'h3) begin // @[mult.scala 274:38]
      state <= _GEN_14;
    end else begin
      state <= _GEN_12;
    end
    if (_T_23) begin // @[mult.scala 309:24]
      req_tag <= io_req_bits_tag; // @[mult.scala 317:9]
    end
    if (_T_23) begin // @[mult.scala 309:24]
      count <= 6'h0; // @[mult.scala 313:11]
    end else if (state == 3'h3) begin // @[mult.scala 274:38]
      count <= _count_T_1; // @[mult.scala 289:11]
    end else if (state == 3'h2) begin // @[mult.scala 250:38]
      count <= _count_T_1; // @[mult.scala 268:11]
    end
    if (_T_23) begin // @[mult.scala 309:24]
      if (cmdHi) begin // @[mult.scala 314:19]
        neg_out <= lhs_sign;
      end else begin
        neg_out <= lhs_sign != rhs_sign;
      end
    end else if (state == 3'h3) begin // @[mult.scala 274:38]
      if (divby0 & ~isHi) begin // @[mult.scala 304:28]
        neg_out <= 1'h0; // @[mult.scala 304:38]
      end
    end
    if (_T_23) begin // @[mult.scala 309:24]
      isHi <= cmdHi; // @[mult.scala 311:10]
    end
    if (_T_23) begin // @[mult.scala 309:24]
      resHi <= 1'h0; // @[mult.scala 312:11]
    end else if (state == 3'h3) begin // @[mult.scala 274:38]
      if (count == 6'h20) begin // @[mult.scala 283:26]
        resHi <= isHi; // @[mult.scala 285:13]
      end else begin
        resHi <= _GEN_13;
      end
    end else begin
      resHi <= _GEN_13;
    end
    if (_T_23) begin // @[mult.scala 309:24]
      divisor <= _divisor_T; // @[mult.scala 315:13]
    end else if (state == 3'h1) begin // @[mult.scala 236:45]
      if (divisor[31]) begin // @[mult.scala 240:25]
        divisor <= subtractor; // @[mult.scala 241:15]
      end
    end
    if (_T_23) begin // @[mult.scala 309:24]
      remainder <= {{34'd0}, lhs_in}; // @[mult.scala 316:15]
    end else if (state == 3'h3) begin // @[mult.scala 274:38]
      remainder <= {{1'd0}, unrolls_0}; // @[mult.scala 282:15]
    end else if (state == 3'h2) begin // @[mult.scala 250:38]
      remainder <= _remainder_T_2; // @[mult.scala 266:15]
    end else if (state == 3'h5) begin // @[mult.scala 245:45]
      remainder <= {{34'd0}, negated_remainder}; // @[mult.scala 246:15]
    end else begin
      remainder <= _GEN_2;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  req_tag = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  count = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  neg_out = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  isHi = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  resHi = _RAND_5[0:0];
  _RAND_6 = {2{`RANDOM}};
  divisor = _RAND_6[32:0];
  _RAND_7 = {3{`RANDOM}};
  remainder = _RAND_7[65:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
