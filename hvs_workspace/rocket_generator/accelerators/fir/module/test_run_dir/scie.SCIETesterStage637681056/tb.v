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
    io_rs1_real = -15;
    io_rs1_imag = 5'd19;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -18;
    io_rs1_imag = -44;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -11;
    io_rs1_imag = -40;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -39;
    io_rs1_imag = 2'd2;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 4'd11;
    io_rs1_imag = -36;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -21;
    io_rs1_imag = -9;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,486,cycle)
    `expect("io_rd_imag",io_rd_imag,-264,cycle)
    `expect("io_rd_real",io_rd_real,486,cycle)
    `expect("io_rd_imag",io_rd_imag,-264,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd29;
    io_rs1_imag = 5'd25;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-928,cycle)
    `expect("io_rd_imag",io_rd_imag,1262,cycle)
    `expect("io_rd_real",io_rd_real,-928,cycle)
    `expect("io_rd_imag",io_rd_imag,1262,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -25;
    io_rs1_imag = -5;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,919,cycle)
    `expect("io_rd_imag",io_rd_imag,-1187,cycle)
    `expect("io_rd_real",io_rd_real,919,cycle)
    `expect("io_rd_imag",io_rd_imag,-1187,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -14;
    io_rs1_imag = 4'd13;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1711,cycle)
    `expect("io_rd_imag",io_rd_imag,-397,cycle)
    `expect("io_rd_real",io_rd_real,1711,cycle)
    `expect("io_rd_imag",io_rd_imag,-397,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -27;
    io_rs1_imag = 5'd16;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-736,cycle)
    `expect("io_rd_imag",io_rd_imag,424,cycle)
    `expect("io_rd_real",io_rd_real,-736,cycle)
    `expect("io_rd_imag",io_rd_imag,424,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd29;
    io_rs1_imag = -22;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,4051,cycle)
    `expect("io_rd_imag",io_rd_imag,1574,cycle)
    `expect("io_rd_real",io_rd_real,4051,cycle)
    `expect("io_rd_imag",io_rd_imag,1574,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -49;
    io_rs1_imag = 6'd47;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-646,cycle)
    `expect("io_rd_imag",io_rd_imag,-1302,cycle)
    `expect("io_rd_real",io_rd_real,-646,cycle)
    `expect("io_rd_imag",io_rd_imag,-1302,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 2'd3;
    io_rs1_imag = 6'd32;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2433,cycle)
    `expect("io_rd_imag",io_rd_imag,-62,cycle)
    `expect("io_rd_real",io_rd_real,2433,cycle)
    `expect("io_rd_imag",io_rd_imag,-62,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -16;
    io_rs1_imag = -4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3281,cycle)
    `expect("io_rd_imag",io_rd_imag,2555,cycle)
    `expect("io_rd_real",io_rd_real,3281,cycle)
    `expect("io_rd_imag",io_rd_imag,2555,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -45;
    io_rs1_imag = 4'd9;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3207,cycle)
    `expect("io_rd_imag",io_rd_imag,-3903,cycle)
    `expect("io_rd_real",io_rd_real,3207,cycle)
    `expect("io_rd_imag",io_rd_imag,-3903,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd33;
    io_rs1_imag = 3'd7;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1566,cycle)
    `expect("io_rd_imag",io_rd_imag,4063,cycle)
    `expect("io_rd_real",io_rd_real,1566,cycle)
    `expect("io_rd_imag",io_rd_imag,4063,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd11;
    io_rs1_imag = 5'd29;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1670,cycle)
    `expect("io_rd_imag",io_rd_imag,265,cycle)
    `expect("io_rd_real",io_rd_real,1670,cycle)
    `expect("io_rd_imag",io_rd_imag,265,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -15;
    io_rs1_imag = 5'd25;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2162,cycle)
    `expect("io_rd_imag",io_rd_imag,-2972,cycle)
    `expect("io_rd_real",io_rd_real,2162,cycle)
    `expect("io_rd_imag",io_rd_imag,-2972,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -21;
    io_rs1_imag = -35;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1917,cycle)
    `expect("io_rd_imag",io_rd_imag,1089,cycle)
    `expect("io_rd_real",io_rd_real,1917,cycle)
    `expect("io_rd_imag",io_rd_imag,1089,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd46;
    io_rs1_imag = 5'd25;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1034,cycle)
    `expect("io_rd_imag",io_rd_imag,158,cycle)
    `expect("io_rd_real",io_rd_real,-1034,cycle)
    `expect("io_rd_imag",io_rd_imag,158,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd30;
    io_rs1_imag = 5'd24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-103,cycle)
    `expect("io_rd_imag",io_rd_imag,-2121,cycle)
    `expect("io_rd_real",io_rd_real,-103,cycle)
    `expect("io_rd_imag",io_rd_imag,-2121,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -7;
    io_rs1_imag = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2701,cycle)
    `expect("io_rd_imag",io_rd_imag,-1892,cycle)
    `expect("io_rd_real",io_rd_real,2701,cycle)
    `expect("io_rd_imag",io_rd_imag,-1892,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd47;
    io_rs1_imag = 6'd48;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4108,cycle)
    `expect("io_rd_imag",io_rd_imag,-1531,cycle)
    `expect("io_rd_real",io_rd_real,-4108,cycle)
    `expect("io_rd_imag",io_rd_imag,-1531,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd20;
    io_rs1_imag = 4'd9;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1140,cycle)
    `expect("io_rd_imag",io_rd_imag,-4686,cycle)
    `expect("io_rd_real",io_rd_real,1140,cycle)
    `expect("io_rd_imag",io_rd_imag,-4686,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -19;
    io_rs1_imag = -7;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3320,cycle)
    `expect("io_rd_imag",io_rd_imag,-4614,cycle)
    `expect("io_rd_real",io_rd_real,3320,cycle)
    `expect("io_rd_imag",io_rd_imag,-4614,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule