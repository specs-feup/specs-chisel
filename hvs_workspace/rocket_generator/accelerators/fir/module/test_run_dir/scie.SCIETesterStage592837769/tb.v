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
  reg signed [15:0] io_rs1_imag = 0;
  reg signed [15:0] io_rs1_real = 0;
  reg[31:0] io_insn = 0;
  reg[0:0] io_valid = 0;
  wire signed [15:0] io_rd_imag;
  wire signed [15:0] io_rd_real;

  always #`HALF_CLK_PERIOD clock = ~clock;

  initial begin
    #`RESET_TIME
    forever #`CLK_PERIOD cycle = cycle + 1;
  end

  SCIEPipelined SCIEPipelined(
    .clock(clock),
    .reset(reset),
    .io_rs2(io_rs2),
    .io_rs1_imag(io_rs1_imag),
    .io_rs1_real(io_rs1_real),
    .io_insn(io_insn),
    .io_valid(io_valid),
    .io_rd_imag(io_rd_imag),
    .io_rd_real(io_rd_real));

  initial begin
    #`INIT_TIME reset = 0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 5'd25;
    io_rs1_imag = 2'd2;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -36;
    io_rs1_imag = 6'd34;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -37;
    io_rs1_imag = -49;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 6'd48;
    io_rs1_imag = 6'd39;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 6'd44;
    io_rs1_imag = 6'd41;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -9;
    io_rs1_imag = -3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-219,cycle)
    `expect("io_rd_imag",io_rd_imag,-93,cycle)
    `expect("io_rd_real",io_rd_real,-219,cycle)
    `expect("io_rd_imag",io_rd_imag,-93,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd14;
    io_rs1_imag = -40;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,856,cycle)
    `expect("io_rd_imag",io_rd_imag,-1170,cycle)
    `expect("io_rd_real",io_rd_real,856,cycle)
    `expect("io_rd_imag",io_rd_imag,-1170,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -34;
    io_rs1_imag = 6'd33;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,126,cycle)
    `expect("io_rd_imag",io_rd_imag,3225,cycle)
    `expect("io_rd_real",io_rd_real,126,cycle)
    `expect("io_rd_imag",io_rd_imag,3225,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -23;
    io_rs1_imag = 6'd46;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3358,cycle)
    `expect("io_rd_imag",io_rd_imag,-941,cycle)
    `expect("io_rd_real",io_rd_real,-3358,cycle)
    `expect("io_rd_imag",io_rd_imag,-941,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd39;
    io_rs1_imag = 4'd8;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,5057,cycle)
    `expect("io_rd_imag",io_rd_imag,-3590,cycle)
    `expect("io_rd_real",io_rd_real,5057,cycle)
    `expect("io_rd_imag",io_rd_imag,-3590,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd5;
    io_rs1_imag = 6'd49;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,793,cycle)
    `expect("io_rd_imag",io_rd_imag,770,cycle)
    `expect("io_rd_real",io_rd_real,793,cycle)
    `expect("io_rd_imag",io_rd_imag,770,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -9;
    io_rs1_imag = 5'd21;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-8911,cycle)
    `expect("io_rd_imag",io_rd_imag,-1925,cycle)
    `expect("io_rd_real",io_rd_real,-8911,cycle)
    `expect("io_rd_imag",io_rd_imag,-1925,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 1'd1;
    io_rs1_imag = 6'd35;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,443,cycle)
    `expect("io_rd_imag",io_rd_imag,743,cycle)
    `expect("io_rd_real",io_rd_real,443,cycle)
    `expect("io_rd_imag",io_rd_imag,743,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -20;
    io_rs1_imag = -9;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-629,cycle)
    `expect("io_rd_imag",io_rd_imag,2671,cycle)
    `expect("io_rd_real",io_rd_real,-629,cycle)
    `expect("io_rd_imag",io_rd_imag,2671,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -2;
    io_rs1_imag = 4'd12;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-410,cycle)
    `expect("io_rd_imag",io_rd_imag,1614,cycle)
    `expect("io_rd_real",io_rd_real,-410,cycle)
    `expect("io_rd_imag",io_rd_imag,1614,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 2'd3;
    io_rs1_imag = 5'd24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2584,cycle)
    `expect("io_rd_imag",io_rd_imag,3693,cycle)
    `expect("io_rd_real",io_rd_real,-2584,cycle)
    `expect("io_rd_imag",io_rd_imag,3693,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -10;
    io_rs1_imag = 5'd20;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2552,cycle)
    `expect("io_rd_imag",io_rd_imag,-259,cycle)
    `expect("io_rd_real",io_rd_real,-2552,cycle)
    `expect("io_rd_imag",io_rd_imag,-259,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -6;
    io_rs1_imag = -8;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-464,cycle)
    `expect("io_rd_imag",io_rd_imag,-3025,cycle)
    `expect("io_rd_real",io_rd_real,-464,cycle)
    `expect("io_rd_imag",io_rd_imag,-3025,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd16;
    io_rs1_imag = 5'd23;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,820,cycle)
    `expect("io_rd_imag",io_rd_imag,2156,cycle)
    `expect("io_rd_real",io_rd_real,820,cycle)
    `expect("io_rd_imag",io_rd_imag,2156,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd32;
    io_rs1_imag = 6'd33;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2906,cycle)
    `expect("io_rd_imag",io_rd_imag,2944,cycle)
    `expect("io_rd_real",io_rd_real,-2906,cycle)
    `expect("io_rd_imag",io_rd_imag,2944,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd20;
    io_rs1_imag = 6'd42;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2559,cycle)
    `expect("io_rd_imag",io_rd_imag,-793,cycle)
    `expect("io_rd_real",io_rd_real,-2559,cycle)
    `expect("io_rd_imag",io_rd_imag,-793,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd41;
    io_rs1_imag = -37;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-681,cycle)
    `expect("io_rd_imag",io_rd_imag,-3334,cycle)
    `expect("io_rd_real",io_rd_real,-681,cycle)
    `expect("io_rd_imag",io_rd_imag,-3334,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd16;
    io_rs1_imag = -13;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1536,cycle)
    `expect("io_rd_imag",io_rd_imag,4399,cycle)
    `expect("io_rd_real",io_rd_real,1536,cycle)
    `expect("io_rd_imag",io_rd_imag,4399,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd13;
    io_rs1_imag = 5'd28;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3818,cycle)
    `expect("io_rd_imag",io_rd_imag,6658,cycle)
    `expect("io_rd_real",io_rd_real,-3818,cycle)
    `expect("io_rd_imag",io_rd_imag,6658,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd27;
    io_rs1_imag = -3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,601,cycle)
    `expect("io_rd_imag",io_rd_imag,1601,cycle)
    `expect("io_rd_real",io_rd_real,601,cycle)
    `expect("io_rd_imag",io_rd_imag,1601,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -26;
    io_rs1_imag = 5'd29;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3909,cycle)
    `expect("io_rd_imag",io_rd_imag,79,cycle)
    `expect("io_rd_real",io_rd_real,3909,cycle)
    `expect("io_rd_imag",io_rd_imag,79,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -9;
    io_rs1_imag = 6'd45;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-742,cycle)
    `expect("io_rd_imag",io_rd_imag,-98,cycle)
    `expect("io_rd_real",io_rd_real,-742,cycle)
    `expect("io_rd_imag",io_rd_imag,-98,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -19;
    io_rs1_imag = 6'd37;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1465,cycle)
    `expect("io_rd_imag",io_rd_imag,1836,cycle)
    `expect("io_rd_real",io_rd_real,1465,cycle)
    `expect("io_rd_imag",io_rd_imag,1836,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -30;
    io_rs1_imag = -23;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,192,cycle)
    `expect("io_rd_imag",io_rd_imag,-2484,cycle)
    `expect("io_rd_real",io_rd_real,192,cycle)
    `expect("io_rd_imag",io_rd_imag,-2484,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -1;
    io_rs1_imag = -36;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-95,cycle)
    `expect("io_rd_imag",io_rd_imag,487,cycle)
    `expect("io_rd_real",io_rd_real,-95,cycle)
    `expect("io_rd_imag",io_rd_imag,487,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd41;
    io_rs1_imag = -33;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2262,cycle)
    `expect("io_rd_imag",io_rd_imag,5486,cycle)
    `expect("io_rd_real",io_rd_real,-2262,cycle)
    `expect("io_rd_imag",io_rd_imag,5486,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -7;
    io_rs1_imag = -37;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-5078,cycle)
    `expect("io_rd_imag",io_rd_imag,1599,cycle)
    `expect("io_rd_real",io_rd_real,-5078,cycle)
    `expect("io_rd_imag",io_rd_imag,1599,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd32;
    io_rs1_imag = -3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,161,cycle)
    `expect("io_rd_imag",io_rd_imag,-3714,cycle)
    `expect("io_rd_real",io_rd_real,161,cycle)
    `expect("io_rd_imag",io_rd_imag,-3714,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -6;
    io_rs1_imag = 4'd15;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1903,cycle)
    `expect("io_rd_imag",io_rd_imag,1661,cycle)
    `expect("io_rd_real",io_rd_real,1903,cycle)
    `expect("io_rd_imag",io_rd_imag,1661,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd11;
    io_rs1_imag = 4'd13;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2888,cycle)
    `expect("io_rd_imag",io_rd_imag,-3674,cycle)
    `expect("io_rd_real",io_rd_real,2888,cycle)
    `expect("io_rd_imag",io_rd_imag,-3674,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -23;
    io_rs1_imag = -30;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2466,cycle)
    `expect("io_rd_imag",io_rd_imag,-1962,cycle)
    `expect("io_rd_real",io_rd_real,2466,cycle)
    `expect("io_rd_imag",io_rd_imag,-1962,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -17;
    io_rs1_imag = -24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2359,cycle)
    `expect("io_rd_imag",io_rd_imag,310,cycle)
    `expect("io_rd_real",io_rd_real,2359,cycle)
    `expect("io_rd_imag",io_rd_imag,310,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd17;
    io_rs1_imag = -17;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,410,cycle)
    `expect("io_rd_imag",io_rd_imag,3599,cycle)
    `expect("io_rd_real",io_rd_real,410,cycle)
    `expect("io_rd_imag",io_rd_imag,3599,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd38;
    io_rs1_imag = -46;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,478,cycle)
    `expect("io_rd_imag",io_rd_imag,523,cycle)
    `expect("io_rd_real",io_rd_real,478,cycle)
    `expect("io_rd_imag",io_rd_imag,523,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd42;
    io_rs1_imag = -13;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,148,cycle)
    `expect("io_rd_imag",io_rd_imag,-1575,cycle)
    `expect("io_rd_real",io_rd_real,148,cycle)
    `expect("io_rd_imag",io_rd_imag,-1575,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd39;
    io_rs1_imag = -31;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1978,cycle)
    `expect("io_rd_imag",io_rd_imag,-867,cycle)
    `expect("io_rd_real",io_rd_real,-1978,cycle)
    `expect("io_rd_imag",io_rd_imag,-867,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd43;
    io_rs1_imag = 5'd18;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3561,cycle)
    `expect("io_rd_imag",io_rd_imag,624,cycle)
    `expect("io_rd_real",io_rd_real,3561,cycle)
    `expect("io_rd_imag",io_rd_imag,624,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -43;
    io_rs1_imag = 6'd45;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-206,cycle)
    `expect("io_rd_imag",io_rd_imag,1637,cycle)
    `expect("io_rd_real",io_rd_real,-206,cycle)
    `expect("io_rd_imag",io_rd_imag,1637,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -5;
    io_rs1_imag = 6'd49;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,4548,cycle)
    `expect("io_rd_imag",io_rd_imag,-3457,cycle)
    `expect("io_rd_real",io_rd_real,4548,cycle)
    `expect("io_rd_imag",io_rd_imag,-3457,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -25;
    io_rs1_imag = -44;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,6122,cycle)
    `expect("io_rd_imag",io_rd_imag,134,cycle)
    `expect("io_rd_real",io_rd_real,6122,cycle)
    `expect("io_rd_imag",io_rd_imag,134,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -14;
    io_rs1_imag = 6'd40;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1887,cycle)
    `expect("io_rd_imag",io_rd_imag,3176,cycle)
    `expect("io_rd_real",io_rd_real,1887,cycle)
    `expect("io_rd_imag",io_rd_imag,3176,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -2;
    io_rs1_imag = -46;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-7933,cycle)
    `expect("io_rd_imag",io_rd_imag,2157,cycle)
    `expect("io_rd_real",io_rd_real,-7933,cycle)
    `expect("io_rd_imag",io_rd_imag,2157,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -33;
    io_rs1_imag = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1568,cycle)
    `expect("io_rd_imag",io_rd_imag,-308,cycle)
    `expect("io_rd_real",io_rd_real,1568,cycle)
    `expect("io_rd_imag",io_rd_imag,-308,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -20;
    io_rs1_imag = -7;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3142,cycle)
    `expect("io_rd_imag",io_rd_imag,-1268,cycle)
    `expect("io_rd_real",io_rd_real,-3142,cycle)
    `expect("io_rd_imag",io_rd_imag,-1268,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -6;
    io_rs1_imag = -34;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1735,cycle)
    `expect("io_rd_imag",io_rd_imag,-921,cycle)
    `expect("io_rd_real",io_rd_real,1735,cycle)
    `expect("io_rd_imag",io_rd_imag,-921,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -48;
    io_rs1_imag = -4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,635,cycle)
    `expect("io_rd_imag",io_rd_imag,-1138,cycle)
    `expect("io_rd_real",io_rd_real,635,cycle)
    `expect("io_rd_imag",io_rd_imag,-1138,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 2'd3;
    io_rs1_imag = -24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1760,cycle)
    `expect("io_rd_imag",io_rd_imag,-2823,cycle)
    `expect("io_rd_real",io_rd_real,-1760,cycle)
    `expect("io_rd_imag",io_rd_imag,-2823,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -16;
    io_rs1_imag = 5'd22;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2289,cycle)
    `expect("io_rd_imag",io_rd_imag,990,cycle)
    `expect("io_rd_real",io_rd_real,2289,cycle)
    `expect("io_rd_imag",io_rd_imag,990,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd28;
    io_rs1_imag = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1781,cycle)
    `expect("io_rd_imag",io_rd_imag,-4295,cycle)
    `expect("io_rd_real",io_rd_real,-1781,cycle)
    `expect("io_rd_imag",io_rd_imag,-4295,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd18;
    io_rs1_imag = 3'd6;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,164,cycle)
    `expect("io_rd_imag",io_rd_imag,-2143,cycle)
    `expect("io_rd_real",io_rd_real,164,cycle)
    `expect("io_rd_imag",io_rd_imag,-2143,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -30;
    io_rs1_imag = -25;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3000,cycle)
    `expect("io_rd_imag",io_rd_imag,-2236,cycle)
    `expect("io_rd_real",io_rd_real,-3000,cycle)
    `expect("io_rd_imag",io_rd_imag,-2236,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -40;
    io_rs1_imag = 4'd10;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,198,cycle)
    `expect("io_rd_imag",io_rd_imag,446,cycle)
    `expect("io_rd_real",io_rd_real,198,cycle)
    `expect("io_rd_imag",io_rd_imag,446,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd35;
    io_rs1_imag = 5'd18;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3604,cycle)
    `expect("io_rd_imag",io_rd_imag,3421,cycle)
    `expect("io_rd_real",io_rd_real,3604,cycle)
    `expect("io_rd_imag",io_rd_imag,3421,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -14;
    io_rs1_imag = -7;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-157,cycle)
    `expect("io_rd_imag",io_rd_imag,561,cycle)
    `expect("io_rd_real",io_rd_real,-157,cycle)
    `expect("io_rd_imag",io_rd_imag,561,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd4;
    io_rs1_imag = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2176,cycle)
    `expect("io_rd_imag",io_rd_imag,-6007,cycle)
    `expect("io_rd_real",io_rd_real,-2176,cycle)
    `expect("io_rd_imag",io_rd_imag,-6007,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd29;
    io_rs1_imag = -43;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-350,cycle)
    `expect("io_rd_imag",io_rd_imag,1093,cycle)
    `expect("io_rd_real",io_rd_real,-350,cycle)
    `expect("io_rd_imag",io_rd_imag,1093,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd48;
    io_rs1_imag = 6'd49;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1775,cycle)
    `expect("io_rd_imag",io_rd_imag,5004,cycle)
    `expect("io_rd_real",io_rd_real,1775,cycle)
    `expect("io_rd_imag",io_rd_imag,5004,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd35;
    io_rs1_imag = 5'd25;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-5886,cycle)
    `expect("io_rd_imag",io_rd_imag,7,cycle)
    `expect("io_rd_real",io_rd_real,-5886,cycle)
    `expect("io_rd_imag",io_rd_imag,7,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd17;
    io_rs1_imag = 5'd28;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2129,cycle)
    `expect("io_rd_imag",io_rd_imag,-3910,cycle)
    `expect("io_rd_real",io_rd_real,2129,cycle)
    `expect("io_rd_imag",io_rd_imag,-3910,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -30;
    io_rs1_imag = 5'd16;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1016,cycle)
    `expect("io_rd_imag",io_rd_imag,791,cycle)
    `expect("io_rd_real",io_rd_real,1016,cycle)
    `expect("io_rd_imag",io_rd_imag,791,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -41;
    io_rs1_imag = 6'd35;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,992,cycle)
    `expect("io_rd_imag",io_rd_imag,4017,cycle)
    `expect("io_rd_real",io_rd_real,992,cycle)
    `expect("io_rd_imag",io_rd_imag,4017,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -32;
    io_rs1_imag = 6'd49;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1521,cycle)
    `expect("io_rd_imag",io_rd_imag,3927,cycle)
    `expect("io_rd_real",io_rd_real,1521,cycle)
    `expect("io_rd_imag",io_rd_imag,3927,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -5;
    io_rs1_imag = 4'd8;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,113,cycle)
    `expect("io_rd_imag",io_rd_imag,-421,cycle)
    `expect("io_rd_real",io_rd_real,113,cycle)
    `expect("io_rd_imag",io_rd_imag,-421,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -49;
    io_rs1_imag = 5'd24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3089,cycle)
    `expect("io_rd_imag",io_rd_imag,-646,cycle)
    `expect("io_rd_real",io_rd_real,-3089,cycle)
    `expect("io_rd_imag",io_rd_imag,-646,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd27;
    io_rs1_imag = 6'd34;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4554,cycle)
    `expect("io_rd_imag",io_rd_imag,-714,cycle)
    `expect("io_rd_real",io_rd_real,-4554,cycle)
    `expect("io_rd_imag",io_rd_imag,-714,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -3;
    io_rs1_imag = 6'd33;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3249,cycle)
    `expect("io_rd_imag",io_rd_imag,3059,cycle)
    `expect("io_rd_real",io_rd_real,-3249,cycle)
    `expect("io_rd_imag",io_rd_imag,3059,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd8;
    io_rs1_imag = -16;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3951,cycle)
    `expect("io_rd_imag",io_rd_imag,-4867,cycle)
    `expect("io_rd_real",io_rd_real,-3951,cycle)
    `expect("io_rd_imag",io_rd_imag,-4867,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -37;
    io_rs1_imag = 5'd23;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2157,cycle)
    `expect("io_rd_imag",io_rd_imag,2007,cycle)
    `expect("io_rd_real",io_rd_real,-2157,cycle)
    `expect("io_rd_imag",io_rd_imag,2007,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -46;
    io_rs1_imag = -43;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3231,cycle)
    `expect("io_rd_imag",io_rd_imag,1017,cycle)
    `expect("io_rd_real",io_rd_real,-3231,cycle)
    `expect("io_rd_imag",io_rd_imag,1017,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd12;
    io_rs1_imag = -9;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,5455,cycle)
    `expect("io_rd_imag",io_rd_imag,1618,cycle)
    `expect("io_rd_real",io_rd_real,5455,cycle)
    `expect("io_rd_imag",io_rd_imag,1618,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -44;
    io_rs1_imag = -8;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3280,cycle)
    `expect("io_rd_imag",io_rd_imag,3574,cycle)
    `expect("io_rd_real",io_rd_real,-3280,cycle)
    `expect("io_rd_imag",io_rd_imag,3574,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd23;
    io_rs1_imag = 6'd44;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1644,cycle)
    `expect("io_rd_imag",io_rd_imag,-4680,cycle)
    `expect("io_rd_real",io_rd_real,-1644,cycle)
    `expect("io_rd_imag",io_rd_imag,-4680,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -38;
    io_rs1_imag = 5'd30;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1432,cycle)
    `expect("io_rd_imag",io_rd_imag,-1418,cycle)
    `expect("io_rd_real",io_rd_real,-1432,cycle)
    `expect("io_rd_imag",io_rd_imag,-1418,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -23;
    io_rs1_imag = 6'd49;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,77,cycle)
    `expect("io_rd_imag",io_rd_imag,-5952,cycle)
    `expect("io_rd_real",io_rd_real,77,cycle)
    `expect("io_rd_imag",io_rd_imag,-5952,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd19;
    io_rs1_imag = -37;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,367,cycle)
    `expect("io_rd_imag",io_rd_imag,-1828,cycle)
    `expect("io_rd_real",io_rd_real,367,cycle)
    `expect("io_rd_imag",io_rd_imag,-1828,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -7;
    io_rs1_imag = 6'd50;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-235,cycle)
    `expect("io_rd_imag",io_rd_imag,5365,cycle)
    `expect("io_rd_real",io_rd_real,-235,cycle)
    `expect("io_rd_imag",io_rd_imag,5365,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -27;
    io_rs1_imag = 6'd42;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-10640,cycle)
    `expect("io_rd_imag",io_rd_imag,613,cycle)
    `expect("io_rd_real",io_rd_real,-10640,cycle)
    `expect("io_rd_imag",io_rd_imag,613,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -43;
    io_rs1_imag = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,506,cycle)
    `expect("io_rd_imag",io_rd_imag,-3770,cycle)
    `expect("io_rd_real",io_rd_real,506,cycle)
    `expect("io_rd_imag",io_rd_imag,-3770,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd45;
    io_rs1_imag = -43;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,5781,cycle)
    `expect("io_rd_imag",io_rd_imag,-1508,cycle)
    `expect("io_rd_real",io_rd_real,5781,cycle)
    `expect("io_rd_imag",io_rd_imag,-1508,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -31;
    io_rs1_imag = -27;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4433,cycle)
    `expect("io_rd_imag",io_rd_imag,7213,cycle)
    `expect("io_rd_real",io_rd_real,-4433,cycle)
    `expect("io_rd_imag",io_rd_imag,7213,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd41;
    io_rs1_imag = 6'd41;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-5886,cycle)
    `expect("io_rd_imag",io_rd_imag,-381,cycle)
    `expect("io_rd_real",io_rd_real,-5886,cycle)
    `expect("io_rd_imag",io_rd_imag,-381,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -28;
    io_rs1_imag = -9;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1906,cycle)
    `expect("io_rd_imag",io_rd_imag,215,cycle)
    `expect("io_rd_real",io_rd_real,-1906,cycle)
    `expect("io_rd_imag",io_rd_imag,215,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -12;
    io_rs1_imag = 6'd50;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,4714,cycle)
    `expect("io_rd_imag",io_rd_imag,-5480,cycle)
    `expect("io_rd_real",io_rd_real,4714,cycle)
    `expect("io_rd_imag",io_rd_imag,-5480,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd31;
    io_rs1_imag = 5'd30;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,154,cycle)
    `expect("io_rd_imag",io_rd_imag,1417,cycle)
    `expect("io_rd_real",io_rd_real,154,cycle)
    `expect("io_rd_imag",io_rd_imag,1417,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -40;
    io_rs1_imag = 6'd35;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1182,cycle)
    `expect("io_rd_imag",io_rd_imag,1468,cycle)
    `expect("io_rd_real",io_rd_real,-1182,cycle)
    `expect("io_rd_imag",io_rd_imag,1468,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 2'd2;
    io_rs1_imag = 4'd14;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2794,cycle)
    `expect("io_rd_imag",io_rd_imag,-4507,cycle)
    `expect("io_rd_real",io_rd_real,-2794,cycle)
    `expect("io_rd_imag",io_rd_imag,-4507,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -33;
    io_rs1_imag = 3'd6;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-450,cycle)
    `expect("io_rd_imag",io_rd_imag,4670,cycle)
    `expect("io_rd_real",io_rd_real,-450,cycle)
    `expect("io_rd_imag",io_rd_imag,4670,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd10;
    io_rs1_imag = 4'd9;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1323,cycle)
    `expect("io_rd_imag",io_rd_imag,1002,cycle)
    `expect("io_rd_real",io_rd_real,-1323,cycle)
    `expect("io_rd_imag",io_rd_imag,1002,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd20;
    io_rs1_imag = 3'd7;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2310,cycle)
    `expect("io_rd_imag",io_rd_imag,2276,cycle)
    `expect("io_rd_real",io_rd_real,-2310,cycle)
    `expect("io_rd_imag",io_rd_imag,2276,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd49;
    io_rs1_imag = 5'd21;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2008,cycle)
    `expect("io_rd_imag",io_rd_imag,-73,cycle)
    `expect("io_rd_real",io_rd_real,-2008,cycle)
    `expect("io_rd_imag",io_rd_imag,-73,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -10;
    io_rs1_imag = 4'd8;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4710,cycle)
    `expect("io_rd_imag",io_rd_imag,-416,cycle)
    `expect("io_rd_real",io_rd_real,-4710,cycle)
    `expect("io_rd_imag",io_rd_imag,-416,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd13;
    io_rs1_imag = -25;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,437,cycle)
    `expect("io_rd_imag",io_rd_imag,-2483,cycle)
    `expect("io_rd_real",io_rd_real,437,cycle)
    `expect("io_rd_imag",io_rd_imag,-2483,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd11;
    io_rs1_imag = 6'd33;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3479,cycle)
    `expect("io_rd_imag",io_rd_imag,6430,cycle)
    `expect("io_rd_real",io_rd_real,3479,cycle)
    `expect("io_rd_imag",io_rd_imag,6430,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd24;
    io_rs1_imag = -42;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2037,cycle)
    `expect("io_rd_imag",io_rd_imag,1399,cycle)
    `expect("io_rd_real",io_rd_real,-2037,cycle)
    `expect("io_rd_imag",io_rd_imag,1399,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -25;
    io_rs1_imag = 6'd41;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1898,cycle)
    `expect("io_rd_imag",io_rd_imag,792,cycle)
    `expect("io_rd_real",io_rd_real,1898,cycle)
    `expect("io_rd_imag",io_rd_imag,792,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd34;
    io_rs1_imag = -5;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1742,cycle)
    `expect("io_rd_imag",io_rd_imag,-559,cycle)
    `expect("io_rd_real",io_rd_real,-1742,cycle)
    `expect("io_rd_imag",io_rd_imag,-559,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd8;
    io_rs1_imag = -19;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,4039,cycle)
    `expect("io_rd_imag",io_rd_imag,1408,cycle)
    `expect("io_rd_real",io_rd_real,4039,cycle)
    `expect("io_rd_imag",io_rd_imag,1408,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd37;
    io_rs1_imag = 4'd15;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-271,cycle)
    `expect("io_rd_imag",io_rd_imag,53,cycle)
    `expect("io_rd_real",io_rd_real,-271,cycle)
    `expect("io_rd_imag",io_rd_imag,53,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd6;
    io_rs1_imag = 6'd44;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3961,cycle)
    `expect("io_rd_imag",io_rd_imag,4006,cycle)
    `expect("io_rd_real",io_rd_real,-3961,cycle)
    `expect("io_rd_imag",io_rd_imag,4006,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd29;
    io_rs1_imag = 6'd34;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1137,cycle)
    `expect("io_rd_imag",io_rd_imag,-2266,cycle)
    `expect("io_rd_real",io_rd_real,1137,cycle)
    `expect("io_rd_imag",io_rd_imag,-2266,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd4;
    io_rs1_imag = -27;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2210,cycle)
    `expect("io_rd_imag",io_rd_imag,-1172,cycle)
    `expect("io_rd_real",io_rd_real,2210,cycle)
    `expect("io_rd_imag",io_rd_imag,-1172,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -12;
    io_rs1_imag = -45;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,742,cycle)
    `expect("io_rd_imag",io_rd_imag,1803,cycle)
    `expect("io_rd_real",io_rd_real,742,cycle)
    `expect("io_rd_imag",io_rd_imag,1803,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -7;
    io_rs1_imag = -43;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1072,cycle)
    `expect("io_rd_imag",io_rd_imag,5871,cycle)
    `expect("io_rd_real",io_rd_real,-1072,cycle)
    `expect("io_rd_imag",io_rd_imag,5871,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -47;
    io_rs1_imag = 6'd44;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-183,cycle)
    `expect("io_rd_imag",io_rd_imag,6114,cycle)
    `expect("io_rd_real",io_rd_real,-183,cycle)
    `expect("io_rd_imag",io_rd_imag,6114,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd30;
    io_rs1_imag = -39;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1638,cycle)
    `expect("io_rd_imag",io_rd_imag,-5815,cycle)
    `expect("io_rd_real",io_rd_real,1638,cycle)
    `expect("io_rd_imag",io_rd_imag,-5815,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd9;
    io_rs1_imag = -26;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,7076,cycle)
    `expect("io_rd_imag",io_rd_imag,-2342,cycle)
    `expect("io_rd_real",io_rd_real,7076,cycle)
    `expect("io_rd_imag",io_rd_imag,-2342,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -31;
    io_rs1_imag = -20;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-5713,cycle)
    `expect("io_rd_imag",io_rd_imag,-1247,cycle)
    `expect("io_rd_real",io_rd_real,-5713,cycle)
    `expect("io_rd_imag",io_rd_imag,-1247,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd23;
    io_rs1_imag = 5'd18;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-183,cycle)
    `expect("io_rd_imag",io_rd_imag,-10,cycle)
    `expect("io_rd_real",io_rd_real,-183,cycle)
    `expect("io_rd_imag",io_rd_imag,-10,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd7;
    io_rs1_imag = -39;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3345,cycle)
    `expect("io_rd_imag",io_rd_imag,49,cycle)
    `expect("io_rd_real",io_rd_real,3345,cycle)
    `expect("io_rd_imag",io_rd_imag,49,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -11;
    io_rs1_imag = -41;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1666,cycle)
    `expect("io_rd_imag",io_rd_imag,-4142,cycle)
    `expect("io_rd_real",io_rd_real,1666,cycle)
    `expect("io_rd_imag",io_rd_imag,-4142,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -33;
    io_rs1_imag = -27;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1293,cycle)
    `expect("io_rd_imag",io_rd_imag,1071,cycle)
    `expect("io_rd_real",io_rd_real,-1293,cycle)
    `expect("io_rd_imag",io_rd_imag,1071,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd5;
    io_rs1_imag = -36;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2832,cycle)
    `expect("io_rd_imag",io_rd_imag,1152,cycle)
    `expect("io_rd_real",io_rd_real,2832,cycle)
    `expect("io_rd_imag",io_rd_imag,1152,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd17;
    io_rs1_imag = -16;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,4377,cycle)
    `expect("io_rd_imag",io_rd_imag,-110,cycle)
    `expect("io_rd_real",io_rd_real,4377,cycle)
    `expect("io_rd_imag",io_rd_imag,-110,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -34;
    io_rs1_imag = 5'd25;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2251,cycle)
    `expect("io_rd_imag",io_rd_imag,-2040,cycle)
    `expect("io_rd_real",io_rd_real,-2251,cycle)
    `expect("io_rd_imag",io_rd_imag,-2040,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd15;
    io_rs1_imag = -42;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,719,cycle)
    `expect("io_rd_imag",io_rd_imag,-7391,cycle)
    `expect("io_rd_real",io_rd_real,719,cycle)
    `expect("io_rd_imag",io_rd_imag,-7391,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -12;
    io_rs1_imag = -18;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,6243,cycle)
    `expect("io_rd_imag",io_rd_imag,805,cycle)
    `expect("io_rd_real",io_rd_real,6243,cycle)
    `expect("io_rd_imag",io_rd_imag,805,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd31;
    io_rs1_imag = -7;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1983,cycle)
    `expect("io_rd_imag",io_rd_imag,813,cycle)
    `expect("io_rd_real",io_rd_real,-1983,cycle)
    `expect("io_rd_imag",io_rd_imag,813,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -6;
    io_rs1_imag = 5'd28;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1685,cycle)
    `expect("io_rd_imag",io_rd_imag,1523,cycle)
    `expect("io_rd_real",io_rd_real,-1685,cycle)
    `expect("io_rd_imag",io_rd_imag,1523,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd11;
    io_rs1_imag = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,553,cycle)
    `expect("io_rd_imag",io_rd_imag,-4965,cycle)
    `expect("io_rd_real",io_rd_real,553,cycle)
    `expect("io_rd_imag",io_rd_imag,-4965,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -19;
    io_rs1_imag = 4'd9;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2608,cycle)
    `expect("io_rd_imag",io_rd_imag,-664,cycle)
    `expect("io_rd_real",io_rd_real,2608,cycle)
    `expect("io_rd_imag",io_rd_imag,-664,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd27;
    io_rs1_imag = 5'd22;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,971,cycle)
    `expect("io_rd_imag",io_rd_imag,1094,cycle)
    `expect("io_rd_real",io_rd_real,971,cycle)
    `expect("io_rd_imag",io_rd_imag,1094,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd15;
    io_rs1_imag = 6'd39;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1241,cycle)
    `expect("io_rd_imag",io_rd_imag,3240,cycle)
    `expect("io_rd_real",io_rd_real,-1241,cycle)
    `expect("io_rd_imag",io_rd_imag,3240,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd24;
    io_rs1_imag = -34;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1980,cycle)
    `expect("io_rd_imag",io_rd_imag,-3603,cycle)
    `expect("io_rd_real",io_rd_real,-1980,cycle)
    `expect("io_rd_imag",io_rd_imag,-3603,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -21;
    io_rs1_imag = -8;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,372,cycle)
    `expect("io_rd_imag",io_rd_imag,1346,cycle)
    `expect("io_rd_real",io_rd_real,372,cycle)
    `expect("io_rd_imag",io_rd_imag,1346,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -29;
    io_rs1_imag = 5'd19;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2804,cycle)
    `expect("io_rd_imag",io_rd_imag,4605,cycle)
    `expect("io_rd_real",io_rd_real,-2804,cycle)
    `expect("io_rd_imag",io_rd_imag,4605,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd9;
    io_rs1_imag = -11;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2569,cycle)
    `expect("io_rd_imag",io_rd_imag,1033,cycle)
    `expect("io_rd_real",io_rd_real,2569,cycle)
    `expect("io_rd_imag",io_rd_imag,1033,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -28;
    io_rs1_imag = 5'd24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3060,cycle)
    `expect("io_rd_imag",io_rd_imag,249,cycle)
    `expect("io_rd_real",io_rd_real,3060,cycle)
    `expect("io_rd_imag",io_rd_imag,249,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -49;
    io_rs1_imag = 6'd34;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4702,cycle)
    `expect("io_rd_imag",io_rd_imag,-2530,cycle)
    `expect("io_rd_real",io_rd_real,-4702,cycle)
    `expect("io_rd_imag",io_rd_imag,-2530,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd48;
    io_rs1_imag = 6'd49;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2728,cycle)
    `expect("io_rd_imag",io_rd_imag,-1615,cycle)
    `expect("io_rd_real",io_rd_real,2728,cycle)
    `expect("io_rd_imag",io_rd_imag,-1615,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd49;
    io_rs1_imag = 5'd18;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-159,cycle)
    `expect("io_rd_imag",io_rd_imag,1504,cycle)
    `expect("io_rd_real",io_rd_real,-159,cycle)
    `expect("io_rd_imag",io_rd_imag,1504,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd26;
    io_rs1_imag = -22;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-6951,cycle)
    `expect("io_rd_imag",io_rd_imag,-4016,cycle)
    `expect("io_rd_real",io_rd_real,-6951,cycle)
    `expect("io_rd_imag",io_rd_imag,-4016,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -26;
    io_rs1_imag = 6'd36;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4998,cycle)
    `expect("io_rd_imag",io_rd_imag,3168,cycle)
    `expect("io_rd_real",io_rd_real,-4998,cycle)
    `expect("io_rd_imag",io_rd_imag,3168,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -39;
    io_rs1_imag = -15;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1520,cycle)
    `expect("io_rd_imag",io_rd_imag,3806,cycle)
    `expect("io_rd_real",io_rd_real,-1520,cycle)
    `expect("io_rd_imag",io_rd_imag,3806,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd15;
    io_rs1_imag = 3'd5;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,8529,cycle)
    `expect("io_rd_imag",io_rd_imag,2070,cycle)
    `expect("io_rd_real",io_rd_real,8529,cycle)
    `expect("io_rd_imag",io_rd_imag,2070,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -4;
    io_rs1_imag = 6'd33;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-774,cycle)
    `expect("io_rd_imag",io_rd_imag,4425,cycle)
    `expect("io_rd_real",io_rd_real,-774,cycle)
    `expect("io_rd_imag",io_rd_imag,4425,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -6;
    io_rs1_imag = 5'd28;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-5401,cycle)
    `expect("io_rd_imag",io_rd_imag,-3279,cycle)
    `expect("io_rd_real",io_rd_real,-5401,cycle)
    `expect("io_rd_imag",io_rd_imag,-3279,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -35;
    io_rs1_imag = -36;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-350,cycle)
    `expect("io_rd_imag",io_rd_imag,-4641,cycle)
    `expect("io_rd_real",io_rd_real,-350,cycle)
    `expect("io_rd_imag",io_rd_imag,-4641,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd13;
    io_rs1_imag = -48;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3475,cycle)
    `expect("io_rd_imag",io_rd_imag,453,cycle)
    `expect("io_rd_real",io_rd_real,3475,cycle)
    `expect("io_rd_imag",io_rd_imag,453,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -44;
    io_rs1_imag = -16;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3282,cycle)
    `expect("io_rd_imag",io_rd_imag,7127,cycle)
    `expect("io_rd_real",io_rd_real,-3282,cycle)
    `expect("io_rd_imag",io_rd_imag,7127,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -4;
    io_rs1_imag = 6'd46;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2585,cycle)
    `expect("io_rd_imag",io_rd_imag,-746,cycle)
    `expect("io_rd_real",io_rd_real,-2585,cycle)
    `expect("io_rd_imag",io_rd_imag,-746,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd40;
    io_rs1_imag = -6;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2868,cycle)
    `expect("io_rd_imag",io_rd_imag,-3930,cycle)
    `expect("io_rd_real",io_rd_real,2868,cycle)
    `expect("io_rd_imag",io_rd_imag,-3930,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd10;
    io_rs1_imag = 5'd21;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2426,cycle)
    `expect("io_rd_imag",io_rd_imag,-3448,cycle)
    `expect("io_rd_real",io_rd_real,2426,cycle)
    `expect("io_rd_imag",io_rd_imag,-3448,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -10;
    io_rs1_imag = -9;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-6346,cycle)
    `expect("io_rd_imag",io_rd_imag,-2855,cycle)
    `expect("io_rd_real",io_rd_real,-6346,cycle)
    `expect("io_rd_imag",io_rd_imag,-2855,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -5;
    io_rs1_imag = 6'd35;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1222,cycle)
    `expect("io_rd_imag",io_rd_imag,2714,cycle)
    `expect("io_rd_real",io_rd_real,1222,cycle)
    `expect("io_rd_imag",io_rd_imag,2714,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd49;
    io_rs1_imag = -44;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1899,cycle)
    `expect("io_rd_imag",io_rd_imag,1165,cycle)
    `expect("io_rd_real",io_rd_real,1899,cycle)
    `expect("io_rd_imag",io_rd_imag,1165,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -32;
    io_rs1_imag = -23;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,328,cycle)
    `expect("io_rd_imag",io_rd_imag,2073,cycle)
    `expect("io_rd_real",io_rd_real,328,cycle)
    `expect("io_rd_imag",io_rd_imag,2073,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -9;
    io_rs1_imag = 6'd42;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4020,cycle)
    `expect("io_rd_imag",io_rd_imag,678,cycle)
    `expect("io_rd_real",io_rd_real,-4020,cycle)
    `expect("io_rd_imag",io_rd_imag,678,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -29;
    io_rs1_imag = 5'd30;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,581,cycle)
    `expect("io_rd_imag",io_rd_imag,2427,cycle)
    `expect("io_rd_real",io_rd_real,581,cycle)
    `expect("io_rd_imag",io_rd_imag,2427,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd26;
    io_rs1_imag = 6'd44;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,6298,cycle)
    `expect("io_rd_imag",io_rd_imag,-4306,cycle)
    `expect("io_rd_real",io_rd_real,6298,cycle)
    `expect("io_rd_imag",io_rd_imag,-4306,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd13;
    io_rs1_imag = -12;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2075,cycle)
    `expect("io_rd_imag",io_rd_imag,-1322,cycle)
    `expect("io_rd_real",io_rd_real,-2075,cycle)
    `expect("io_rd_imag",io_rd_imag,-1322,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd17;
    io_rs1_imag = -35;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3051,cycle)
    `expect("io_rd_imag",io_rd_imag,-1081,cycle)
    `expect("io_rd_real",io_rd_real,-3051,cycle)
    `expect("io_rd_imag",io_rd_imag,-1081,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -26;
    io_rs1_imag = -39;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4037,cycle)
    `expect("io_rd_imag",io_rd_imag,3875,cycle)
    `expect("io_rd_real",io_rd_real,-4037,cycle)
    `expect("io_rd_imag",io_rd_imag,3875,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -14;
    io_rs1_imag = 4'd9;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-18,cycle)
    `expect("io_rd_imag",io_rd_imag,4112,cycle)
    `expect("io_rd_real",io_rd_real,-18,cycle)
    `expect("io_rd_imag",io_rd_imag,4112,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -27;
    io_rs1_imag = 4'd14;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1791,cycle)
    `expect("io_rd_imag",io_rd_imag,1201,cycle)
    `expect("io_rd_real",io_rd_real,1791,cycle)
    `expect("io_rd_imag",io_rd_imag,1201,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd32;
    io_rs1_imag = -16;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,4743,cycle)
    `expect("io_rd_imag",io_rd_imag,-5134,cycle)
    `expect("io_rd_real",io_rd_real,4743,cycle)
    `expect("io_rd_imag",io_rd_imag,-5134,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -13;
    io_rs1_imag = -46;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,276,cycle)
    `expect("io_rd_imag",io_rd_imag,-1603,cycle)
    `expect("io_rd_real",io_rd_real,276,cycle)
    `expect("io_rd_imag",io_rd_imag,-1603,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd41;
    io_rs1_imag = 5'd30;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1798,cycle)
    `expect("io_rd_imag",io_rd_imag,511,cycle)
    `expect("io_rd_real",io_rd_real,-1798,cycle)
    `expect("io_rd_imag",io_rd_imag,511,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -6;
    io_rs1_imag = -30;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3961,cycle)
    `expect("io_rd_imag",io_rd_imag,1880,cycle)
    `expect("io_rd_real",io_rd_real,-3961,cycle)
    `expect("io_rd_imag",io_rd_imag,1880,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -22;
    io_rs1_imag = 5'd26;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3821,cycle)
    `expect("io_rd_imag",io_rd_imag,-3744,cycle)
    `expect("io_rd_real",io_rd_real,3821,cycle)
    `expect("io_rd_imag",io_rd_imag,-3744,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd37;
    io_rs1_imag = -48;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1793,cycle)
    `expect("io_rd_imag",io_rd_imag,-924,cycle)
    `expect("io_rd_real",io_rd_real,1793,cycle)
    `expect("io_rd_imag",io_rd_imag,-924,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd40;
    io_rs1_imag = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,4840,cycle)
    `expect("io_rd_imag",io_rd_imag,4559,cycle)
    `expect("io_rd_real",io_rd_real,4840,cycle)
    `expect("io_rd_imag",io_rd_imag,4559,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -31;
    io_rs1_imag = -14;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-7080,cycle)
    `expect("io_rd_imag",io_rd_imag,-337,cycle)
    `expect("io_rd_real",io_rd_real,-7080,cycle)
    `expect("io_rd_imag",io_rd_imag,-337,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd30;
    io_rs1_imag = -29;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2632,cycle)
    `expect("io_rd_imag",io_rd_imag,-3868,cycle)
    `expect("io_rd_real",io_rd_real,2632,cycle)
    `expect("io_rd_imag",io_rd_imag,-3868,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -4;
    io_rs1_imag = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,5703,cycle)
    `expect("io_rd_imag",io_rd_imag,5179,cycle)
    `expect("io_rd_real",io_rd_real,5703,cycle)
    `expect("io_rd_imag",io_rd_imag,5179,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -46;
    io_rs1_imag = 5'd26;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2887,cycle)
    `expect("io_rd_imag",io_rd_imag,-164,cycle)
    `expect("io_rd_real",io_rd_real,-2887,cycle)
    `expect("io_rd_imag",io_rd_imag,-164,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -13;
    io_rs1_imag = -16;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2457,cycle)
    `expect("io_rd_imag",io_rd_imag,-4876,cycle)
    `expect("io_rd_real",io_rd_real,2457,cycle)
    `expect("io_rd_imag",io_rd_imag,-4876,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -7;
    io_rs1_imag = 5'd19;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,6053,cycle)
    `expect("io_rd_imag",io_rd_imag,1733,cycle)
    `expect("io_rd_real",io_rd_real,6053,cycle)
    `expect("io_rd_imag",io_rd_imag,1733,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -40;
    io_rs1_imag = -33;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-5070,cycle)
    `expect("io_rd_imag",io_rd_imag,-1264,cycle)
    `expect("io_rd_real",io_rd_real,-5070,cycle)
    `expect("io_rd_imag",io_rd_imag,-1264,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -49;
    io_rs1_imag = 6'd43;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-649,cycle)
    `expect("io_rd_imag",io_rd_imag,-1572,cycle)
    `expect("io_rd_real",io_rd_real,-649,cycle)
    `expect("io_rd_imag",io_rd_imag,-1572,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -7;
    io_rs1_imag = 6'd32;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1067,cycle)
    `expect("io_rd_imag",io_rd_imag,155,cycle)
    `expect("io_rd_real",io_rd_real,-1067,cycle)
    `expect("io_rd_imag",io_rd_imag,155,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd28;
    io_rs1_imag = 6'd46;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1972,cycle)
    `expect("io_rd_imag",io_rd_imag,-1969,cycle)
    `expect("io_rd_real",io_rd_real,1972,cycle)
    `expect("io_rd_imag",io_rd_imag,-1969,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd43;
    io_rs1_imag = 3'd5;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4116,cycle)
    `expect("io_rd_imag",io_rd_imag,-4273,cycle)
    `expect("io_rd_real",io_rd_real,-4116,cycle)
    `expect("io_rd_imag",io_rd_imag,-4273,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd24;
    io_rs1_imag = -37;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-5329,cycle)
    `expect("io_rd_imag",io_rd_imag,-1523,cycle)
    `expect("io_rd_real",io_rd_real,-5329,cycle)
    `expect("io_rd_imag",io_rd_imag,-1523,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -49;
    io_rs1_imag = 6'd48;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4343,cycle)
    `expect("io_rd_imag",io_rd_imag,5379,cycle)
    `expect("io_rd_real",io_rd_real,-4343,cycle)
    `expect("io_rd_imag",io_rd_imag,5379,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -38;
    io_rs1_imag = 4'd12;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2328,cycle)
    `expect("io_rd_imag",io_rd_imag,2112,cycle)
    `expect("io_rd_real",io_rd_real,-2328,cycle)
    `expect("io_rd_imag",io_rd_imag,2112,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd31;
    io_rs1_imag = 4'd13;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,10156,cycle)
    `expect("io_rd_imag",io_rd_imag,431,cycle)
    `expect("io_rd_real",io_rd_real,10156,cycle)
    `expect("io_rd_imag",io_rd_imag,431,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -12;
    io_rs1_imag = 5'd17;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1549,cycle)
    `expect("io_rd_imag",io_rd_imag,2154,cycle)
    `expect("io_rd_real",io_rd_real,-1549,cycle)
    `expect("io_rd_imag",io_rd_imag,2154,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -10;
    io_rs1_imag = 5'd26;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-7374,cycle)
    `expect("io_rd_imag",io_rd_imag,-3193,cycle)
    `expect("io_rd_real",io_rd_real,-7374,cycle)
    `expect("io_rd_imag",io_rd_imag,-3193,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -40;
    io_rs1_imag = -32;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1366,cycle)
    `expect("io_rd_imag",io_rd_imag,-1394,cycle)
    `expect("io_rd_real",io_rd_real,-1366,cycle)
    `expect("io_rd_imag",io_rd_imag,-1394,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd25;
    io_rs1_imag = 6'd41;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,4307,cycle)
    `expect("io_rd_imag",io_rd_imag,2586,cycle)
    `expect("io_rd_real",io_rd_real,4307,cycle)
    `expect("io_rd_imag",io_rd_imag,2586,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd12;
    io_rs1_imag = -49;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4703,cycle)
    `expect("io_rd_imag",io_rd_imag,2431,cycle)
    `expect("io_rd_real",io_rd_real,-4703,cycle)
    `expect("io_rd_imag",io_rd_imag,2431,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -31;
    io_rs1_imag = -38;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-559,cycle)
    `expect("io_rd_imag",io_rd_imag,-3944,cycle)
    `expect("io_rd_real",io_rd_real,-559,cycle)
    `expect("io_rd_imag",io_rd_imag,-3944,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd8;
    io_rs1_imag = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1090,cycle)
    `expect("io_rd_imag",io_rd_imag,1525,cycle)
    `expect("io_rd_real",io_rd_real,-1090,cycle)
    `expect("io_rd_imag",io_rd_imag,1525,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd10;
    io_rs1_imag = 6'd40;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,971,cycle)
    `expect("io_rd_imag",io_rd_imag,5054,cycle)
    `expect("io_rd_real",io_rd_real,971,cycle)
    `expect("io_rd_imag",io_rd_imag,5054,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd32;
    io_rs1_imag = 6'd33;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1396,cycle)
    `expect("io_rd_imag",io_rd_imag,-5411,cycle)
    `expect("io_rd_real",io_rd_real,1396,cycle)
    `expect("io_rd_imag",io_rd_imag,-5411,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -49;
    io_rs1_imag = 6'd35;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1518,cycle)
    `expect("io_rd_imag",io_rd_imag,-3780,cycle)
    `expect("io_rd_real",io_rd_real,-1518,cycle)
    `expect("io_rd_imag",io_rd_imag,-3780,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd44;
    io_rs1_imag = -5;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1266,cycle)
    `expect("io_rd_imag",io_rd_imag,-2982,cycle)
    `expect("io_rd_real",io_rd_real,1266,cycle)
    `expect("io_rd_imag",io_rd_imag,-2982,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -7;
    io_rs1_imag = -25;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1038,cycle)
    `expect("io_rd_imag",io_rd_imag,7145,cycle)
    `expect("io_rd_real",io_rd_real,1038,cycle)
    `expect("io_rd_imag",io_rd_imag,7145,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -37;
    io_rs1_imag = 5'd21;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-5400,cycle)
    `expect("io_rd_imag",io_rd_imag,1675,cycle)
    `expect("io_rd_real",io_rd_real,-5400,cycle)
    `expect("io_rd_imag",io_rd_imag,1675,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -13;
    io_rs1_imag = -20;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1917,cycle)
    `expect("io_rd_imag",io_rd_imag,-265,cycle)
    `expect("io_rd_real",io_rd_real,-1917,cycle)
    `expect("io_rd_imag",io_rd_imag,-265,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -47;
    io_rs1_imag = -34;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,5219,cycle)
    `expect("io_rd_imag",io_rd_imag,481,cycle)
    `expect("io_rd_real",io_rd_real,5219,cycle)
    `expect("io_rd_imag",io_rd_imag,481,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd42;
    io_rs1_imag = -6;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1533,cycle)
    `expect("io_rd_imag",io_rd_imag,-885,cycle)
    `expect("io_rd_real",io_rd_real,1533,cycle)
    `expect("io_rd_imag",io_rd_imag,-885,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd6;
    io_rs1_imag = 6'd35;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3488,cycle)
    `expect("io_rd_imag",io_rd_imag,4032,cycle)
    `expect("io_rd_real",io_rd_real,-3488,cycle)
    `expect("io_rd_imag",io_rd_imag,4032,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -39;
    io_rs1_imag = -7;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4897,cycle)
    `expect("io_rd_imag",io_rd_imag,-8023,cycle)
    `expect("io_rd_real",io_rd_real,-4897,cycle)
    `expect("io_rd_imag",io_rd_imag,-8023,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd28;
    io_rs1_imag = -26;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,5463,cycle)
    `expect("io_rd_imag",io_rd_imag,-5330,cycle)
    `expect("io_rd_real",io_rd_real,5463,cycle)
    `expect("io_rd_imag",io_rd_imag,-5330,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd13;
    io_rs1_imag = -22;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2362,cycle)
    `expect("io_rd_imag",io_rd_imag,6906,cycle)
    `expect("io_rd_real",io_rd_real,2362,cycle)
    `expect("io_rd_imag",io_rd_imag,6906,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd17;
    io_rs1_imag = -29;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4317,cycle)
    `expect("io_rd_imag",io_rd_imag,62,cycle)
    `expect("io_rd_real",io_rd_real,-4317,cycle)
    `expect("io_rd_imag",io_rd_imag,62,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -37;
    io_rs1_imag = 4'd12;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1205,cycle)
    `expect("io_rd_imag",io_rd_imag,-38,cycle)
    `expect("io_rd_real",io_rd_real,-1205,cycle)
    `expect("io_rd_imag",io_rd_imag,-38,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd30;
    io_rs1_imag = -32;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3468,cycle)
    `expect("io_rd_imag",io_rd_imag,-2735,cycle)
    `expect("io_rd_real",io_rd_real,3468,cycle)
    `expect("io_rd_imag",io_rd_imag,-2735,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd33;
    io_rs1_imag = 6'd38;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,6135,cycle)
    `expect("io_rd_imag",io_rd_imag,3393,cycle)
    `expect("io_rd_real",io_rd_real,6135,cycle)
    `expect("io_rd_imag",io_rd_imag,3393,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule