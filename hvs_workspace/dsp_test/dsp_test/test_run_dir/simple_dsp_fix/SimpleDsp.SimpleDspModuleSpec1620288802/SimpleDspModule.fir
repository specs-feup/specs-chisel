circuit SimpleDspModule :
  module SimpleDspModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip x : Fixed<16><<12>>, flip y : Fixed<16><<12>>, z : Fixed<16><<12>>}

    node _io_z_T = add(io.x, io.y) @[FixedPointTypeClass.scala 21:58]
    node _io_z_T_1 = tail(_io_z_T, 1) @[FixedPointTypeClass.scala 21:58]
    node _io_z_T_2 = asFixedPoint(_io_z_T_1, 12) @[FixedPointTypeClass.scala 21:58]
    io.z <= _io_z_T_2 @[test.scala 38:10]

