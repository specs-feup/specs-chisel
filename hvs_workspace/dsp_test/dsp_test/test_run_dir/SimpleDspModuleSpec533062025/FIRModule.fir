circuit FIRModule :
  module FIRModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip rs1 : Fixed<16><<1>>, flip rs2 : Fixed<16><<1>>, rd : Fixed<16><<1>>}

    node _io_rd_T = add(io.rs1, io.rs2) @[FixedPointTypeClass.scala 21:58]
    node _io_rd_T_1 = tail(_io_rd_T, 1) @[FixedPointTypeClass.scala 21:58]
    node _io_rd_T_2 = asFixedPoint(_io_rd_T_1, 1) @[FixedPointTypeClass.scala 21:58]
    io.rd <= _io_rd_T_2 @[dsp_test.scala 18:11]

