module system_top(
  input clock,
  input reset,
  input [31:0] insn,
  input [31:0] rs1,
  input [31:0] rs2,
  input  dw,
  input [3:0] fn,
  input [31:0] mul_rs1,
  input [31:0] mul_rs2,
  output io_req_ready,
  input io_req_valid,
  input  [3:0]  io_req_bits_fn,
  input         io_req_bits_dw,
  input  [4:0]  io_req_bits_tag, 
  input         io_kill,
  input         io_resp_ready,
  output        io_resp_valid,
  output [31:0] io_resp_bits_data,
  output [4:0]  io_resp_bits_tag,
  output [31:0] scie_result,
  output [31:0] dummy_result,
  output [31:0] alu_result,
  output [31:0] adder_result,
  output cmp_result
);

wire pipelined, unpipelined, multicycle;

SCIEDecoder sciedecoder(.insn(insn), .unpipelined(unpipelined), .pipelined(pipelined), .multicycle(multicycle));

SCIEPipelined sciepipelined(.clock(clock), .reset(reset), .valid(pipelined), .insn(insn), .rs1(rs1), .rs2(rs2), .rd(scie_result));

SCIEUnpipelined scieunpipelined(.insn(insn), .rs1(rs1), .rs2(rs2), .rd(dummy_result));

ALU alu( .clock(clock), .reset(reset), .io_dw(dw), .io_fn(fn), .io_in1(rs1), .io_in2(rs2), .io_out(alu_result), .io_adder_out(adder_result), .io_cmp_out(cmp_result) );

MulDiv muldiv (.clock(clock), .reset(reset), .io_req_ready(io_req_ready), .io_req_valid(io_req_valid), .io_req_bits_fn(io_req_bits_fn), .io_req_bits_dw(io_req_bits_dw), .io_req_bits_in1(mul_rs1), .io_req_bits_in2(mul_rs2), .io_req_bits_tag(io_req_bits_tag), .io_kill(io_kill), .io_resp_ready(io_resp_ready), .io_resp_valid(io_resp_valid), .io_resp_bits_data(io_resp_bits_data), .io_resp_bits_tag(io_resp_bits_tag) );

endmodule

