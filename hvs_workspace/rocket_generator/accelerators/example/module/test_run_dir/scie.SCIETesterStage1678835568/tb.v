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
    io_rs1_real = 14'd9007;
    io_rs1_imag = -728;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -10319;
    io_rs1_imag = 11'd1238;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -7128;
    io_rs1_imag = 14'd12307;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 9'd290;
    io_rs1_imag = -6319;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -5975;
    io_rs1_imag = 14'd12258;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 14'd9431;
    io_rs1_imag = -4819;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,318112,cycle)
    `expect("io_rd_imag",io_rd_imag,-196370,cycle)
    `expect("io_rd_real",io_rd_real,318112,cycle)
    `expect("io_rd_imag",io_rd_imag,-196370,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 12'd2883;
    io_rs1_imag = 13'd5233;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-240531,cycle)
    `expect("io_rd_imag",io_rd_imag,415772,cycle)
    `expect("io_rd_real",io_rd_real,-240531,cycle)
    `expect("io_rd_imag",io_rd_imag,415772,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 14'd9997;
    io_rs1_imag = 13'd7202;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,199770,cycle)
    `expect("io_rd_imag",io_rd_imag,615537,cycle)
    `expect("io_rd_real",io_rd_real,199770,cycle)
    `expect("io_rd_imag",io_rd_imag,615537,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -9051;
    io_rs1_imag = -11443;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1228894,cycle)
    `expect("io_rd_imag",io_rd_imag,-864184,cycle)
    `expect("io_rd_real",io_rd_real,-1228894,cycle)
    `expect("io_rd_imag",io_rd_imag,-864184,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -9782;
    io_rs1_imag = 14'd9837;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-377542,cycle)
    `expect("io_rd_imag",io_rd_imag,1570289,cycle)
    `expect("io_rd_real",io_rd_real,-377542,cycle)
    `expect("io_rd_imag",io_rd_imag,1570289,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 14'd10399;
    io_rs1_imag = 14'd10377;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1415474,cycle)
    `expect("io_rd_imag",io_rd_imag,-447492,cycle)
    `expect("io_rd_real",io_rd_real,1415474,cycle)
    `expect("io_rd_imag",io_rd_imag,-447492,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 14'd11742;
    io_rs1_imag = 12'd4079;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1116053,cycle)
    `expect("io_rd_imag",io_rd_imag,-480993,cycle)
    `expect("io_rd_real",io_rd_real,-1116053,cycle)
    `expect("io_rd_imag",io_rd_imag,-480993,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 12'd2393;
    io_rs1_imag = -10329;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-235719,cycle)
    `expect("io_rd_imag",io_rd_imag,-180574,cycle)
    `expect("io_rd_real",io_rd_real,-235719,cycle)
    `expect("io_rd_imag",io_rd_imag,-180574,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -11065;
    io_rs1_imag = 14'd8563;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-909291,cycle)
    `expect("io_rd_imag",io_rd_imag,268662,cycle)
    `expect("io_rd_real",io_rd_real,-909291,cycle)
    `expect("io_rd_imag",io_rd_imag,268662,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 13'd4822;
    io_rs1_imag = -4890;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,364677,cycle)
    `expect("io_rd_imag",io_rd_imag,-211271,cycle)
    `expect("io_rd_real",io_rd_real,364677,cycle)
    `expect("io_rd_imag",io_rd_imag,-211271,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -8341;
    io_rs1_imag = 14'd9222;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1263147,cycle)
    `expect("io_rd_imag",io_rd_imag,194511,cycle)
    `expect("io_rd_real",io_rd_real,-1263147,cycle)
    `expect("io_rd_imag",io_rd_imag,194511,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -139;
    io_rs1_imag = 14'd9482;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1052071,cycle)
    `expect("io_rd_imag",io_rd_imag,928398,cycle)
    `expect("io_rd_real",io_rd_real,1052071,cycle)
    `expect("io_rd_imag",io_rd_imag,928398,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -10614;
    io_rs1_imag = 12'd3386;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-882163,cycle)
    `expect("io_rd_imag",io_rd_imag,-1745572,cycle)
    `expect("io_rd_real",io_rd_real,-882163,cycle)
    `expect("io_rd_imag",io_rd_imag,-1745572,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 11'd1713;
    io_rs1_imag = -8622;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,335027,cycle)
    `expect("io_rd_imag",io_rd_imag,-205380,cycle)
    `expect("io_rd_real",io_rd_real,335027,cycle)
    `expect("io_rd_imag",io_rd_imag,-205380,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -252;
    io_rs1_imag = 11'd1229;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,87024,cycle)
    `expect("io_rd_imag",io_rd_imag,-805216,cycle)
    `expect("io_rd_real",io_rd_real,87024,cycle)
    `expect("io_rd_imag",io_rd_imag,-805216,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 14'd9734;
    io_rs1_imag = -9917;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,306063,cycle)
    `expect("io_rd_imag",io_rd_imag,-67072,cycle)
    `expect("io_rd_real",io_rd_real,306063,cycle)
    `expect("io_rd_imag",io_rd_imag,-67072,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -3755;
    io_rs1_imag = -7870;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-676251,cycle)
    `expect("io_rd_imag",io_rd_imag,-505045,cycle)
    `expect("io_rd_real",io_rd_real,-676251,cycle)
    `expect("io_rd_imag",io_rd_imag,-505045,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 13'd7388;
    io_rs1_imag = -12571;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1022241,cycle)
    `expect("io_rd_imag",io_rd_imag,870719,cycle)
    `expect("io_rd_real",io_rd_real,1022241,cycle)
    `expect("io_rd_imag",io_rd_imag,870719,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -8951;
    io_rs1_imag = -9493;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-382761,cycle)
    `expect("io_rd_imag",io_rd_imag,-19740,cycle)
    `expect("io_rd_real",io_rd_real,-382761,cycle)
    `expect("io_rd_imag",io_rd_imag,-19740,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -5314;
    io_rs1_imag = 13'd6210;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,685185,cycle)
    `expect("io_rd_imag",io_rd_imag,2059485,cycle)
    `expect("io_rd_real",io_rd_real,685185,cycle)
    `expect("io_rd_imag",io_rd_imag,2059485,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule