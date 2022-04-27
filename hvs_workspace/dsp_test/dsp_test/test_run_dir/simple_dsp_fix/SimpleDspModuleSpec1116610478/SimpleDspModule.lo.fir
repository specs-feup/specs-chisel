circuit SimpleDspModule :
  module SimpleDspModule :
    input clock : Clock
    input reset : UInt<1>
    input io_x : SInt<16>
    input io_y : SInt<16>
    output io_z : SInt<16>

    node _io_z_T = add(io_x, io_y) @[FixedPointTypeClass.scala 21:58]
    node _io_z_T_1 = tail(_io_z_T, 1) @[FixedPointTypeClass.scala 21:58]
    node _io_z_T_2 = asSInt(_io_z_T_1) @[FixedPointTypeClass.scala 21:58]
    io_z <= _io_z_T_2 @[dsp_test.scala 23:10]
