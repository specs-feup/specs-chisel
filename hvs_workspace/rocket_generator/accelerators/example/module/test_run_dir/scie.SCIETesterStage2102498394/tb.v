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
  reg signed [63:0] io_rs1_imag = 0;
  reg signed [63:0] io_rs1_real = 0;
  reg[31:0] io_insn = 0;
  reg[0:0] io_valid = 0;
  wire signed [63:0] io_rd_imag;
  wire signed [63:0] io_rd_real;

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
    io_rs1_real = -2934;
    io_rs1_imag = -1746;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 11'd1676;
    io_rs1_imag = 10'd949;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -1300;
    io_rs1_imag = 9'd465;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -2015;
    io_rs1_imag = 11'd1144;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 11'd1703;
    io_rs1_imag = 7'd67;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 12'd2471;
    io_rs1_imag = -186;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-118355,cycle)
    `expect("io_rd_imag",io_rd_imag,-58886,cycle)
    `expect("io_rd_real",io_rd_real,-118355,cycle)
    `expect("io_rd_imag",io_rd_imag,-58886,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -1582;
    io_rs1_imag = -2122;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,82101,cycle)
    `expect("io_rd_imag",io_rd_imag,172208,cycle)
    `expect("io_rd_real",io_rd_real,82101,cycle)
    `expect("io_rd_imag",io_rd_imag,172208,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -3132;
    io_rs1_imag = 12'd2219;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,145315,cycle)
    `expect("io_rd_imag",io_rd_imag,-73579,cycle)
    `expect("io_rd_real",io_rd_real,145315,cycle)
    `expect("io_rd_imag",io_rd_imag,-73579,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -1646;
    io_rs1_imag = -2708;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-140263,cycle)
    `expect("io_rd_imag",io_rd_imag,262352,cycle)
    `expect("io_rd_real",io_rd_real,-140263,cycle)
    `expect("io_rd_imag",io_rd_imag,262352,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 12'd2435;
    io_rs1_imag = -2418;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,20636,cycle)
    `expect("io_rd_imag",io_rd_imag,-82563,cycle)
    `expect("io_rd_real",io_rd_real,20636,cycle)
    `expect("io_rd_imag",io_rd_imag,-82563,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -800;
    io_rs1_imag = -1861;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,157705,cycle)
    `expect("io_rd_imag",io_rd_imag,-60998,cycle)
    `expect("io_rd_real",io_rd_real,157705,cycle)
    `expect("io_rd_imag",io_rd_imag,-60998,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 12'd2411;
    io_rs1_imag = -2121;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-179076,cycle)
    `expect("io_rd_imag",io_rd_imag,149274,cycle)
    `expect("io_rd_real",io_rd_real,-179076,cycle)
    `expect("io_rd_imag",io_rd_imag,149274,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -2228;
    io_rs1_imag = 11'd1607;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,195933,cycle)
    `expect("io_rd_imag",io_rd_imag,45181,cycle)
    `expect("io_rd_real",io_rd_real,195933,cycle)
    `expect("io_rd_imag",io_rd_imag,45181,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -2375;
    io_rs1_imag = -2509;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,50470,cycle)
    `expect("io_rd_imag",io_rd_imag,231961,cycle)
    `expect("io_rd_real",io_rd_real,50470,cycle)
    `expect("io_rd_imag",io_rd_imag,231961,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 9'd422;
    io_rs1_imag = -2826;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-145190,cycle)
    `expect("io_rd_imag",io_rd_imag,27807,cycle)
    `expect("io_rd_real",io_rd_real,-145190,cycle)
    `expect("io_rd_imag",io_rd_imag,27807,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 9'd422;
    io_rs1_imag = -107;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,204959,cycle)
    `expect("io_rd_imag",io_rd_imag,-184983,cycle)
    `expect("io_rd_real",io_rd_real,204959,cycle)
    `expect("io_rd_imag",io_rd_imag,-184983,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -113;
    io_rs1_imag = 5'd26;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,89143,cycle)
    `expect("io_rd_imag",io_rd_imag,142785,cycle)
    `expect("io_rd_real",io_rd_real,89143,cycle)
    `expect("io_rd_imag",io_rd_imag,142785,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 2'd3;
    io_rs1_imag = 9'd411;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-23407,cycle)
    `expect("io_rd_imag",io_rd_imag,12590,cycle)
    `expect("io_rd_real",io_rd_real,-23407,cycle)
    `expect("io_rd_imag",io_rd_imag,12590,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 12'd2876;
    io_rs1_imag = 9'd360;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-123121,cycle)
    `expect("io_rd_imag",io_rd_imag,-149351,cycle)
    `expect("io_rd_real",io_rd_real,-123121,cycle)
    `expect("io_rd_imag",io_rd_imag,-149351,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -1924;
    io_rs1_imag = -2134;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,111349,cycle)
    `expect("io_rd_imag",io_rd_imag,188822,cycle)
    `expect("io_rd_real",io_rd_real,111349,cycle)
    `expect("io_rd_imag",io_rd_imag,188822,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -2657;
    io_rs1_imag = -85;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,29236,cycle)
    `expect("io_rd_imag",io_rd_imag,-6760,cycle)
    `expect("io_rd_real",io_rd_real,29236,cycle)
    `expect("io_rd_imag",io_rd_imag,-6760,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 12'd2099;
    io_rs1_imag = -3185;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-294186,cycle)
    `expect("io_rd_imag",io_rd_imag,127506,cycle)
    `expect("io_rd_real",io_rd_real,-294186,cycle)
    `expect("io_rd_imag",io_rd_imag,127506,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 12'd2094;
    io_rs1_imag = 9'd395;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,246435,cycle)
    `expect("io_rd_imag",io_rd_imag,-99711,cycle)
    `expect("io_rd_real",io_rd_real,246435,cycle)
    `expect("io_rd_imag",io_rd_imag,-99711,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 11'd1565;
    io_rs1_imag = -2528;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-75017,cycle)
    `expect("io_rd_imag",io_rd_imag,90921,cycle)
    `expect("io_rd_real",io_rd_real,-75017,cycle)
    `expect("io_rd_imag",io_rd_imag,90921,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 10'd846;
    io_rs1_imag = -409;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-96644,cycle)
    `expect("io_rd_imag",io_rd_imag,92618,cycle)
    `expect("io_rd_real",io_rd_real,-96644,cycle)
    `expect("io_rd_imag",io_rd_imag,92618,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule