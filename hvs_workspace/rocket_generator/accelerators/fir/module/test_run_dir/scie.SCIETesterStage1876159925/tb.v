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
    io_rs1_real = 5'd29;
    io_rs1_imag = 4'd9;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -1;
    io_rs1_imag = 6'd36;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -15;
    io_rs1_imag = 6'd32;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -4;
    io_rs1_imag = 5'd30;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-386,cycle)
    `expect("io_rd_imag",io_rd_imag,834,cycle)
    `expect("io_rd_real",io_rd_real,-386,cycle)
    `expect("io_rd_imag",io_rd_imag,834,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -5;
    io_rs1_imag = 4'd9;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1302,cycle)
    `expect("io_rd_imag",io_rd_imag,42,cycle)
    `expect("io_rd_real",io_rd_real,-1302,cycle)
    `expect("io_rd_imag",io_rd_imag,42,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -28;
    io_rs1_imag = -44;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1635,cycle)
    `expect("io_rd_imag",io_rd_imag,-2295,cycle)
    `expect("io_rd_real",io_rd_real,-1635,cycle)
    `expect("io_rd_imag",io_rd_imag,-2295,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd50;
    io_rs1_imag = 5'd18;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2687,cycle)
    `expect("io_rd_imag",io_rd_imag,-287,cycle)
    `expect("io_rd_real",io_rd_real,2687,cycle)
    `expect("io_rd_imag",io_rd_imag,-287,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd10;
    io_rs1_imag = -18;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1582,cycle)
    `expect("io_rd_imag",io_rd_imag,1114,cycle)
    `expect("io_rd_real",io_rd_real,1582,cycle)
    `expect("io_rd_imag",io_rd_imag,1114,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -42;
    io_rs1_imag = 6'd48;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2338,cycle)
    `expect("io_rd_imag",io_rd_imag,2722,cycle)
    `expect("io_rd_real",io_rd_real,-2338,cycle)
    `expect("io_rd_imag",io_rd_imag,2722,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd25;
    io_rs1_imag = -5;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-490,cycle)
    `expect("io_rd_imag",io_rd_imag,-890,cycle)
    `expect("io_rd_real",io_rd_real,-490,cycle)
    `expect("io_rd_imag",io_rd_imag,-890,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd25;
    io_rs1_imag = 6'd41;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-395,cycle)
    `expect("io_rd_imag",io_rd_imag,255,cycle)
    `expect("io_rd_real",io_rd_real,-395,cycle)
    `expect("io_rd_imag",io_rd_imag,255,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd24;
    io_rs1_imag = -29;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-759,cycle)
    `expect("io_rd_imag",io_rd_imag,1109,cycle)
    `expect("io_rd_real",io_rd_real,-759,cycle)
    `expect("io_rd_imag",io_rd_imag,1109,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd17;
    io_rs1_imag = 6'd38;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-516,cycle)
    `expect("io_rd_imag",io_rd_imag,2333,cycle)
    `expect("io_rd_real",io_rd_real,-516,cycle)
    `expect("io_rd_imag",io_rd_imag,2333,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd28;
    io_rs1_imag = -41;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,364,cycle)
    `expect("io_rd_imag",io_rd_imag,840,cycle)
    `expect("io_rd_real",io_rd_real,364,cycle)
    `expect("io_rd_imag",io_rd_imag,840,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -2;
    io_rs1_imag = -31;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,198,cycle)
    `expect("io_rd_imag",io_rd_imag,106,cycle)
    `expect("io_rd_real",io_rd_real,198,cycle)
    `expect("io_rd_imag",io_rd_imag,106,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -21;
    io_rs1_imag = 6'd47;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,978,cycle)
    `expect("io_rd_imag",io_rd_imag,2644,cycle)
    `expect("io_rd_real",io_rd_real,978,cycle)
    `expect("io_rd_imag",io_rd_imag,2644,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd8;
    io_rs1_imag = 5'd24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-633,cycle)
    `expect("io_rd_imag",io_rd_imag,366,cycle)
    `expect("io_rd_real",io_rd_real,-633,cycle)
    `expect("io_rd_imag",io_rd_imag,366,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -44;
    io_rs1_imag = -31;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3058,cycle)
    `expect("io_rd_imag",io_rd_imag,-2408,cycle)
    `expect("io_rd_real",io_rd_real,-3058,cycle)
    `expect("io_rd_imag",io_rd_imag,-2408,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd27;
    io_rs1_imag = -19;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1226,cycle)
    `expect("io_rd_imag",io_rd_imag,-1965,cycle)
    `expect("io_rd_real",io_rd_real,1226,cycle)
    `expect("io_rd_imag",io_rd_imag,-1965,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd22;
    io_rs1_imag = 3'd7;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2884,cycle)
    `expect("io_rd_imag",io_rd_imag,449,cycle)
    `expect("io_rd_real",io_rd_real,2884,cycle)
    `expect("io_rd_imag",io_rd_imag,449,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd8;
    io_rs1_imag = -47;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,584,cycle)
    `expect("io_rd_imag",io_rd_imag,643,cycle)
    `expect("io_rd_real",io_rd_real,584,cycle)
    `expect("io_rd_imag",io_rd_imag,643,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd24;
    io_rs1_imag = 6'd49;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1385,cycle)
    `expect("io_rd_imag",io_rd_imag,2571,cycle)
    `expect("io_rd_real",io_rd_real,1385,cycle)
    `expect("io_rd_imag",io_rd_imag,2571,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 2'd2;
    io_rs1_imag = 6'd40;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-706,cycle)
    `expect("io_rd_imag",io_rd_imag,2954,cycle)
    `expect("io_rd_real",io_rd_real,-706,cycle)
    `expect("io_rd_imag",io_rd_imag,2954,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule