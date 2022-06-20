// SPDX-License-Identifier: Apache-2.0
// Example VCS Command: $VCS_HOME/bin/vcs -debug_pp -full64 +define+UNIT_DELAY +rad +v2k +vcs+lic+wait +vc+list +vcs+initreg+random +vcs+dumpvars+out.vcd tb.v SCIEUnpipelined.v ...
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
  reg signed [31:0] io_rs1 = 0;
  reg[31:0] io_insn = 0;
  wire signed [31:0] io_rd;

  always #`HALF_CLK_PERIOD clock = ~clock;

  initial begin
    #`RESET_TIME
    forever #`CLK_PERIOD cycle = cycle + 1;
  end

  SCIEUnpipelined SCIEUnpipelined(
    .clock(clock),
    .reset(reset),
    .io_rs2(io_rs2),
    .io_rs1(io_rs1),
    .io_insn(io_insn),
    .io_rd(io_rd));

  initial begin
    #`INIT_TIME reset = 0;
    io_insn = 7'd123;
    io_rs1 = 14'd8192;
    `expect("io_rd",io_rd,8192,cycle)
    io_insn = 7'd123;
    io_rs1 = 12'd3328;
    `expect("io_rd",io_rd,3328,cycle)
    io_insn = 7'd123;
    io_rs1 = 11'd1792;
    `expect("io_rd",io_rd,1792,cycle)
    io_insn = 7'd123;
    io_rs1 = -7936;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd6144;
    `expect("io_rd",io_rd,6144,cycle)
    io_insn = 7'd123;
    io_rs1 = 12'd3328;
    `expect("io_rd",io_rd,3328,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd10752;
    `expect("io_rd",io_rd,10752,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd12800;
    `expect("io_rd",io_rd,12800,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd10240;
    `expect("io_rd",io_rd,10240,cycle)
    io_insn = 7'd123;
    io_rs1 = -1024;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -7936;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -8960;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd4608;
    `expect("io_rd",io_rd,4608,cycle)
    io_insn = 7'd123;
    io_rs1 = 12'd2816;
    `expect("io_rd",io_rd,2816,cycle)
    io_insn = 7'd123;
    io_rs1 = 11'd1792;
    `expect("io_rd",io_rd,1792,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd4864;
    `expect("io_rd",io_rd,4864,cycle)
    io_insn = 7'd123;
    io_rs1 = 11'd1280;
    `expect("io_rd",io_rd,1280,cycle)
    io_insn = 7'd123;
    io_rs1 = -256;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd5120;
    `expect("io_rd",io_rd,5120,cycle)
    io_insn = 7'd123;
    io_rs1 = 12'd2048;
    `expect("io_rd",io_rd,2048,cycle)
    io_insn = 7'd123;
    io_rs1 = 10'd512;
    `expect("io_rd",io_rd,512,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd5376;
    `expect("io_rd",io_rd,5376,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd10496;
    `expect("io_rd",io_rd,10496,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd8704;
    `expect("io_rd",io_rd,8704,cycle)
    io_insn = 7'd123;
    io_rs1 = -2304;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -9728;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -768;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 12'd2304;
    `expect("io_rd",io_rd,2304,cycle)
    io_insn = 7'd123;
    io_rs1 = -11520;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -10496;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -2816;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 1'd0;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd7424;
    `expect("io_rd",io_rd,7424,cycle)
    io_insn = 7'd123;
    io_rs1 = 11'd1536;
    `expect("io_rd",io_rd,1536,cycle)
    io_insn = 7'd123;
    io_rs1 = 12'd2560;
    `expect("io_rd",io_rd,2560,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd7936;
    `expect("io_rd",io_rd,7936,cycle)
    io_insn = 7'd123;
    io_rs1 = -9472;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -8192;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -3072;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd12800;
    `expect("io_rd",io_rd,12800,cycle)
    io_insn = 7'd123;
    io_rs1 = 12'd2560;
    `expect("io_rd",io_rd,2560,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd4608;
    `expect("io_rd",io_rd,4608,cycle)
    io_insn = 7'd123;
    io_rs1 = -1280;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -1792;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -2048;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -2304;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -11776;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd12544;
    `expect("io_rd",io_rd,12544,cycle)
    io_insn = 7'd123;
    io_rs1 = 10'd768;
    `expect("io_rd",io_rd,768,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd10240;
    `expect("io_rd",io_rd,10240,cycle)
    io_insn = 7'd123;
    io_rs1 = -8448;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd6656;
    `expect("io_rd",io_rd,6656,cycle)
    io_insn = 7'd123;
    io_rs1 = -1792;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd12544;
    `expect("io_rd",io_rd,12544,cycle)
    io_insn = 7'd123;
    io_rs1 = -11008;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -4352;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -11776;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd9216;
    `expect("io_rd",io_rd,9216,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd7936;
    `expect("io_rd",io_rd,7936,cycle)
    io_insn = 7'd123;
    io_rs1 = -2048;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -9984;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 12'd3840;
    `expect("io_rd",io_rd,3840,cycle)
    io_insn = 7'd123;
    io_rs1 = 10'd512;
    `expect("io_rd",io_rd,512,cycle)
    io_insn = 7'd123;
    io_rs1 = -8448;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd7168;
    `expect("io_rd",io_rd,7168,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd7424;
    `expect("io_rd",io_rd,7424,cycle)
    io_insn = 7'd123;
    io_rs1 = -4608;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -8448;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -9472;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -8960;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -2304;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -6912;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 11'd1792;
    `expect("io_rd",io_rd,1792,cycle)
    io_insn = 7'd123;
    io_rs1 = -3072;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 10'd512;
    `expect("io_rd",io_rd,512,cycle)
    io_insn = 7'd123;
    io_rs1 = 1'd0;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -7168;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd6912;
    `expect("io_rd",io_rd,6912,cycle)
    io_insn = 7'd123;
    io_rs1 = -4352;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -8192;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd11264;
    `expect("io_rd",io_rd,11264,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd11776;
    `expect("io_rd",io_rd,11776,cycle)
    io_insn = 7'd123;
    io_rs1 = -5888;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 12'd2048;
    `expect("io_rd",io_rd,2048,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd6144;
    `expect("io_rd",io_rd,6144,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd8192;
    `expect("io_rd",io_rd,8192,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd11520;
    `expect("io_rd",io_rd,11520,cycle)
    io_insn = 7'd123;
    io_rs1 = -12032;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd7680;
    `expect("io_rd",io_rd,7680,cycle)
    io_insn = 7'd123;
    io_rs1 = -5376;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -10240;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -11520;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -9984;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -8448;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = -12288;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd7168;
    `expect("io_rd",io_rd,7168,cycle)
    io_insn = 7'd123;
    io_rs1 = -6144;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 13'd6912;
    `expect("io_rd",io_rd,6912,cycle)
    io_insn = 7'd123;
    io_rs1 = -4352;
    `expect("io_rd",io_rd,0,cycle)
    io_insn = 7'd123;
    io_rs1 = 14'd8960;
    `expect("io_rd",io_rd,8960,cycle)

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule