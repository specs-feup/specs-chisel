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
    io_rs1_real = 35'd18467439133;
    io_rs1_imag = -9303473443;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 37'd69693478768;
    io_rs1_imag = -114629703252;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -191083628821;
    io_rs1_imag = 37'd121811370080;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 37'd74541051975;
    io_rs1_imag = -26460082802;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 37'd86606597970;
    io_rs1_imag = 38'd140317386008;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 38'd214482138589;
    io_rs1_imag = -36323334022;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,843546042701,cycle)
    `expect("io_rd_imag",io_rd_imag,-620779544237,cycle)
    `expect("io_rd_real",io_rd_real,843546042701,cycle)
    `expect("io_rd_imag",io_rd_imag,-620779544237,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -126822616502;
    io_rs1_imag = -169139455967;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,1599220555301,cycle)
    `expect("io_rd_imag",io_rd_imag,-6766339105372,cycle)
    `expect("io_rd_real",io_rd_real,1599220555301,cycle)
    `expect("io_rd_imag",io_rd_imag,-6766339105372,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -194053540552;
    io_rs1_imag = 37'd96249598757;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-15710192177147,cycle)
    `expect("io_rd_imag",io_rd_imag,9173465663260,cycle)
    `expect("io_rd_real",io_rd_real,-15710192177147,cycle)
    `expect("io_rd_imag",io_rd_imag,9173465663260,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 38'd163099643990;
    io_rs1_imag = 38'd197977111117;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,14488153307938,cycle)
    `expect("io_rd_imag",io_rd_imag,9215333464700,cycle)
    `expect("io_rd_real",io_rd_real,14488153307938,cycle)
    `expect("io_rd_imag",io_rd_imag,9215333464700,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 37'd123246880650;
    io_rs1_imag = -116399505472;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,16380511509172,cycle)
    `expect("io_rd_imag",io_rd_imag,-7573186585156,cycle)
    `expect("io_rd_real",io_rd_real,16380511509172,cycle)
    `expect("io_rd_imag",io_rd_imag,-7573186585156,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -109910606003;
    io_rs1_imag = -60655462092;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-14388374408990,cycle)
    `expect("io_rd_imag",io_rd_imag,-14071172567629,cycle)
    `expect("io_rd_real",io_rd_real,-14388374408990,cycle)
    `expect("io_rd_imag",io_rd_imag,-14071172567629,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 38'd182318904994;
    io_rs1_imag = -39822720173;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-7893860731849,cycle)
    `expect("io_rd_imag",io_rd_imag,8089369004824,cycle)
    `expect("io_rd_real",io_rd_real,-7893860731849,cycle)
    `expect("io_rd_imag",io_rd_imag,8089369004824,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -199437053780;
    io_rs1_imag = -52471161692;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,5777423495094,cycle)
    `expect("io_rd_imag",io_rd_imag,816766007059,cycle)
    `expect("io_rd_real",io_rd_real,5777423495094,cycle)
    `expect("io_rd_imag",io_rd_imag,816766007059,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -40586791076;
    io_rs1_imag = -184778795758;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-8186573559551,cycle)
    `expect("io_rd_imag",io_rd_imag,12011113970662,cycle)
    `expect("io_rd_real",io_rd_real,-8186573559551,cycle)
    `expect("io_rd_imag",io_rd_imag,12011113970662,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -164007470584;
    io_rs1_imag = 38'd140279671599;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,7053795225450,cycle)
    `expect("io_rd_imag",io_rd_imag,-10906819609193,cycle)
    `expect("io_rd_real",io_rd_real,7053795225450,cycle)
    `expect("io_rd_imag",io_rd_imag,-10906819609193,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -201590130764;
    io_rs1_imag = 37'd94691642707;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,8660113508153,cycle)
    `expect("io_rd_imag",io_rd_imag,20038486455400,cycle)
    `expect("io_rd_real",io_rd_real,8660113508153,cycle)
    `expect("io_rd_imag",io_rd_imag,20038486455400,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -122093746656;
    io_rs1_imag = 38'd154299423204;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1766576904003,cycle)
    `expect("io_rd_imag",io_rd_imag,-13578360954054,cycle)
    `expect("io_rd_real",io_rd_real,-1766576904003,cycle)
    `expect("io_rd_imag",io_rd_imag,-13578360954054,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 37'd80118017316;
    io_rs1_imag = 33'd8361355402;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,12018879513968,cycle)
    `expect("io_rd_imag",io_rd_imag,-5912401712534,cycle)
    `expect("io_rd_real",io_rd_real,12018879513968,cycle)
    `expect("io_rd_imag",io_rd_imag,-5912401712534,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 35'd17809925811;
    io_rs1_imag = 37'd111844317102;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-7907556882041,cycle)
    `expect("io_rd_imag",io_rd_imag,-11531947448689,cycle)
    `expect("io_rd_real",io_rd_real,-7907556882041,cycle)
    `expect("io_rd_imag",io_rd_imag,-11531947448689,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -2113937548;
    io_rs1_imag = 38'd197360388860;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-8436123594305,cycle)
    `expect("io_rd_imag",io_rd_imag,2846545794136,cycle)
    `expect("io_rd_real",io_rd_real,-8436123594305,cycle)
    `expect("io_rd_imag",io_rd_imag,2846545794136,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -144928987355;
    io_rs1_imag = -86950535214;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-5603805455429,cycle)
    `expect("io_rd_imag",io_rd_imag,-2497741381815,cycle)
    `expect("io_rd_real",io_rd_real,-5603805455429,cycle)
    `expect("io_rd_imag",io_rd_imag,-2497741381815,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -140664165919;
    io_rs1_imag = 38'd179587835492;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-8051039242613,cycle)
    `expect("io_rd_imag",io_rd_imag,-689068432273,cycle)
    `expect("io_rd_real",io_rd_real,-8051039242613,cycle)
    `expect("io_rd_imag",io_rd_imag,-689068432273,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -51574164988;
    io_rs1_imag = -142379052988;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,8778678103892,cycle)
    `expect("io_rd_imag",io_rd_imag,12201383772081,cycle)
    `expect("io_rd_real",io_rd_real,8778678103892,cycle)
    `expect("io_rd_imag",io_rd_imag,12201383772081,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -203237913779;
    io_rs1_imag = 37'd88218662577;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-13696278620516,cycle)
    `expect("io_rd_imag",io_rd_imag,-8799187077583,cycle)
    `expect("io_rd_real",io_rd_real,-13696278620516,cycle)
    `expect("io_rd_imag",io_rd_imag,-8799187077583,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -4156838098;
    io_rs1_imag = -168400485712;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,3589906674512,cycle)
    `expect("io_rd_imag",io_rd_imag,8507679661130,cycle)
    `expect("io_rd_real",io_rd_real,3589906674512,cycle)
    `expect("io_rd_imag",io_rd_imag,8507679661130,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule