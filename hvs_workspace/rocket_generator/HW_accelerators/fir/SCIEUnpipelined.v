module SCIEUnpipelined #(parameter XLEN = 32)(
  input  [31:0] insn,
  input  [31:0] rs1,
  input  [31:0] rs2,
  output [31:0] rd
);
  assign rd = 32'h0;
endmodule
