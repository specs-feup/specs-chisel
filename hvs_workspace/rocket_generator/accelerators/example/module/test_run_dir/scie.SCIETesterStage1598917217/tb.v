// SPDX-License-Identifier: Apache-2.0
// Example VCS Command: $VCS_HOME/bin/vcs -debug_pp -full64 +define+UNIT_DELAY +rad +v2k +vcs+lic+wait +vc+list +vcs+initreg+random +vcs+dumpvars+out.vcd tb.v SCIEUnpipelined.v ...
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
  wire signed [31:0] io_rd;

  always #`HALF_CLK_PERIOD clock = ~clock;

  initial begin
    #`RESET_TIME
    forever #`CLK_PERIOD cycle = cycle + 1;
  end

  SCIEUnpipelined SCIEUnpipelined(
    .clock(clock),
    .reset(reset),
    .io_rs2(io_rs2),
    .io_rs1(io_rs1),
    .io_insn(io_insn),
    .io_rd(io_rd));

  initial begin
    #`INIT_TIME reset = 0;
    io_insn = 7'd123;
    io_rs1 = -11;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 3'd7;
    `expect("io_rd",io_rd,7,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd39;
    `expect("io_rd",io_rd,39,cycle)
    io_insn = 7'd123;
    io_rs1 = -26;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -46;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -33;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -14;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -28;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -22;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd35;
    `expect("io_rd",io_rd,35,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd35;
    `expect("io_rd",io_rd,35,cycle)
    io_insn = 7'd123;
    io_rs1 = 4'd11;
    `expect("io_rd",io_rd,11,cycle)
    io_insn = 7'd123;
    io_rs1 = 5'd24;
    `expect("io_rd",io_rd,24,cycle)
    io_insn = 7'd123;
    io_rs1 = 5'd16;
    `expect("io_rd",io_rd,16,cycle)
    io_insn = 7'd123;
    io_rs1 = 5'd18;
    `expect("io_rd",io_rd,18,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd50;
    `expect("io_rd",io_rd,50,cycle)
    io_insn = 7'd123;
    io_rs1 = -26;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -40;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd48;
    `expect("io_rd",io_rd,48,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd40;
    `expect("io_rd",io_rd,40,cycle)
    io_insn = 7'd123;
    io_rs1 = -8;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 5'd22;
    `expect("io_rd",io_rd,22,cycle)
    io_insn = 7'd123;
    io_rs1 = -34;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -21;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -26;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -39;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 4'd11;
    `expect("io_rd",io_rd,11,cycle)
    io_insn = 7'd123;
    io_rs1 = -41;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd41;
    `expect("io_rd",io_rd,41,cycle)
    io_insn = 7'd123;
    io_rs1 = -14;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -3;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -23;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 4'd15;
    `expect("io_rd",io_rd,15,cycle)
    io_insn = 7'd123;
    io_rs1 = 4'd11;
    `expect("io_rd",io_rd,11,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd34;
    `expect("io_rd",io_rd,34,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd37;
    `expect("io_rd",io_rd,37,cycle)
    io_insn = 7'd123;
    io_rs1 = -21;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -47;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 4'd11;
    `expect("io_rd",io_rd,11,cycle)
    io_insn = 7'd123;
    io_rs1 = 4'd13;
    `expect("io_rd",io_rd,13,cycle)
    io_insn = 7'd123;
    io_rs1 = 5'd23;
    `expect("io_rd",io_rd,23,cycle)
    io_insn = 7'd123;
    io_rs1 = 5'd19;
    `expect("io_rd",io_rd,19,cycle)
    io_insn = 7'd123;
    io_rs1 = -42;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 1'd1;
    `expect("io_rd",io_rd,1,cycle)
    io_insn = 7'd123;
    io_rs1 = -38;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -31;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 5'd28;
    `expect("io_rd",io_rd,28,cycle)
    io_insn = 7'd123;
    io_rs1 = 4'd9;
    `expect("io_rd",io_rd,9,cycle)
    io_insn = 7'd123;
    io_rs1 = -22;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 4'd8;
    `expect("io_rd",io_rd,8,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd37;
    `expect("io_rd",io_rd,37,cycle)
    io_insn = 7'd123;
    io_rs1 = -46;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -14;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 5'd17;
    `expect("io_rd",io_rd,17,cycle)
    io_insn = 7'd123;
    io_rs1 = -20;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 5'd29;
    `expect("io_rd",io_rd,29,cycle)
    io_insn = 7'd123;
    io_rs1 = 5'd22;
    `expect("io_rd",io_rd,22,cycle)
    io_insn = 7'd123;
    io_rs1 = -29;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 5'd28;
    `expect("io_rd",io_rd,28,cycle)
    io_insn = 7'd123;
    io_rs1 = -27;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -5;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -25;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd41;
    `expect("io_rd",io_rd,41,cycle)
    io_insn = 7'd123;
    io_rs1 = -28;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -13;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 2'd3;
    `expect("io_rd",io_rd,3,cycle)
    io_insn = 7'd123;
    io_rs1 = 5'd26;
    `expect("io_rd",io_rd,26,cycle)
    io_insn = 7'd123;
    io_rs1 = 2'd2;
    `expect("io_rd",io_rd,2,cycle)
    io_insn = 7'd123;
    io_rs1 = 4'd11;
    `expect("io_rd",io_rd,11,cycle)
    io_insn = 7'd123;
    io_rs1 = 2'd3;
    `expect("io_rd",io_rd,3,cycle)
    io_insn = 7'd123;
    io_rs1 = -17;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -2;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd43;
    `expect("io_rd",io_rd,43,cycle)
    io_insn = 7'd123;
    io_rs1 = -36;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -46;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd41;
    `expect("io_rd",io_rd,41,cycle)
    io_insn = 7'd123;
    io_rs1 = -33;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 3'd6;
    `expect("io_rd",io_rd,6,cycle)
    io_insn = 7'd123;
    io_rs1 = 4'd14;
    `expect("io_rd",io_rd,14,cycle)
    io_insn = 7'd123;
    io_rs1 = 1'd0;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 5'd26;
    `expect("io_rd",io_rd,26,cycle)
    io_insn = 7'd123;
    io_rs1 = -22;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd40;
    `expect("io_rd",io_rd,40,cycle)
    io_insn = 7'd123;
    io_rs1 = -6;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -23;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -3;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -28;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -47;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -1;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -48;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -8;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -45;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd32;
    `expect("io_rd",io_rd,32,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd49;
    `expect("io_rd",io_rd,49,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd48;
    `expect("io_rd",io_rd,48,cycle)
    io_insn = 7'd123;
    io_rs1 = 1'd1;
    `expect("io_rd",io_rd,1,cycle)
    io_insn = 7'd123;
    io_rs1 = 6'd49;
    `expect("io_rd",io_rd,49,cycle)
    io_insn = 7'd123;
    io_rs1 = 4'd15;
    `expect("io_rd",io_rd,15,cycle)
    io_insn = 7'd123;
    io_rs1 = -28;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -41;
    `expect("io_rd",io_rd,0,cycle)

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule