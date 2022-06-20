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
    io_rs1_real = 2'd3;
    io_rs1_imag = -21;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -10;
    io_rs1_imag = -13;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -12;
    io_rs1_imag = 5'd20;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -28;
    io_rs1_imag = 6'd33;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -4;
    io_rs1_imag = 2'd2;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -27;
    io_rs1_imag = -25;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-606,cycle)
    `expect("io_rd_imag",io_rd_imag,492,cycle)
    `expect("io_rd_real",io_rd_real,-606,cycle)
    `expect("io_rd_imag",io_rd_imag,492,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -16;
    io_rs1_imag = -28;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-691,cycle)
    `expect("io_rd_imag",io_rd_imag,853,cycle)
    `expect("io_rd_real",io_rd_real,-691,cycle)
    `expect("io_rd_imag",io_rd_imag,853,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -36;
    io_rs1_imag = -32;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-160,cycle)
    `expect("io_rd_imag",io_rd_imag,908,cycle)
    `expect("io_rd_real",io_rd_real,-160,cycle)
    `expect("io_rd_imag",io_rd_imag,908,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -34;
    io_rs1_imag = -14;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1881,cycle)
    `expect("io_rd_imag",io_rd_imag,1285,cycle)
    `expect("io_rd_real",io_rd_real,1881,cycle)
    `expect("io_rd_imag",io_rd_imag,1285,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -18;
    io_rs1_imag = -30;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2076,cycle)
    `expect("io_rd_imag",io_rd_imag,836,cycle)
    `expect("io_rd_real",io_rd_real,2076,cycle)
    `expect("io_rd_imag",io_rd_imag,836,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd40;
    io_rs1_imag = 6'd40;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3622,cycle)
    `expect("io_rd_imag",io_rd_imag,-910,cycle)
    `expect("io_rd_real",io_rd_real,3622,cycle)
    `expect("io_rd_imag",io_rd_imag,-910,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -4;
    io_rs1_imag = 6'd37;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3323,cycle)
    `expect("io_rd_imag",io_rd_imag,-1399,cycle)
    `expect("io_rd_real",io_rd_real,3323,cycle)
    `expect("io_rd_imag",io_rd_imag,-1399,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -1;
    io_rs1_imag = 6'd50;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1946,cycle)
    `expect("io_rd_imag",io_rd_imag,407,cycle)
    `expect("io_rd_real",io_rd_real,1946,cycle)
    `expect("io_rd_imag",io_rd_imag,407,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd38;
    io_rs1_imag = 6'd32;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1554,cycle)
    `expect("io_rd_imag",io_rd_imag,-1429,cycle)
    `expect("io_rd_real",io_rd_real,-1554,cycle)
    `expect("io_rd_imag",io_rd_imag,-1429,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -48;
    io_rs1_imag = 6'd33;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1752,cycle)
    `expect("io_rd_imag",io_rd_imag,-1575,cycle)
    `expect("io_rd_real",io_rd_real,-1752,cycle)
    `expect("io_rd_imag",io_rd_imag,-1575,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -36;
    io_rs1_imag = -37;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2752,cycle)
    `expect("io_rd_imag",io_rd_imag,-274,cycle)
    `expect("io_rd_real",io_rd_real,-2752,cycle)
    `expect("io_rd_imag",io_rd_imag,-274,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd48;
    io_rs1_imag = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2214,cycle)
    `expect("io_rd_imag",io_rd_imag,-1361,cycle)
    `expect("io_rd_real",io_rd_real,-2214,cycle)
    `expect("io_rd_imag",io_rd_imag,-1361,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd12;
    io_rs1_imag = 6'd42;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1688,cycle)
    `expect("io_rd_imag",io_rd_imag,-3616,cycle)
    `expect("io_rd_real",io_rd_real,1688,cycle)
    `expect("io_rd_imag",io_rd_imag,-3616,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd38;
    io_rs1_imag = -48;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1251,cycle)
    `expect("io_rd_imag",io_rd_imag,-974,cycle)
    `expect("io_rd_real",io_rd_real,1251,cycle)
    `expect("io_rd_imag",io_rd_imag,-974,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd7;
    io_rs1_imag = -18;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3570,cycle)
    `expect("io_rd_imag",io_rd_imag,1097,cycle)
    `expect("io_rd_real",io_rd_real,-3570,cycle)
    `expect("io_rd_imag",io_rd_imag,1097,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd7;
    io_rs1_imag = -18;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2077,cycle)
    `expect("io_rd_imag",io_rd_imag,528,cycle)
    `expect("io_rd_real",io_rd_real,-2077,cycle)
    `expect("io_rd_imag",io_rd_imag,528,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -26;
    io_rs1_imag = 3'd6;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,408,cycle)
    `expect("io_rd_imag",io_rd_imag,3463,cycle)
    `expect("io_rd_real",io_rd_real,408,cycle)
    `expect("io_rd_imag",io_rd_imag,3463,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd22;
    io_rs1_imag = 4'd10;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1232,cycle)
    `expect("io_rd_imag",io_rd_imag,1205,cycle)
    `expect("io_rd_real",io_rd_real,1232,cycle)
    `expect("io_rd_imag",io_rd_imag,1205,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -19;
    io_rs1_imag = -30;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-179,cycle)
    `expect("io_rd_imag",io_rd_imag,152,cycle)
    `expect("io_rd_real",io_rd_real,-179,cycle)
    `expect("io_rd_imag",io_rd_imag,152,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -38;
    io_rs1_imag = 6'd41;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,621,cycle)
    `expect("io_rd_imag",io_rd_imag,848,cycle)
    `expect("io_rd_real",io_rd_real,621,cycle)
    `expect("io_rd_imag",io_rd_imag,848,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule