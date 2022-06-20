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
    io_rs1_real = -46;
    io_rs1_imag = 3'd5;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 4'd14;
    io_rs1_imag = 5'd17;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -38;
    io_rs1_imag = 5'd25;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -2;
    io_rs1_imag = -27;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 6'd44;
    io_rs1_imag = 1'd1;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd12;
    io_rs1_imag = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-552,cycle)
    `expect("io_rd_imag",io_rd_imag,60,cycle)
    `expect("io_rd_real",io_rd_real,-552,cycle)
    `expect("io_rd_imag",io_rd_imag,60,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd11;
    io_rs1_imag = 5'd28;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-478,cycle)
    `expect("io_rd_imag",io_rd_imag,-1029,cycle)
    `expect("io_rd_real",io_rd_real,-478,cycle)
    `expect("io_rd_imag",io_rd_imag,-1029,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd17;
    io_rs1_imag = 5'd24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1680,cycle)
    `expect("io_rd_imag",io_rd_imag,-140,cycle)
    `expect("io_rd_real",io_rd_real,-1680,cycle)
    `expect("io_rd_imag",io_rd_imag,-140,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -40;
    io_rs1_imag = -18;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,618,cycle)
    `expect("io_rd_imag",io_rd_imag,140,cycle)
    `expect("io_rd_real",io_rd_real,618,cycle)
    `expect("io_rd_imag",io_rd_imag,140,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd35;
    io_rs1_imag = 4'd15;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1923,cycle)
    `expect("io_rd_imag",io_rd_imag,-2275,cycle)
    `expect("io_rd_real",io_rd_real,-1923,cycle)
    `expect("io_rd_imag",io_rd_imag,-2275,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -14;
    io_rs1_imag = 5'd23;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3804,cycle)
    `expect("io_rd_imag",io_rd_imag,97,cycle)
    `expect("io_rd_real",io_rd_real,3804,cycle)
    `expect("io_rd_imag",io_rd_imag,97,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd23;
    io_rs1_imag = 5'd24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3152,cycle)
    `expect("io_rd_imag",io_rd_imag,1589,cycle)
    `expect("io_rd_real",io_rd_real,-3152,cycle)
    `expect("io_rd_imag",io_rd_imag,1589,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -34;
    io_rs1_imag = -45;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,253,cycle)
    `expect("io_rd_imag",io_rd_imag,-404,cycle)
    `expect("io_rd_real",io_rd_real,253,cycle)
    `expect("io_rd_imag",io_rd_imag,-404,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd7;
    io_rs1_imag = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,657,cycle)
    `expect("io_rd_imag",io_rd_imag,-575,cycle)
    `expect("io_rd_real",io_rd_real,657,cycle)
    `expect("io_rd_imag",io_rd_imag,-575,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -23;
    io_rs1_imag = 6'd34;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3332,cycle)
    `expect("io_rd_imag",io_rd_imag,-343,cycle)
    `expect("io_rd_real",io_rd_real,3332,cycle)
    `expect("io_rd_imag",io_rd_imag,-343,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -33;
    io_rs1_imag = 6'd49;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-102,cycle)
    `expect("io_rd_imag",io_rd_imag,-148,cycle)
    `expect("io_rd_real",io_rd_real,-102,cycle)
    `expect("io_rd_imag",io_rd_imag,-148,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -15;
    io_rs1_imag = 6'd40;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2192,cycle)
    `expect("io_rd_imag",io_rd_imag,-5864,cycle)
    `expect("io_rd_real",io_rd_real,-2192,cycle)
    `expect("io_rd_imag",io_rd_imag,-5864,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -49;
    io_rs1_imag = 6'd45;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2438,cycle)
    `expect("io_rd_imag",io_rd_imag,-4049,cycle)
    `expect("io_rd_real",io_rd_real,2438,cycle)
    `expect("io_rd_imag",io_rd_imag,-4049,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -49;
    io_rs1_imag = 5'd21;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,611,cycle)
    `expect("io_rd_imag",io_rd_imag,-1043,cycle)
    `expect("io_rd_real",io_rd_real,611,cycle)
    `expect("io_rd_imag",io_rd_imag,-1043,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd12;
    io_rs1_imag = -25;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1124,cycle)
    `expect("io_rd_imag",io_rd_imag,184,cycle)
    `expect("io_rd_real",io_rd_real,-1124,cycle)
    `expect("io_rd_imag",io_rd_imag,184,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 5'd20;
    io_rs1_imag = -49;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1868,cycle)
    `expect("io_rd_imag",io_rd_imag,3163,cycle)
    `expect("io_rd_real",io_rd_real,1868,cycle)
    `expect("io_rd_imag",io_rd_imag,3163,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd9;
    io_rs1_imag = 5'd27;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-803,cycle)
    `expect("io_rd_imag",io_rd_imag,2919,cycle)
    `expect("io_rd_real",io_rd_real,-803,cycle)
    `expect("io_rd_imag",io_rd_imag,2919,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd33;
    io_rs1_imag = -12;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4202,cycle)
    `expect("io_rd_imag",io_rd_imag,4211,cycle)
    `expect("io_rd_real",io_rd_real,-4202,cycle)
    `expect("io_rd_imag",io_rd_imag,4211,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 6'd45;
    io_rs1_imag = -8;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3191,cycle)
    `expect("io_rd_imag",io_rd_imag,-1345,cycle)
    `expect("io_rd_real",io_rd_real,-3191,cycle)
    `expect("io_rd_imag",io_rd_imag,-1345,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd6;
    io_rs1_imag = 6'd32;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1016,cycle)
    `expect("io_rd_imag",io_rd_imag,-1941,cycle)
    `expect("io_rd_real",io_rd_real,1016,cycle)
    `expect("io_rd_imag",io_rd_imag,-1941,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule