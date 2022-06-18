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
  reg signed [31:0] io_rs1_imag = 0;
  reg signed [31:0] io_rs1_real = 0;
  reg[31:0] io_insn = 0;
  reg[0:0] io_valid = 0;
  wire signed [31:0] io_rd_imag;
  wire signed [31:0] io_rd_real;

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
    io_rs1_real = 14'd8636;
    io_rs1_imag = 13'd4720;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -8113;
    io_rs1_imag = 13'd7752;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -10134;
    io_rs1_imag = -11600;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 14'd10743;
    io_rs1_imag = 7'd88;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 11'd1182;
    io_rs1_imag = 13'd4549;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 11'd1556;
    io_rs1_imag = -10869;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,252887,cycle)
    `expect("io_rd_imag",io_rd_imag,-337971,cycle)
    `expect("io_rd_real",io_rd_real,252887,cycle)
    `expect("io_rd_imag",io_rd_imag,-337971,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 13'd6303;
    io_rs1_imag = -3592;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,558670,cycle)
    `expect("io_rd_imag",io_rd_imag,386609,cycle)
    `expect("io_rd_real",io_rd_real,558670,cycle)
    `expect("io_rd_imag",io_rd_imag,386609,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 13'd7010;
    io_rs1_imag = 14'd10767;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-607117,cycle)
    `expect("io_rd_imag",io_rd_imag,1156916,cycle)
    `expect("io_rd_real",io_rd_real,-607117,cycle)
    `expect("io_rd_imag",io_rd_imag,1156916,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 14'd8628;
    io_rs1_imag = 14'd12119;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-823818,cycle)
    `expect("io_rd_imag",io_rd_imag,-160038,cycle)
    `expect("io_rd_real",io_rd_real,-823818,cycle)
    `expect("io_rd_imag",io_rd_imag,-160038,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 13'd5627;
    io_rs1_imag = 11'd1102;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,205536,cycle)
    `expect("io_rd_imag",io_rd_imag,-896847,cycle)
    `expect("io_rd_real",io_rd_real,205536,cycle)
    `expect("io_rd_imag",io_rd_imag,-896847,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -319;
    io_rs1_imag = -2181;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,408750,cycle)
    `expect("io_rd_imag",io_rd_imag,-265025,cycle)
    `expect("io_rd_real",io_rd_real,408750,cycle)
    `expect("io_rd_imag",io_rd_imag,-265025,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -11647;
    io_rs1_imag = 13'd7619;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-431094,cycle)
    `expect("io_rd_imag",io_rd_imag,488958,cycle)
    `expect("io_rd_real",io_rd_real,-431094,cycle)
    `expect("io_rd_imag",io_rd_imag,488958,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 12'd3499;
    io_rs1_imag = 13'd5864;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,122362,cycle)
    `expect("io_rd_imag",io_rd_imag,26431,cycle)
    `expect("io_rd_real",io_rd_real,122362,cycle)
    `expect("io_rd_imag",io_rd_imag,26431,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 13'd5146;
    io_rs1_imag = -5977;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,795395,cycle)
    `expect("io_rd_imag",io_rd_imag,52956,cycle)
    `expect("io_rd_real",io_rd_real,795395,cycle)
    `expect("io_rd_imag",io_rd_imag,52956,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 12'd4018;
    io_rs1_imag = -10517;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,20459,cycle)
    `expect("io_rd_imag",io_rd_imag,-26149,cycle)
    `expect("io_rd_real",io_rd_real,20459,cycle)
    `expect("io_rd_imag",io_rd_imag,-26149,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -4209;
    io_rs1_imag = -11442;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-258780,cycle)
    `expect("io_rd_imag",io_rd_imag,70304,cycle)
    `expect("io_rd_real",io_rd_real,-258780,cycle)
    `expect("io_rd_imag",io_rd_imag,70304,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -10163;
    io_rs1_imag = -486;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-359662,cycle)
    `expect("io_rd_imag",io_rd_imag,105839,cycle)
    `expect("io_rd_real",io_rd_real,-359662,cycle)
    `expect("io_rd_imag",io_rd_imag,105839,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 13'd7682;
    io_rs1_imag = 14'd11893;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,327016,cycle)
    `expect("io_rd_imag",io_rd_imag,518038,cycle)
    `expect("io_rd_real",io_rd_real,327016,cycle)
    `expect("io_rd_imag",io_rd_imag,518038,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 12'd2075;
    io_rs1_imag = -4013;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-46573,cycle)
    `expect("io_rd_imag",io_rd_imag,-220424,cycle)
    `expect("io_rd_real",io_rd_real,-46573,cycle)
    `expect("io_rd_imag",io_rd_imag,-220424,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 10'd652;
    io_rs1_imag = -2589;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,117854,cycle)
    `expect("io_rd_imag",io_rd_imag,-855703,cycle)
    `expect("io_rd_real",io_rd_real,117854,cycle)
    `expect("io_rd_imag",io_rd_imag,-855703,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 11'd1563;
    io_rs1_imag = 14'd11643;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-88189,cycle)
    `expect("io_rd_imag",io_rd_imag,907107,cycle)
    `expect("io_rd_real",io_rd_real,-88189,cycle)
    `expect("io_rd_imag",io_rd_imag,907107,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -9353;
    io_rs1_imag = -6551;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-827364,cycle)
    `expect("io_rd_imag",io_rd_imag,-618423,cycle)
    `expect("io_rd_real",io_rd_real,-827364,cycle)
    `expect("io_rd_imag",io_rd_imag,-618423,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -9085;
    io_rs1_imag = -11188;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,969425,cycle)
    `expect("io_rd_imag",io_rd_imag,-1242338,cycle)
    `expect("io_rd_real",io_rd_real,969425,cycle)
    `expect("io_rd_imag",io_rd_imag,-1242338,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 13'd4561;
    io_rs1_imag = 13'd6579;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,843274,cycle)
    `expect("io_rd_imag",io_rd_imag,1557391,cycle)
    `expect("io_rd_real",io_rd_real,843274,cycle)
    `expect("io_rd_imag",io_rd_imag,1557391,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 14'd10380;
    io_rs1_imag = -10225;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-542316,cycle)
    `expect("io_rd_imag",io_rd_imag,434018,cycle)
    `expect("io_rd_real",io_rd_real,-542316,cycle)
    `expect("io_rd_imag",io_rd_imag,434018,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule