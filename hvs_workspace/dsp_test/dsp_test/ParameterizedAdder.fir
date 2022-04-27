circuit ParameterizedAdder :
  extmodule BBFAdd :
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    defname = BBFAdd

  module ParameterizedAdder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a1 : { node : UInt<64>}, flip a2 : { node : UInt<64>}, c : { node : UInt<64>}}

    reg register1 : { node : UInt<64>}, clock with :
      reset => (UInt<1>("h0"), register1) @[dsp_test.scala 72:22]
    inst register1_blackbox of BBFAdd @[DspReal.scala 41:36]
    register1_blackbox.out is invalid
    register1_blackbox.in2 is invalid
    register1_blackbox.in1 is invalid
    register1_blackbox.in1 <= io.a1.node @[DspReal.scala 24:21]
    register1_blackbox.in2 <= io.a2.node @[DspReal.scala 25:21]
    wire register1_out : { node : UInt<64>} @[DspReal.scala 26:19]
    register1_out.node <= register1_blackbox.out @[DspReal.scala 27:14]
    register1.node <= register1_out.node @[dsp_test.scala 74:13]
    io.c.node <= register1.node @[dsp_test.scala 76:8]

