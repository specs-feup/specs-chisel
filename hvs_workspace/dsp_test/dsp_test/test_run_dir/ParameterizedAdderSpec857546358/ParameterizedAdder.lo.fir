circuit ParameterizedAdder :
  extmodule BBFAdd :
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    defname = BBFAdd

  module ParameterizedAdder :
    input clock : Clock
    input reset : UInt<1>
    input io_a1_node : UInt<64>
    input io_a2_node : UInt<64>
    output io_c_node : UInt<64>

    inst register1_blackbox of BBFAdd @[DspReal.scala 41:36]
    reg register1_node : UInt<64>, clock with :
      reset => (UInt<1>("h0"), register1_node) @[dsp_test.scala 72:22]
    node register1_out_node = register1_blackbox.out @[DspReal.scala 26:19 27:14]
    io_c_node <= register1_node @[dsp_test.scala 76:8]
    register1_node <= register1_out_node @[dsp_test.scala 74:13]
    register1_blackbox.in1 <= io_a1_node @[DspReal.scala 24:21]
    register1_blackbox.in2 <= io_a2_node @[DspReal.scala 25:21]
