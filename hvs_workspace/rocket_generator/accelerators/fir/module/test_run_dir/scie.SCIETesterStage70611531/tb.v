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
  reg[63:0] io_rs1_node = 0;
  reg[31:0] io_insn = 0;
  reg[0:0] io_valid = 0;
  wire[63:0] io_rd_node;

  always #`HALF_CLK_PERIOD clock = ~clock;

  initial begin
    #`RESET_TIME
    forever #`CLK_PERIOD cycle = cycle + 1;
  end

  SCIEPipelined SCIEPipelined(
    .clock(clock),
    .reset(reset),
    .io_rs2(io_rs2),
    .io_rs1_node(io_rs1_node),
    .io_insn(io_insn),
    .io_valid(io_valid),
    .io_rd_node(io_rd_node));

  initial begin
    #`INIT_TIME reset = 0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_node = 62'd4604378532078944256;
    io_rs2 = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_node = 62'd4577240415073206272;
    io_rs2 = 1'd1;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_node = 62'd4584669669113200640;
    io_rs2 = 2'd2;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_node = 62'd4585634456206835712;
    io_rs2 = 2'd3;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 4'd11;
    io_rs1_node = 62'd4602539936036421632;
    io_rs2 = 3'd4;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_node = 62'd4601505030380453888;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_node",io_rd_node,4599066537020257280,cycle)
    `expect("io_rd_node",io_rd_node,4599066537020257280,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_node = 62'd4605379632047325184;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_node",io_rd_node,4603178298064311552,cycle)
    `expect("io_rd_node",io_rd_node,4603178298064311552,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_node = 62'd4600041230364049408;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_node",io_rd_node,4598455629853268736,cycle)
    `expect("io_rd_node",io_rd_node,4598455629853268736,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_node = 62'd4599596015127887872;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_node",io_rd_node,4598567363870063616,cycle)
    `expect("io_rd_node",io_rd_node,4598567363870063616,cycle)
    io_valid = 1'd0;
    io_valid = 1'd1;
    io_insn = 6'd43;
    io_rs1_node = 62'd4604508564361314304;
    #(1*`CLK_PERIOD)     io_valid = 1'd0;
    #(1*`CLK_PERIOD)     io_valid = 1'd1;
    io_insn = 7'd91;
    #(1*`CLK_PERIOD)     `expect("io_rd_node",io_rd_node,4604869738215264288,cycle)
    `expect("io_rd_node",io_rd_node,4604869738215264288,cycle)
    io_valid = 1'd0;

    #`CLK_PERIOD $display("\t **Ran through all test vectors**"); $finish;

  end
endmodule