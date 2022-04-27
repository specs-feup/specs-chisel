circuit FIRModule :
  module FIRModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip rs1 : Fixed<16><<16>>, flip rs2 : Fixed<16><<16>>, rd : Fixed<16><<16>>}

    node _io_rd_T = add(io.rs1, io.rs2) @[FixedPointTypeClass.scala 21:58]
    node _io_rd_T_1 = tail(_io_rd_T, 1) @[FixedPointTypeClass.scala 21:58]
    node _io_rd_T_2 = asFixedPoint(_io_rd_T_1, 16) @[FixedPointTypeClass.scala 21:58]
    io.rd <= _io_rd_T_2 @[dsp_test.scala 18:11]

