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
    io_rs1_real = 2'd2;
    io_rs1_imag = 6'd42;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -29;
    io_rs1_imag = -21;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 4'd13;
    io_rs1_imag = 6'd33;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -25;
    io_rs1_imag = -46;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -49;
    io_rs1_imag = -37;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 1'd1;
    io_rs1_imag = -12;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,506,cycle)
    `expect("io_rd_imag",io_rd_imag,18,cycle)
    `expect("io_rd_real",io_rd_real,506,cycle)
    `expect("io_rd_imag",io_rd_imag,18,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd40;
    io_rs1_imag = 5'd17;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-915,cycle)
    `expect("io_rd_imag",io_rd_imag,2041,cycle)
    `expect("io_rd_real",io_rd_real,-915,cycle)
    `expect("io_rd_imag",io_rd_imag,2041,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -15;
    io_rs1_imag = 5'd23;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1390,cycle)
    `expect("io_rd_imag",io_rd_imag,-2040,cycle)
    `expect("io_rd_real",io_rd_real,-1390,cycle)
    `expect("io_rd_imag",io_rd_imag,-2040,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd22;
    io_rs1_imag = -6;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,596,cycle)
    `expect("io_rd_imag",io_rd_imag,2355,cycle)
    `expect("io_rd_real",io_rd_real,596,cycle)
    `expect("io_rd_imag",io_rd_imag,2355,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd20;
    io_rs1_imag = -44;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-541,cycle)
    `expect("io_rd_imag",io_rd_imag,-1446,cycle)
    `expect("io_rd_real",io_rd_real,-541,cycle)
    `expect("io_rd_imag",io_rd_imag,-1446,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -34;
    io_rs1_imag = 5'd29;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2204,cycle)
    `expect("io_rd_imag",io_rd_imag,-2064,cycle)
    `expect("io_rd_real",io_rd_real,-2204,cycle)
    `expect("io_rd_imag",io_rd_imag,-2064,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -32;
    io_rs1_imag = 3'd6;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3751,cycle)
    `expect("io_rd_imag",io_rd_imag,-2805,cycle)
    `expect("io_rd_real",io_rd_real,3751,cycle)
    `expect("io_rd_imag",io_rd_imag,-2805,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd47;
    io_rs1_imag = -3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3949,cycle)
    `expect("io_rd_imag",io_rd_imag,1381,cycle)
    `expect("io_rd_real",io_rd_real,-3949,cycle)
    `expect("io_rd_imag",io_rd_imag,1381,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd31;
    io_rs1_imag = 5'd29;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3620,cycle)
    `expect("io_rd_imag",io_rd_imag,1737,cycle)
    `expect("io_rd_real",io_rd_real,-3620,cycle)
    `expect("io_rd_imag",io_rd_imag,1737,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd4;
    io_rs1_imag = 5'd31;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2941,cycle)
    `expect("io_rd_imag",io_rd_imag,1409,cycle)
    `expect("io_rd_real",io_rd_real,2941,cycle)
    `expect("io_rd_imag",io_rd_imag,1409,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd16;
    io_rs1_imag = 6'd44;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1358,cycle)
    `expect("io_rd_imag",io_rd_imag,-20,cycle)
    `expect("io_rd_real",io_rd_real,-1358,cycle)
    `expect("io_rd_imag",io_rd_imag,-20,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd45;
    io_rs1_imag = 5'd25;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3326,cycle)
    `expect("io_rd_imag",io_rd_imag,-2880,cycle)
    `expect("io_rd_real",io_rd_real,-3326,cycle)
    `expect("io_rd_imag",io_rd_imag,-2880,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -34;
    io_rs1_imag = -21;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-330,cycle)
    `expect("io_rd_imag",io_rd_imag,-5567,cycle)
    `expect("io_rd_real",io_rd_real,-330,cycle)
    `expect("io_rd_imag",io_rd_imag,-5567,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd10;
    io_rs1_imag = 3'd6;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2648,cycle)
    `expect("io_rd_imag",io_rd_imag,62,cycle)
    `expect("io_rd_real",io_rd_real,2648,cycle)
    `expect("io_rd_imag",io_rd_imag,62,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -13;
    io_rs1_imag = -15;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1560,cycle)
    `expect("io_rd_imag",io_rd_imag,-7798,cycle)
    `expect("io_rd_real",io_rd_real,1560,cycle)
    `expect("io_rd_imag",io_rd_imag,-7798,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -46;
    io_rs1_imag = -38;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,102,cycle)
    `expect("io_rd_imag",io_rd_imag,-1693,cycle)
    `expect("io_rd_real",io_rd_real,102,cycle)
    `expect("io_rd_imag",io_rd_imag,-1693,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -7;
    io_rs1_imag = -19;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2561,cycle)
    `expect("io_rd_imag",io_rd_imag,2789,cycle)
    `expect("io_rd_real",io_rd_real,2561,cycle)
    `expect("io_rd_imag",io_rd_imag,2789,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 2'd2;
    io_rs1_imag = 4'd9;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-547,cycle)
    `expect("io_rd_imag",io_rd_imag,-903,cycle)
    `expect("io_rd_real",io_rd_real,-547,cycle)
    `expect("io_rd_imag",io_rd_imag,-903,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -36;
    io_rs1_imag = 5'd24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-929,cycle)
    `expect("io_rd_imag",io_rd_imag,2037,cycle)
    `expect("io_rd_real",io_rd_real,-929,cycle)
    `expect("io_rd_imag",io_rd_imag,2037,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -29;
    io_rs1_imag = -16;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2040,cycle)
    `expect("io_rd_imag",io_rd_imag,3354,cycle)
    `expect("io_rd_real",io_rd_real,2040,cycle)
    `expect("io_rd_imag",io_rd_imag,3354,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule