// SPDX-License-Identifier: Apache-2.0
// Example VCS Command: $VCS_HOME/bin/vcs -debug_pp -full64 +define+UNIT_DELAY +rad +v2k +vcs+lic+wait +vc+list +vcs+initreg+random +vcs+dumpvars+out.vcd tb.v SimpleDspModule.v ...
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
  reg signed [15:0] io_y = 0;
  reg signed [15:0] io_x = 0;
  wire signed [15:0] io_z;

  always #`HALF_CLK_PERIOD clock = ~clock;

  initial begin
    #`RESET_TIME
    forever #`CLK_PERIOD cycle = cycle + 1;
  end

  SimpleDspModule SimpleDspModule(
    .clock(clock),
    .reset(reset),
    .io_y(io_y),
    .io_x(io_x),
    .io_z(io_z));

  initial begin
    #`INIT_TIME reset = 0;
    io_x = -4506;
    io_y = -4506;
    #(1*`CLK_PERIOD)     io_x = -1638;
    io_y = -1638;
    #(1*`CLK_PERIOD)     io_x = 11'd1638;
    io_y = 11'd1638;
    #(1*`CLK_PERIOD)     io_x = 13'd4506;
    io_y = 13'd4506;
    `expect("io_z",io_z,9012,cycle)
    #(1*`CLK_PERIOD)     io_x = -4506;
    io_y = -4506;
    `expect("io_z",io_z,-9012,cycle)
    #(1*`CLK_PERIOD)     io_x = -1638;
    io_y = -1638;
    `expect("io_z",io_z,-3276,cycle)
    #(1*`CLK_PERIOD)     io_x = 11'd1638;
    io_y = 11'd1638;
    `expect("io_z",io_z,3276,cycle)
    #(1*`CLK_PERIOD) 
    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule