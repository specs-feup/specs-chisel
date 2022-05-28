module SCIEtop(input clock, 
input reset,
input [31:0] insn,
input [31:0] rs1,
input [31:0] rs2,
output [31:0] rd);

wire unpipelined_wire, pipelined_wire, multicycle_wire;

SCIEDecoder sciedecoder(.insn(insn), .unpipelined(unpipelined_wire), .pipelined(pipelined_wire), .multicycle(multicycle_wire));

SCIEPipelined sciepipelined(.clock(clock), .reset(reset), .valid(pipelined_wire), .insn(insn), .rs1(rs1), .rs2(rs2), .rd(rd));

endmodule
