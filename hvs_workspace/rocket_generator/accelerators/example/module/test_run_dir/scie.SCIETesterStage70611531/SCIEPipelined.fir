circuit SCIEPipelined :
  extmodule BBFMultiply :
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    defname = BBFMultiply

  extmodule BBFMultiply_1 :
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    defname = BBFMultiply

  extmodule BBFMultiply_2 :
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    defname = BBFMultiply

  extmodule BBFMultiply_3 :
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    defname = BBFMultiply

  extmodule BBFMultiply_4 :
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    defname = BBFMultiply

  extmodule BBFAdd :
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    defname = BBFAdd

  extmodule BBFAdd_1 :
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    defname = BBFAdd

  extmodule BBFAdd_2 :
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    defname = BBFAdd

  extmodule BBFAdd_3 :
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    defname = BBFAdd

  module SCIEPipelined :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip valid : UInt<1>, flip insn : UInt<32>, flip rs1 : { node : UInt<64>}, flip rs2 : UInt<32>, rd : { node : UInt<64>}}

    wire _coeffs_WIRE : { node : UInt<64>} @[SCIEPipelined.scala 20:76]
    _coeffs_WIRE.node <= UInt<64>("h0") @[SCIEPipelined.scala 20:76]
    wire _coeffs_WIRE_1 : { node : UInt<64>} @[SCIEPipelined.scala 20:76]
    _coeffs_WIRE_1.node <= UInt<64>("h0") @[SCIEPipelined.scala 20:76]
    wire _coeffs_WIRE_2 : { node : UInt<64>} @[SCIEPipelined.scala 20:76]
    _coeffs_WIRE_2.node <= UInt<64>("h0") @[SCIEPipelined.scala 20:76]
    wire _coeffs_WIRE_3 : { node : UInt<64>} @[SCIEPipelined.scala 20:76]
    _coeffs_WIRE_3.node <= UInt<64>("h0") @[SCIEPipelined.scala 20:76]
    wire _coeffs_WIRE_4 : { node : UInt<64>} @[SCIEPipelined.scala 20:76]
    _coeffs_WIRE_4.node <= UInt<64>("h0") @[SCIEPipelined.scala 20:76]
    wire _coeffs_WIRE_5 : { node : UInt<64>}[5] @[SCIEPipelined.scala 20:31]
    _coeffs_WIRE_5[0].node <= _coeffs_WIRE.node @[SCIEPipelined.scala 20:31]
    _coeffs_WIRE_5[1].node <= _coeffs_WIRE_1.node @[SCIEPipelined.scala 20:31]
    _coeffs_WIRE_5[2].node <= _coeffs_WIRE_2.node @[SCIEPipelined.scala 20:31]
    _coeffs_WIRE_5[3].node <= _coeffs_WIRE_3.node @[SCIEPipelined.scala 20:31]
    _coeffs_WIRE_5[4].node <= _coeffs_WIRE_4.node @[SCIEPipelined.scala 20:31]
    reg coeffs : { node : UInt<64>}[5], clock with :
      reset => (reset, _coeffs_WIRE_5) @[SCIEPipelined.scala 20:23]
    wire _data_WIRE : { node : UInt<64>} @[SCIEPipelined.scala 21:74]
    _data_WIRE.node <= UInt<64>("h0") @[SCIEPipelined.scala 21:74]
    wire _data_WIRE_1 : { node : UInt<64>} @[SCIEPipelined.scala 21:74]
    _data_WIRE_1.node <= UInt<64>("h0") @[SCIEPipelined.scala 21:74]
    wire _data_WIRE_2 : { node : UInt<64>} @[SCIEPipelined.scala 21:74]
    _data_WIRE_2.node <= UInt<64>("h0") @[SCIEPipelined.scala 21:74]
    wire _data_WIRE_3 : { node : UInt<64>} @[SCIEPipelined.scala 21:74]
    _data_WIRE_3.node <= UInt<64>("h0") @[SCIEPipelined.scala 21:74]
    wire _data_WIRE_4 : { node : UInt<64>} @[SCIEPipelined.scala 21:74]
    _data_WIRE_4.node <= UInt<64>("h0") @[SCIEPipelined.scala 21:74]
    wire _data_WIRE_5 : { node : UInt<64>}[5] @[SCIEPipelined.scala 21:29]
    _data_WIRE_5[0].node <= _data_WIRE.node @[SCIEPipelined.scala 21:29]
    _data_WIRE_5[1].node <= _data_WIRE_1.node @[SCIEPipelined.scala 21:29]
    _data_WIRE_5[2].node <= _data_WIRE_2.node @[SCIEPipelined.scala 21:29]
    _data_WIRE_5[3].node <= _data_WIRE_3.node @[SCIEPipelined.scala 21:29]
    _data_WIRE_5[4].node <= _data_WIRE_4.node @[SCIEPipelined.scala 21:29]
    reg data : { node : UInt<64>}[5], clock with :
      reset => (reset, _data_WIRE_5) @[SCIEPipelined.scala 21:21]
    wire _result_WIRE : { node : UInt<64>} @[SCIEPipelined.scala 22:52]
    _result_WIRE.node <= UInt<64>("h0") @[SCIEPipelined.scala 22:52]
    reg result : { node : UInt<64>}, clock with :
      reset => (reset, _result_WIRE) @[SCIEPipelined.scala 22:23]
    when io.valid : @[SCIEPipelined.scala 24:17]
      node _T = bits(io.insn, 6, 0) @[SCIEPipelined.scala 25:17]
      node _T_1 = eq(_T, UInt<4>("hb")) @[SCIEPipelined.scala 25:24]
      when _T_1 : @[SCIEPipelined.scala 25:42]
        node _T_2 = bits(io.rs2, 2, 0)
        coeffs[_T_2].node <= io.rs1.node @[SCIEPipelined.scala 26:22]
      else :
        node _T_3 = bits(io.insn, 6, 0) @[SCIEPipelined.scala 27:23]
        node _T_4 = eq(_T_3, UInt<6>("h2b")) @[SCIEPipelined.scala 27:30]
        when _T_4 : @[SCIEPipelined.scala 27:48]
          data[1].node <= data[0].node @[SCIEPipelined.scala 28:54]
          data[2].node <= data[1].node @[SCIEPipelined.scala 28:54]
          data[3].node <= data[2].node @[SCIEPipelined.scala 28:54]
          data[4].node <= data[3].node @[SCIEPipelined.scala 28:54]
          data[0].node <= io.rs1.node @[SCIEPipelined.scala 29:15]
        else :
          node _T_5 = bits(io.insn, 6, 0) @[SCIEPipelined.scala 30:23]
          node _T_6 = eq(_T_5, UInt<7>("h5b")) @[SCIEPipelined.scala 30:30]
          when _T_6 : @[SCIEPipelined.scala 30:48]
            inst result_blackbox of BBFMultiply @[DspReal.scala 49:36]
            result_blackbox.out is invalid
            result_blackbox.in2 is invalid
            result_blackbox.in1 is invalid
            result_blackbox.in1 <= data[0].node @[DspReal.scala 24:21]
            result_blackbox.in2 <= coeffs[0].node @[DspReal.scala 25:21]
            wire result_out : { node : UInt<64>} @[DspReal.scala 26:19]
            result_out.node <= result_blackbox.out @[DspReal.scala 27:14]
            inst result_blackbox_1 of BBFMultiply_1 @[DspReal.scala 49:36]
            result_blackbox_1.out is invalid
            result_blackbox_1.in2 is invalid
            result_blackbox_1.in1 is invalid
            result_blackbox_1.in1 <= data[1].node @[DspReal.scala 24:21]
            result_blackbox_1.in2 <= coeffs[1].node @[DspReal.scala 25:21]
            wire result_out_1 : { node : UInt<64>} @[DspReal.scala 26:19]
            result_out_1.node <= result_blackbox_1.out @[DspReal.scala 27:14]
            inst result_blackbox_2 of BBFMultiply_2 @[DspReal.scala 49:36]
            result_blackbox_2.out is invalid
            result_blackbox_2.in2 is invalid
            result_blackbox_2.in1 is invalid
            result_blackbox_2.in1 <= data[2].node @[DspReal.scala 24:21]
            result_blackbox_2.in2 <= coeffs[2].node @[DspReal.scala 25:21]
            wire result_out_2 : { node : UInt<64>} @[DspReal.scala 26:19]
            result_out_2.node <= result_blackbox_2.out @[DspReal.scala 27:14]
            inst result_blackbox_3 of BBFMultiply_3 @[DspReal.scala 49:36]
            result_blackbox_3.out is invalid
            result_blackbox_3.in2 is invalid
            result_blackbox_3.in1 is invalid
            result_blackbox_3.in1 <= data[3].node @[DspReal.scala 24:21]
            result_blackbox_3.in2 <= coeffs[3].node @[DspReal.scala 25:21]
            wire result_out_3 : { node : UInt<64>} @[DspReal.scala 26:19]
            result_out_3.node <= result_blackbox_3.out @[DspReal.scala 27:14]
            inst result_blackbox_4 of BBFMultiply_4 @[DspReal.scala 49:36]
            result_blackbox_4.out is invalid
            result_blackbox_4.in2 is invalid
            result_blackbox_4.in1 is invalid
            result_blackbox_4.in1 <= data[4].node @[DspReal.scala 24:21]
            result_blackbox_4.in2 <= coeffs[4].node @[DspReal.scala 25:21]
            wire result_out_4 : { node : UInt<64>} @[DspReal.scala 26:19]
            result_out_4.node <= result_blackbox_4.out @[DspReal.scala 27:14]
            inst result_blackbox_5 of BBFAdd @[DspReal.scala 41:36]
            result_blackbox_5.out is invalid
            result_blackbox_5.in2 is invalid
            result_blackbox_5.in1 is invalid
            result_blackbox_5.in1 <= result_out.node @[DspReal.scala 24:21]
            result_blackbox_5.in2 <= result_out_1.node @[DspReal.scala 25:21]
            wire result_out_5 : { node : UInt<64>} @[DspReal.scala 26:19]
            result_out_5.node <= result_blackbox_5.out @[DspReal.scala 27:14]
            inst result_blackbox_6 of BBFAdd_1 @[DspReal.scala 41:36]
            result_blackbox_6.out is invalid
            result_blackbox_6.in2 is invalid
            result_blackbox_6.in1 is invalid
            result_blackbox_6.in1 <= result_out_5.node @[DspReal.scala 24:21]
            result_blackbox_6.in2 <= result_out_2.node @[DspReal.scala 25:21]
            wire result_out_6 : { node : UInt<64>} @[DspReal.scala 26:19]
            result_out_6.node <= result_blackbox_6.out @[DspReal.scala 27:14]
            inst result_blackbox_7 of BBFAdd_2 @[DspReal.scala 41:36]
            result_blackbox_7.out is invalid
            result_blackbox_7.in2 is invalid
            result_blackbox_7.in1 is invalid
            result_blackbox_7.in1 <= result_out_6.node @[DspReal.scala 24:21]
            result_blackbox_7.in2 <= result_out_3.node @[DspReal.scala 25:21]
            wire result_out_7 : { node : UInt<64>} @[DspReal.scala 26:19]
            result_out_7.node <= result_blackbox_7.out @[DspReal.scala 27:14]
            inst result_blackbox_8 of BBFAdd_3 @[DspReal.scala 41:36]
            result_blackbox_8.out is invalid
            result_blackbox_8.in2 is invalid
            result_blackbox_8.in1 is invalid
            result_blackbox_8.in1 <= result_out_7.node @[DspReal.scala 24:21]
            result_blackbox_8.in2 <= result_out_4.node @[DspReal.scala 25:21]
            wire result_out_8 : { node : UInt<64>} @[DspReal.scala 26:19]
            result_out_8.node <= result_blackbox_8.out @[DspReal.scala 27:14]
            result.node <= result_out_8.node @[SCIEPipelined.scala 31:14]
    io.rd.node <= result.node @[SCIEPipelined.scala 34:9]

