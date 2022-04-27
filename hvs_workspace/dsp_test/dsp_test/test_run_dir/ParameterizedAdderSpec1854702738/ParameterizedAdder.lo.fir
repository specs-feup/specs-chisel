circuit ParameterizedAdder :
  module ParameterizedAdder :
    input clock : Clock
    input reset : UInt<1>
    input io_a1 : SInt<32>
    input io_a2 : SInt<32>
    output io_c : SInt<32>

    reg register1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), register1) @[dsp_test.scala 71:22]
    node _register1_T = add(io_a1, io_a2) @[FixedPointTypeClass.scala 21:58]
    node _register1_T_1 = tail(_register1_T, 1) @[FixedPointTypeClass.scala 21:58]
    node _register1_T_2 = asSInt(_register1_T_1) @[FixedPointTypeClass.scala 21:58]
    io_c <= register1 @[dsp_test.scala 75:8]
    register1 <= _register1_T_2 @[dsp_test.scala 73:13]
