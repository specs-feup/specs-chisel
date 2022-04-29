// SPDX-License-Identifier: Apache-2.0
// Example VCS Command: $VCS_HOME/bin/vcs -debug_pp -full64 +define+UNIT_DELAY +rad +v2k +vcs+lic+wait +vc+list +vcs+initreg+random +vcs+dumpvars+out.vcd tb.v SCIEPipelined.v ...
`timescale 100ps / 10ps

`define CLK_PERIOD 1

`define HALF_CLK_PERIOD 0.5
`define RESET_TIME 5
`define INIT_TIME 5.5
`define expect(nodeName, nodeVal, expVal, cycle) if (nodeVal !== expVal) begin \
  $display("\t ASSERTION ON %s FAILED @ CYCLE = %d, 0x%h != EXPECTED 0x%h", \
  nodeName,cycle,nodeVal,expVal); $stop; end

module testbench_v;

  integer cycle = 0;

  reg clock = 1;
  reg reset = 1;
  reg[31:0] io_rs2 = 0;
  reg signed [31:0] io_rs1 = 0;
  reg[31:0] io_insn = 0;
  reg[0:0] io_valid = 0;
  wire signed [31:0] io_rd;

  always #`HALF_CLK_PERIOD clock = ~clock;

  initial begin
    #`RESET_TIME
    forever #`CLK_PERIOD cycle = cycle + 1;
  end

  SCIEPipelined SCIEPipelined(
    .clock(clock),
    .reset(reset),
    .io_rs2(io_rs2),
    .io_rs1(io_rs1),
    .io_insn(io_insn),
    .io_valid(io_valid),
    .io_rd(io_rd));

  initial begin
    #`INIT_TIME reset = 0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1 = 14'd10113;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1 = 10'd886;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1 = 16'd41642;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1 = 16'd52288;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1 = 15'd29160;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_insn = 6'd43;
    io_rs1 = 13'd8154;
    #(1*`CLK_PERIOD)     io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd",io_rd,0,cycle)
    `expect("io_rd",io_rd,0,cycle)
    io_valid = 1'd0;
    io_insn = 6'd43;
    io_rs1 = 14'd11785;
    #(1*`CLK_PERIOD)     io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd",io_rd,0,cycle)
    `expect("io_rd",io_rd,0,cycle)
    io_valid = 1'd0;
    io_insn = 6'd43;
    io_rs1 = 16'd43313;
    #(1*`CLK_PERIOD)     io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd",io_rd,0,cycle)
    `expect("io_rd",io_rd,0,cycle)
    io_valid = 1'd0;
    io_insn = 6'd43;
    io_rs1 = 16'd41013;
    #(1*`CLK_PERIOD)     io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd",io_rd,0,cycle)
    `expect("io_rd",io_rd,0,cycle)
    io_valid = 1'd0;
    io_insn = 6'd43;
    io_rs1 = 16'd62085;
    #(1*`CLK_PERIOD)     io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd",io_rd,0,cycle)
    `expect("io_rd",io_rd,0,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule