circuit SCIEPipelined :
  module SCIEPipelined :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip valid : UInt<1>, flip insn : UInt<32>, flip rs1 : UInt<32>, flip rs2 : UInt<32>, rd : UInt<32>}

    wire _coeffs_WIRE : UInt<32> @[SCIEPipelined.scala 20:76]
    _coeffs_WIRE <= UInt<32>("h0") @[SCIEPipelined.scala 20:76]
    wire _coeffs_WIRE_1 : UInt<32> @[SCIEPipelined.scala 20:76]
    _coeffs_WIRE_1 <= UInt<32>("h0") @[SCIEPipelined.scala 20:76]
    wire _coeffs_WIRE_2 : UInt<32> @[SCIEPipelined.scala 20:76]
    _coeffs_WIRE_2 <= UInt<32>("h0") @[SCIEPipelined.scala 20:76]
    wire _coeffs_WIRE_3 : UInt<32>[3] @[SCIEPipelined.scala 20:31]
    _coeffs_WIRE_3[0] <= _coeffs_WIRE @[SCIEPipelined.scala 20:31]
    _coeffs_WIRE_3[1] <= _coeffs_WIRE_1 @[SCIEPipelined.scala 20:31]
    _coeffs_WIRE_3[2] <= _coeffs_WIRE_2 @[SCIEPipelined.scala 20:31]
    reg coeffs : UInt<32>[3], clock with :
      reset => (reset, _coeffs_WIRE_3) @[SCIEPipelined.scala 20:23]
    wire _data_WIRE : UInt<32> @[SCIEPipelined.scala 21:74]
    _data_WIRE <= UInt<32>("h0") @[SCIEPipelined.scala 21:74]
    wire _data_WIRE_1 : UInt<32> @[SCIEPipelined.scala 21:74]
    _data_WIRE_1 <= UInt<32>("h0") @[SCIEPipelined.scala 21:74]
    wire _data_WIRE_2 : UInt<32> @[SCIEPipelined.scala 21:74]
    _data_WIRE_2 <= UInt<32>("h0") @[SCIEPipelined.scala 21:74]
    wire _data_WIRE_3 : UInt<32>[3] @[SCIEPipelined.scala 21:29]
    _data_WIRE_3[0] <= _data_WIRE @[SCIEPipelined.scala 21:29]
    _data_WIRE_3[1] <= _data_WIRE_1 @[SCIEPipelined.scala 21:29]
    _data_WIRE_3[2] <= _data_WIRE_2 @[SCIEPipelined.scala 21:29]
    reg data : UInt<32>[3], clock with :
      reset => (reset, _data_WIRE_3) @[SCIEPipelined.scala 21:21]
    wire _result_WIRE : UInt<32> @[SCIEPipelined.scala 22:52]
    _result_WIRE <= UInt<32>("h0") @[SCIEPipelined.scala 22:52]
    reg result : UInt, clock with :
      reset => (reset, _result_WIRE) @[SCIEPipelined.scala 22:23]
    when io.valid : @[SCIEPipelined.scala 24:17]
      node _T = bits(io.insn, 6, 0) @[SCIEPipelined.scala 25:17]
      node _T_1 = eq(_T, UInt<4>("hb")) @[SCIEPipelined.scala 25:24]
      when _T_1 : @[SCIEPipelined.scala 25:42]
        node _T_2 = bits(io.rs2, 1, 0)
        coeffs[_T_2] <= io.rs1 @[SCIEPipelined.scala 26:22]
        node _result_T = bits(io.rs2, 1, 0)
        result <= coeffs[_result_T] @[SCIEPipelined.scala 27:14]
      else :
        node _T_3 = bits(io.insn, 6, 0) @[SCIEPipelined.scala 28:23]
        node _T_4 = eq(_T_3, UInt<6>("h2b")) @[SCIEPipelined.scala 28:30]
        when _T_4 : @[SCIEPipelined.scala 28:48]
          data[1] <= data[0] @[SCIEPipelined.scala 29:54]
          data[2] <= data[1] @[SCIEPipelined.scala 29:54]
          data[0] <= io.rs1 @[SCIEPipelined.scala 30:15]
          result <= data[0] @[SCIEPipelined.scala 31:14]
        else :
          node _T_5 = bits(io.insn, 6, 0) @[SCIEPipelined.scala 32:23]
          node _T_6 = eq(_T_5, UInt<7>("h5b")) @[SCIEPipelined.scala 32:30]
          when _T_6 : @[SCIEPipelined.scala 32:48]
            node _result_T_1 = mul(data[0], coeffs[0]) @[UIntTypeClass.scala 40:41]
            node _result_T_2 = mul(data[1], coeffs[1]) @[UIntTypeClass.scala 40:41]
            node _result_T_3 = mul(data[2], coeffs[2]) @[UIntTypeClass.scala 40:41]
            node _result_T_4 = add(_result_T_1, _result_T_2) @[UIntTypeClass.scala 19:40]
            node _result_T_5 = tail(_result_T_4, 1) @[UIntTypeClass.scala 19:40]
            node _result_T_6 = add(_result_T_5, _result_T_3) @[UIntTypeClass.scala 19:40]
            node _result_T_7 = tail(_result_T_6, 1) @[UIntTypeClass.scala 19:40]
            result <= _result_T_7 @[SCIEPipelined.scala 33:14]
    io.rd <= result @[SCIEPipelined.scala 36:9]

