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
    io_rs1_real = 38'd203841466979;
    io_rs1_imag = 35'd20913234674;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -100788414711;
    io_rs1_imag = 36'd56876281971;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = 36'd40916663891;
    io_rs1_imag = 38'd144455627928;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -179196331571;
    io_rs1_imag = 38'd154665368591;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_real = -42177684242;
    io_rs1_imag = 37'd83188099625;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 33'd8438427473;
    io_rs1_imag = -55890852234;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,672638403249,cycle)
    `expect("io_rd_imag",io_rd_imag,-2611521281317,cycle)
    `expect("io_rd_real",io_rd_real,672638403249,cycle)
    `expect("io_rd_imag",io_rd_imag,-2611521281317,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -69449946176;
    io_rs1_imag = -43033872616;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2544474156941,cycle)
    `expect("io_rd_imag",io_rd_imag,-957263161534,cycle)
    `expect("io_rd_real",io_rd_real,-2544474156941,cycle)
    `expect("io_rd_imag",io_rd_imag,-957263161534,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -189992906886;
    io_rs1_imag = 37'd107084837196;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-5378747843189,cycle)
    `expect("io_rd_imag",io_rd_imag,3998711765580,cycle)
    `expect("io_rd_real",io_rd_real,-5378747843189,cycle)
    `expect("io_rd_imag",io_rd_imag,3998711765580,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -198203200342;
    io_rs1_imag = 37'd116596628880;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-4487782317023,cycle)
    `expect("io_rd_imag",io_rd_imag,-570321733440,cycle)
    `expect("io_rd_real",io_rd_real,-4487782317023,cycle)
    `expect("io_rd_imag",io_rd_imag,-570321733440,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 36'd59042606610;
    io_rs1_imag = 38'd210762905947;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,4918380533469,cycle)
    `expect("io_rd_imag",io_rd_imag,-433604001207,cycle)
    `expect("io_rd_real",io_rd_real,4918380533469,cycle)
    `expect("io_rd_imag",io_rd_imag,-433604001207,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -176000535397;
    io_rs1_imag = -173146180105;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-11910073151582,cycle)
    `expect("io_rd_imag",io_rd_imag,-31026346303178,cycle)
    `expect("io_rd_real",io_rd_real,-11910073151582,cycle)
    `expect("io_rd_imag",io_rd_imag,-31026346303178,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 37'd125903955639;
    io_rs1_imag = 37'd91808190170;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,9287662763310,cycle)
    `expect("io_rd_imag",io_rd_imag,-6037205146404,cycle)
    `expect("io_rd_real",io_rd_real,9287662763310,cycle)
    `expect("io_rd_imag",io_rd_imag,-6037205146404,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 38'd151449596138;
    io_rs1_imag = -139035890044;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-2523657438419,cycle)
    `expect("io_rd_imag",io_rd_imag,-25568781479724,cycle)
    `expect("io_rd_real",io_rd_real,-2523657438419,cycle)
    `expect("io_rd_imag",io_rd_imag,-25568781479724,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -127168699125;
    io_rs1_imag = 36'd41480599797;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-922425141310,cycle)
    `expect("io_rd_imag",io_rd_imag,11686980198248,cycle)
    `expect("io_rd_real",io_rd_real,-922425141310,cycle)
    `expect("io_rd_imag",io_rd_imag,11686980198248,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 38'd185740419694;
    io_rs1_imag = -85786595083;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,14309956523557,cycle)
    `expect("io_rd_imag",io_rd_imag,-3060365957388,cycle)
    `expect("io_rd_real",io_rd_real,14309956523557,cycle)
    `expect("io_rd_imag",io_rd_imag,-3060365957388,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -116474472966;
    io_rs1_imag = -68838254615;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-15348718215247,cycle)
    `expect("io_rd_imag",io_rd_imag,9548330470088,cycle)
    `expect("io_rd_real",io_rd_real,-15348718215247,cycle)
    `expect("io_rd_imag",io_rd_imag,9548330470088,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -184964009523;
    io_rs1_imag = -97269634678;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,5012507143090,cycle)
    `expect("io_rd_imag",io_rd_imag,-2025607640941,cycle)
    `expect("io_rd_real",io_rd_real,5012507143090,cycle)
    `expect("io_rd_imag",io_rd_imag,-2025607640941,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 37'd91154517580;
    io_rs1_imag = 38'd201593080161;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,5964003637486,cycle)
    `expect("io_rd_imag",io_rd_imag,12668944623094,cycle)
    `expect("io_rd_real",io_rd_real,5964003637486,cycle)
    `expect("io_rd_imag",io_rd_imag,12668944623094,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -114582266755;
    io_rs1_imag = 34'd12005465458;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-1619761660916,cycle)
    `expect("io_rd_imag",io_rd_imag,-7541655630302,cycle)
    `expect("io_rd_real",io_rd_real,-1619761660916,cycle)
    `expect("io_rd_imag",io_rd_imag,-7541655630302,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 38'd205698206380;
    io_rs1_imag = 38'd182058166033;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,19191038924550,cycle)
    `expect("io_rd_imag",io_rd_imag,8647114932853,cycle)
    `expect("io_rd_real",io_rd_real,19191038924550,cycle)
    `expect("io_rd_imag",io_rd_imag,8647114932853,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -131226653934;
    io_rs1_imag = 38'd196918337297;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-23282597647882,cycle)
    `expect("io_rd_imag",io_rd_imag,-4336604708538,cycle)
    `expect("io_rd_real",io_rd_real,-23282597647882,cycle)
    `expect("io_rd_imag",io_rd_imag,-4336604708538,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = -11645702548;
    io_rs1_imag = -145339786890;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-3988386683852,cycle)
    `expect("io_rd_imag",io_rd_imag,-9501846884868,cycle)
    `expect("io_rd_real",io_rd_real,-3988386683852,cycle)
    `expect("io_rd_imag",io_rd_imag,-9501846884868,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 37'd82320273737;
    io_rs1_imag = -58838057461;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,-15727420205396,cycle)
    `expect("io_rd_imag",io_rd_imag,-4198646148491,cycle)
    `expect("io_rd_real",io_rd_real,-15727420205396,cycle)
    `expect("io_rd_imag",io_rd_imag,-4198646148491,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 38'd187708960832;
    io_rs1_imag = -9460062539;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,5417237595200,cycle)
    `expect("io_rd_imag",io_rd_imag,-9585638470611,cycle)
    `expect("io_rd_real",io_rd_real,5417237595200,cycle)
    `expect("io_rd_imag",io_rd_imag,-9585638470611,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_real = 36'd39659023637;
    io_rs1_imag = -98578135506;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_real",io_rd_real,4040109538582,cycle)
    `expect("io_rd_imag",io_rd_imag,1599551963288,cycle)
    `expect("io_rd_real",io_rd_real,4040109538582,cycle)
    `expect("io_rd_imag",io_rd_imag,1599551963288,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule