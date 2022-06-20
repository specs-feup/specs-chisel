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
    io_rs1_real = -12;
    io_rs1_imag = -9;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -27;
    io_rs1_imag = -35;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -5;
    io_rs1_imag = -12;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 5'd28;
    io_rs1_imag = 4'd11;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -9;
    io_rs1_imag = 5'd16;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd25;
    io_rs1_imag = 6'd46;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,114,cycle)
    `expect("io_rd_imag",io_rd_imag,-777,cycle)
    `expect("io_rd_real",io_rd_real,114,cycle)
    `expect("io_rd_imag",io_rd_imag,-777,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -34;
    io_rs1_imag = 6'd43;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1730,cycle)
    `expect("io_rd_imag",io_rd_imag,-2327,cycle)
    `expect("io_rd_real",io_rd_real,1730,cycle)
    `expect("io_rd_imag",io_rd_imag,-2327,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd48;
    io_rs1_imag = 5'd29;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2535,cycle)
    `expect("io_rd_imag",io_rd_imag,-1281,cycle)
    `expect("io_rd_real",io_rd_real,2535,cycle)
    `expect("io_rd_imag",io_rd_imag,-1281,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -16;
    io_rs1_imag = -25;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,566,cycle)
    `expect("io_rd_imag",io_rd_imag,-263,cycle)
    `expect("io_rd_real",io_rd_real,566,cycle)
    `expect("io_rd_imag",io_rd_imag,-263,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd11;
    io_rs1_imag = -14;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2979,cycle)
    `expect("io_rd_imag",io_rd_imag,1399,cycle)
    `expect("io_rd_real",io_rd_real,-2979,cycle)
    `expect("io_rd_imag",io_rd_imag,1399,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -13;
    io_rs1_imag = 6'd37;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,125,cycle)
    `expect("io_rd_imag",io_rd_imag,392,cycle)
    `expect("io_rd_real",io_rd_real,125,cycle)
    `expect("io_rd_imag",io_rd_imag,392,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 2'd3;
    io_rs1_imag = -44;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-78,cycle)
    `expect("io_rd_imag",io_rd_imag,-474,cycle)
    `expect("io_rd_real",io_rd_real,-78,cycle)
    `expect("io_rd_imag",io_rd_imag,-474,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 1'd0;
    io_rs1_imag = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-97,cycle)
    `expect("io_rd_imag",io_rd_imag,740,cycle)
    `expect("io_rd_real",io_rd_real,-97,cycle)
    `expect("io_rd_imag",io_rd_imag,740,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -17;
    io_rs1_imag = -37;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1283,cycle)
    `expect("io_rd_imag",io_rd_imag,1949,cycle)
    `expect("io_rd_real",io_rd_real,-1283,cycle)
    `expect("io_rd_imag",io_rd_imag,1949,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd39;
    io_rs1_imag = -37;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1532,cycle)
    `expect("io_rd_imag",io_rd_imag,-58,cycle)
    `expect("io_rd_real",io_rd_real,-1532,cycle)
    `expect("io_rd_imag",io_rd_imag,-58,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -35;
    io_rs1_imag = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1585,cycle)
    `expect("io_rd_imag",io_rd_imag,762,cycle)
    `expect("io_rd_real",io_rd_real,-1585,cycle)
    `expect("io_rd_imag",io_rd_imag,762,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -48;
    io_rs1_imag = -28;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,685,cycle)
    `expect("io_rd_imag",io_rd_imag,370,cycle)
    `expect("io_rd_real",io_rd_real,685,cycle)
    `expect("io_rd_imag",io_rd_imag,370,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -41;
    io_rs1_imag = -24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3059,cycle)
    `expect("io_rd_imag",io_rd_imag,2947,cycle)
    `expect("io_rd_real",io_rd_real,3059,cycle)
    `expect("io_rd_imag",io_rd_imag,2947,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd34;
    io_rs1_imag = 5'd17;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-867,cycle)
    `expect("io_rd_imag",io_rd_imag,2973,cycle)
    `expect("io_rd_real",io_rd_real,-867,cycle)
    `expect("io_rd_imag",io_rd_imag,2973,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -4;
    io_rs1_imag = 5'd28;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-891,cycle)
    `expect("io_rd_imag",io_rd_imag,-3245,cycle)
    `expect("io_rd_real",io_rd_real,-891,cycle)
    `expect("io_rd_imag",io_rd_imag,-3245,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -5;
    io_rs1_imag = -34;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,872,cycle)
    `expect("io_rd_imag",io_rd_imag,-2295,cycle)
    `expect("io_rd_real",io_rd_real,872,cycle)
    `expect("io_rd_imag",io_rd_imag,-2295,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -7;
    io_rs1_imag = -38;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,561,cycle)
    `expect("io_rd_imag",io_rd_imag,1930,cycle)
    `expect("io_rd_real",io_rd_real,561,cycle)
    `expect("io_rd_imag",io_rd_imag,1930,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -47;
    io_rs1_imag = 6'd32;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1670,cycle)
    `expect("io_rd_imag",io_rd_imag,2671,cycle)
    `expect("io_rd_real",io_rd_real,-1670,cycle)
    `expect("io_rd_imag",io_rd_imag,2671,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -44;
    io_rs1_imag = -29;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2057,cycle)
    `expect("io_rd_imag",io_rd_imag,476,cycle)
    `expect("io_rd_real",io_rd_real,2057,cycle)
    `expect("io_rd_imag",io_rd_imag,476,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd22;
    io_rs1_imag = 5'd29;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1600,cycle)
    `expect("io_rd_imag",io_rd_imag,1266,cycle)
    `expect("io_rd_real",io_rd_real,1600,cycle)
    `expect("io_rd_imag",io_rd_imag,1266,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule