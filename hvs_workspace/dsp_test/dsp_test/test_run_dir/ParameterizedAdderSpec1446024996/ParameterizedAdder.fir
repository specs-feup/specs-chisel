circuit ParameterizedAdder :
  module ParameterizedAdder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a1 : Fixed<32><<16>>, flip a2 : Fixed<32><<16>>, c : Fixed<32><<16>>}

    reg register1 : Fixed<32><<16>>, clock with :
      reset => (UInt<1>("h0"), register1) @[dsp_test.scala 72:22]
    node _register1_T = add(io.a1, io.a2) @[FixedPointTypeClass.scala 21:58]
    node _register1_T_1 = tail(_register1_T, 1) @[FixedPointTypeClass.scala 21:58]
    node _register1_T_2 = asFixedPoint(_register1_T_1, 16) @[FixedPointTypeClass.scala 21:58]
    register1 <= _register1_T_2 @[dsp_test.scala 74:13]
    io.c <= register1 @[dsp_test.scala 76:8]

