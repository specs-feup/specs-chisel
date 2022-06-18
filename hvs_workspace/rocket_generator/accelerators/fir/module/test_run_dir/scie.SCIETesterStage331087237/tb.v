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
    io_rs1_imag = -30;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 4'd10;
    io_rs1_imag = 2'd3;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 2'd3;
    io_rs1_imag = 3'd7;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 6'd47;
    io_rs1_imag = 3'd5;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 5'd21;
    io_rs1_imag = -15;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -40;
    io_rs1_imag = -41;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-750,cycle)
    `expect("io_rd_imag",io_rd_imag,1692,cycle)
    `expect("io_rd_real",io_rd_real,-750,cycle)
    `expect("io_rd_imag",io_rd_imag,1692,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -16;
    io_rs1_imag = 6'd44;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1235,cycle)
    `expect("io_rd_imag",io_rd_imag,-578,cycle)
    `expect("io_rd_real",io_rd_real,1235,cycle)
    `expect("io_rd_imag",io_rd_imag,-578,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd48;
    io_rs1_imag = 3'd7;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-491,cycle)
    `expect("io_rd_imag",io_rd_imag,-1535,cycle)
    `expect("io_rd_real",io_rd_real,-491,cycle)
    `expect("io_rd_imag",io_rd_imag,-1535,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -22;
    io_rs1_imag = -41;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2538,cycle)
    `expect("io_rd_imag",io_rd_imag,-741,cycle)
    `expect("io_rd_real",io_rd_real,-2538,cycle)
    `expect("io_rd_imag",io_rd_imag,-741,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -24;
    io_rs1_imag = -44;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3461,cycle)
    `expect("io_rd_imag",io_rd_imag,2856,cycle)
    `expect("io_rd_real",io_rd_real,-3461,cycle)
    `expect("io_rd_imag",io_rd_imag,2856,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule