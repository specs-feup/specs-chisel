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
    io_rs1_real = 20'd981781;
    io_rs1_imag = -1903296;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 20'd901496;
    io_rs1_imag = -1151679;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -2492312;
    io_rs1_imag = 22'd2743299;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -2430710;
    io_rs1_imag = 20'd932843;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -1609260;
    io_rs1_imag = 22'd2537077;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -508237;
    io_rs1_imag = -2408467;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-77560472,cycle)
    `expect("io_rd_imag",io_rd_imag,-21320522,cycle)
    `expect("io_rd_real",io_rd_real,-77560472,cycle)
    `expect("io_rd_imag",io_rd_imag,-21320522,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -29325;
    io_rs1_imag = 22'd2549464;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,24286490,cycle)
    `expect("io_rd_imag",io_rd_imag,14845763,cycle)
    `expect("io_rd_real",io_rd_real,24286490,cycle)
    `expect("io_rd_imag",io_rd_imag,14845763,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -3132974;
    io_rs1_imag = 22'd2386080;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,186906131,cycle)
    `expect("io_rd_imag",io_rd_imag,232636941,cycle)
    `expect("io_rd_real",io_rd_real,186906131,cycle)
    `expect("io_rd_imag",io_rd_imag,232636941,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -2727166;
    io_rs1_imag = -1397223;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-135069743,cycle)
    `expect("io_rd_imag",io_rd_imag,130061822,cycle)
    `expect("io_rd_real",io_rd_real,-135069743,cycle)
    `expect("io_rd_imag",io_rd_imag,130061822,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -2414951;
    io_rs1_imag = -2154885;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-71045200,cycle)
    `expect("io_rd_imag",io_rd_imag,-210838624,cycle)
    `expect("io_rd_real",io_rd_real,-71045200,cycle)
    `expect("io_rd_imag",io_rd_imag,-210838624,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -2089836;
    io_rs1_imag = -502124;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,29483199,cycle)
    `expect("io_rd_imag",io_rd_imag,-191886580,cycle)
    `expect("io_rd_real",io_rd_real,29483199,cycle)
    `expect("io_rd_imag",io_rd_imag,-191886580,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -2341532;
    io_rs1_imag = 20'd814589;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,238647667,cycle)
    `expect("io_rd_imag",io_rd_imag,-75987948,cycle)
    `expect("io_rd_real",io_rd_real,238647667,cycle)
    `expect("io_rd_imag",io_rd_imag,-75987948,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -2791520;
    io_rs1_imag = 19'd509320;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,296871715,cycle)
    `expect("io_rd_imag",io_rd_imag,46953910,cycle)
    `expect("io_rd_real",io_rd_real,296871715,cycle)
    `expect("io_rd_imag",io_rd_imag,46953910,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -1876051;
    io_rs1_imag = -2610646;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,148957430,cycle)
    `expect("io_rd_imag",io_rd_imag,-109255481,cycle)
    `expect("io_rd_real",io_rd_real,148957430,cycle)
    `expect("io_rd_imag",io_rd_imag,-109255481,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -3256023;
    io_rs1_imag = -835776;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,86113446,cycle)
    `expect("io_rd_imag",io_rd_imag,-189238714,cycle)
    `expect("io_rd_real",io_rd_real,86113446,cycle)
    `expect("io_rd_imag",io_rd_imag,-189238714,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -792093;
    io_rs1_imag = -95446;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,228760444,cycle)
    `expect("io_rd_imag",io_rd_imag,-81226977,cycle)
    `expect("io_rd_real",io_rd_real,228760444,cycle)
    `expect("io_rd_imag",io_rd_imag,-81226977,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -1885998;
    io_rs1_imag = 22'd2401030;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,343286236,cycle)
    `expect("io_rd_imag",io_rd_imag,-51611428,cycle)
    `expect("io_rd_real",io_rd_real,343286236,cycle)
    `expect("io_rd_imag",io_rd_imag,-51611428,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -1136022;
    io_rs1_imag = -2500981;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,240510608,cycle)
    `expect("io_rd_imag",io_rd_imag,8300478,cycle)
    `expect("io_rd_real",io_rd_real,240510608,cycle)
    `expect("io_rd_imag",io_rd_imag,8300478,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -641114;
    io_rs1_imag = 21'd1244380;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,81220943,cycle)
    `expect("io_rd_imag",io_rd_imag,-260696758,cycle)
    `expect("io_rd_real",io_rd_real,81220943,cycle)
    `expect("io_rd_imag",io_rd_imag,-260696758,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 21'd1343254;
    io_rs1_imag = -2963533;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,153916822,cycle)
    `expect("io_rd_imag",io_rd_imag,-151684013,cycle)
    `expect("io_rd_real",io_rd_real,153916822,cycle)
    `expect("io_rd_imag",io_rd_imag,-151684013,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 22'd2566227;
    io_rs1_imag = -64506;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,6356411,cycle)
    `expect("io_rd_imag",io_rd_imag,-269405455,cycle)
    `expect("io_rd_real",io_rd_real,6356411,cycle)
    `expect("io_rd_imag",io_rd_imag,-269405455,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 20'd555871;
    io_rs1_imag = -1591284;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,200029731,cycle)
    `expect("io_rd_imag",io_rd_imag,45118147,cycle)
    `expect("io_rd_real",io_rd_real,200029731,cycle)
    `expect("io_rd_imag",io_rd_imag,45118147,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -430171;
    io_rs1_imag = 20'd915059;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-135147648,cycle)
    `expect("io_rd_imag",io_rd_imag,178078522,cycle)
    `expect("io_rd_real",io_rd_real,-135147648,cycle)
    `expect("io_rd_imag",io_rd_imag,178078522,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -89452;
    io_rs1_imag = 18'd257890;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,49263400,cycle)
    `expect("io_rd_imag",io_rd_imag,274084455,cycle)
    `expect("io_rd_real",io_rd_real,49263400,cycle)
    `expect("io_rd_imag",io_rd_imag,274084455,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 22'd2143501;
    io_rs1_imag = 20'd866817;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-19841754,cycle)
    `expect("io_rd_imag",io_rd_imag,70909529,cycle)
    `expect("io_rd_real",io_rd_real,-19841754,cycle)
    `expect("io_rd_imag",io_rd_imag,70909529,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule