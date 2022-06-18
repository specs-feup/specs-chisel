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
    io_rs1_real = 5'd19;
    io_rs1_imag = 5'd28;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 6'd47;
    io_rs1_imag = -28;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -34;
    io_rs1_imag = 6'd45;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 6'd38;
    io_rs1_imag = -13;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 4'd10;
    io_rs1_imag = 6'd34;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -49;
    io_rs1_imag = -33;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-7,cycle)
    `expect("io_rd_imag",io_rd_imag,-1999,cycle)
    `expect("io_rd_real",io_rd_real,-7,cycle)
    `expect("io_rd_imag",io_rd_imag,-1999,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -5;
    io_rs1_imag = -1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3294,cycle)
    `expect("io_rd_imag",io_rd_imag,-338,cycle)
    `expect("io_rd_real",io_rd_real,-3294,cycle)
    `expect("io_rd_imag",io_rd_imag,-338,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -31;
    io_rs1_imag = -43;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3503,cycle)
    `expect("io_rd_imag",io_rd_imag,-2675,cycle)
    `expect("io_rd_real",io_rd_real,3503,cycle)
    `expect("io_rd_imag",io_rd_imag,-2675,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -45;
    io_rs1_imag = -12;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-5256,cycle)
    `expect("io_rd_imag",io_rd_imag,-3449,cycle)
    `expect("io_rd_real",io_rd_real,-5256,cycle)
    `expect("io_rd_imag",io_rd_imag,-3449,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -43;
    io_rs1_imag = -2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,206,cycle)
    `expect("io_rd_imag",io_rd_imag,-2448,cycle)
    `expect("io_rd_real",io_rd_real,206,cycle)
    `expect("io_rd_imag",io_rd_imag,-2448,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -40;
    io_rs1_imag = 6'd40;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3640,cycle)
    `expect("io_rd_imag",io_rd_imag,-2278,cycle)
    `expect("io_rd_real",io_rd_real,-3640,cycle)
    `expect("io_rd_imag",io_rd_imag,-2278,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -39;
    io_rs1_imag = -24;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,9,cycle)
    `expect("io_rd_imag",io_rd_imag,-1770,cycle)
    `expect("io_rd_real",io_rd_real,9,cycle)
    `expect("io_rd_imag",io_rd_imag,-1770,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd14;
    io_rs1_imag = 6'd48;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-5725,cycle)
    `expect("io_rd_imag",io_rd_imag,-3059,cycle)
    `expect("io_rd_real",io_rd_real,-5725,cycle)
    `expect("io_rd_imag",io_rd_imag,-3059,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -6;
    io_rs1_imag = -14;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3324,cycle)
    `expect("io_rd_imag",io_rd_imag,1049,cycle)
    `expect("io_rd_real",io_rd_real,3324,cycle)
    `expect("io_rd_imag",io_rd_imag,1049,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd7;
    io_rs1_imag = -2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-6675,cycle)
    `expect("io_rd_imag",io_rd_imag,-2699,cycle)
    `expect("io_rd_real",io_rd_real,-6675,cycle)
    `expect("io_rd_imag",io_rd_imag,-2699,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -38;
    io_rs1_imag = -12;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,2303,cycle)
    `expect("io_rd_imag",io_rd_imag,-1300,cycle)
    `expect("io_rd_real",io_rd_real,2303,cycle)
    `expect("io_rd_imag",io_rd_imag,-1300,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -2;
    io_rs1_imag = -29;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3398,cycle)
    `expect("io_rd_imag",io_rd_imag,778,cycle)
    `expect("io_rd_real",io_rd_real,-3398,cycle)
    `expect("io_rd_imag",io_rd_imag,778,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -25;
    io_rs1_imag = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1051,cycle)
    `expect("io_rd_imag",io_rd_imag,-3782,cycle)
    `expect("io_rd_real",io_rd_real,1051,cycle)
    `expect("io_rd_imag",io_rd_imag,-3782,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 3'd7;
    io_rs1_imag = 5'd26;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1803,cycle)
    `expect("io_rd_imag",io_rd_imag,2636,cycle)
    `expect("io_rd_real",io_rd_real,-1803,cycle)
    `expect("io_rd_imag",io_rd_imag,2636,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd14;
    io_rs1_imag = 5'd17;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1182,cycle)
    `expect("io_rd_imag",io_rd_imag,-1940,cycle)
    `expect("io_rd_real",io_rd_real,1182,cycle)
    `expect("io_rd_imag",io_rd_imag,-1940,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -40;
    io_rs1_imag = -37;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,44,cycle)
    `expect("io_rd_imag",io_rd_imag,-1942,cycle)
    `expect("io_rd_real",io_rd_real,44,cycle)
    `expect("io_rd_imag",io_rd_imag,-1942,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 1'd1;
    io_rs1_imag = -4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3740,cycle)
    `expect("io_rd_imag",io_rd_imag,-548,cycle)
    `expect("io_rd_real",io_rd_real,-3740,cycle)
    `expect("io_rd_imag",io_rd_imag,-548,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 4'd15;
    io_rs1_imag = -27;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3940,cycle)
    `expect("io_rd_imag",io_rd_imag,111,cycle)
    `expect("io_rd_real",io_rd_real,3940,cycle)
    `expect("io_rd_imag",io_rd_imag,111,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -32;
    io_rs1_imag = -40;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1832,cycle)
    `expect("io_rd_imag",io_rd_imag,-3404,cycle)
    `expect("io_rd_real",io_rd_real,-1832,cycle)
    `expect("io_rd_imag",io_rd_imag,-3404,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 2'd2;
    io_rs1_imag = 6'd48;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2381,cycle)
    `expect("io_rd_imag",io_rd_imag,-318,cycle)
    `expect("io_rd_real",io_rd_real,-2381,cycle)
    `expect("io_rd_imag",io_rd_imag,-318,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule