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
    io_rs1_real = 1'd0;
    io_rs1_imag = -33;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -29;
    io_rs1_imag = -32;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -44;
    io_rs1_imag = -21;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -25;
    io_rs1_imag = 6'd40;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -26;
    io_rs1_imag = 6'd40;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -11;
    io_rs1_imag = -44;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1452,cycle)
    `expect("io_rd_imag",io_rd_imag,363,cycle)
    `expect("io_rd_real",io_rd_real,-1452,cycle)
    `expect("io_rd_imag",io_rd_imag,363,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -36;
    io_rs1_imag = -13;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1518,cycle)
    `expect("io_rd_imag",io_rd_imag,2816,cycle)
    `expect("io_rd_real",io_rd_real,-1518,cycle)
    `expect("io_rd_imag",io_rd_imag,2816,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -41;
    io_rs1_imag = -31;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-835,cycle)
    `expect("io_rd_imag",io_rd_imag,5049,cycle)
    `expect("io_rd_real",io_rd_real,-835,cycle)
    `expect("io_rd_imag",io_rd_imag,5049,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd27;
    io_rs1_imag = -23;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2784,cycle)
    `expect("io_rd_imag",io_rd_imag,3308,cycle)
    `expect("io_rd_real",io_rd_real,2784,cycle)
    `expect("io_rd_imag",io_rd_imag,3308,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -23;
    io_rs1_imag = 5'd22;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3826,cycle)
    `expect("io_rd_imag",io_rd_imag,2376,cycle)
    `expect("io_rd_real",io_rd_real,3826,cycle)
    `expect("io_rd_imag",io_rd_imag,2376,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd6;
    io_rs1_imag = -1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3388,cycle)
    `expect("io_rd_imag",io_rd_imag,-1622,cycle)
    `expect("io_rd_real",io_rd_real,3388,cycle)
    `expect("io_rd_imag",io_rd_imag,-1622,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -21;
    io_rs1_imag = -26;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2961,cycle)
    `expect("io_rd_imag",io_rd_imag,866,cycle)
    `expect("io_rd_real",io_rd_real,2961,cycle)
    `expect("io_rd_imag",io_rd_imag,866,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd46;
    io_rs1_imag = -31;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1618,cycle)
    `expect("io_rd_imag",io_rd_imag,34,cycle)
    `expect("io_rd_real",io_rd_real,-1618,cycle)
    `expect("io_rd_imag",io_rd_imag,34,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -48;
    io_rs1_imag = -49;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3957,cycle)
    `expect("io_rd_imag",io_rd_imag,1369,cycle)
    `expect("io_rd_real",io_rd_real,-3957,cycle)
    `expect("io_rd_imag",io_rd_imag,1369,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -8;
    io_rs1_imag = 5'd26;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-544,cycle)
    `expect("io_rd_imag",io_rd_imag,3695,cycle)
    `expect("io_rd_real",io_rd_real,-544,cycle)
    `expect("io_rd_imag",io_rd_imag,3695,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -8;
    io_rs1_imag = 5'd24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,4615,cycle)
    `expect("io_rd_imag",io_rd_imag,5381,cycle)
    `expect("io_rd_real",io_rd_real,4615,cycle)
    `expect("io_rd_imag",io_rd_imag,5381,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd34;
    io_rs1_imag = -18;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,4508,cycle)
    `expect("io_rd_imag",io_rd_imag,-587,cycle)
    `expect("io_rd_real",io_rd_real,4508,cycle)
    `expect("io_rd_imag",io_rd_imag,-587,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -24;
    io_rs1_imag = -19;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1035,cycle)
    `expect("io_rd_imag",io_rd_imag,-2278,cycle)
    `expect("io_rd_real",io_rd_real,1035,cycle)
    `expect("io_rd_imag",io_rd_imag,-2278,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd19;
    io_rs1_imag = -31;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4401,cycle)
    `expect("io_rd_imag",io_rd_imag,-1146,cycle)
    `expect("io_rd_real",io_rd_real,-4401,cycle)
    `expect("io_rd_imag",io_rd_imag,-1146,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -15;
    io_rs1_imag = 6'd42;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-382,cycle)
    `expect("io_rd_imag",io_rd_imag,2992,cycle)
    `expect("io_rd_real",io_rd_real,-382,cycle)
    `expect("io_rd_imag",io_rd_imag,2992,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -41;
    io_rs1_imag = 6'd50;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3138,cycle)
    `expect("io_rd_imag",io_rd_imag,2923,cycle)
    `expect("io_rd_real",io_rd_real,3138,cycle)
    `expect("io_rd_imag",io_rd_imag,2923,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd13;
    io_rs1_imag = 5'd24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,7272,cycle)
    `expect("io_rd_imag",io_rd_imag,-1031,cycle)
    `expect("io_rd_real",io_rd_real,7272,cycle)
    `expect("io_rd_imag",io_rd_imag,-1031,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -7;
    io_rs1_imag = -17;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2125,cycle)
    `expect("io_rd_imag",io_rd_imag,-2304,cycle)
    `expect("io_rd_real",io_rd_real,2125,cycle)
    `expect("io_rd_imag",io_rd_imag,-2304,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -46;
    io_rs1_imag = 6'd42;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1288,cycle)
    `expect("io_rd_imag",io_rd_imag,-3676,cycle)
    `expect("io_rd_real",io_rd_real,-1288,cycle)
    `expect("io_rd_imag",io_rd_imag,-3676,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -36;
    io_rs1_imag = -15;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-85,cycle)
    `expect("io_rd_imag",io_rd_imag,-683,cycle)
    `expect("io_rd_real",io_rd_real,-85,cycle)
    `expect("io_rd_imag",io_rd_imag,-683,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule