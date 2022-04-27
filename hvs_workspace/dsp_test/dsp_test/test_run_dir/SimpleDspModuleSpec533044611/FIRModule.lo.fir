circuit FIRModule :
  module FIRModule :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1 : SInt<16>
    input io_rs2 : SInt<16>
    output io_rd : SInt<16>

    node _io_rd_T = add(io_rs1, io_rs2) @[FixedPointTypeClass.scala 21:58]
    node _io_rd_T_1 = tail(_io_rd_T, 1) @[FixedPointTypeClass.scala 21:58]
    node _io_rd_T_2 = asSInt(_io_rd_T_1) @[FixedPointTypeClass.scala 21:58]
    io_rd <= _io_rd_T_2 @[dsp_test.scala 18:11]
