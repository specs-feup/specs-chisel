circuit SCIEPipelined :
  module SCIEPipelined :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip valid : UInt<1>, flip insn : UInt<32>, flip rs1 : Fixed<32><<16>>, flip rs2 : UInt<32>, rd : Fixed<32><<16>>}

    wire _coeffs_WIRE : Fixed<32><<16>> @[SCIEPipelined.scala 20:76]
    node _coeffs_T = asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 20:76]
    _coeffs_WIRE <= _coeffs_T @[SCIEPipelined.scala 20:76]
    wire _coeffs_WIRE_1 : Fixed<32><<16>> @[SCIEPipelined.scala 20:76]
    node _coeffs_T_1 = asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 20:76]
    _coeffs_WIRE_1 <= _coeffs_T_1 @[SCIEPipelined.scala 20:76]
    wire _coeffs_WIRE_2 : Fixed<32><<16>>[2] @[SCIEPipelined.scala 20:31]
    _coeffs_WIRE_2[0] <= _coeffs_WIRE @[SCIEPipelined.scala 20:31]
    _coeffs_WIRE_2[1] <= _coeffs_WIRE_1 @[SCIEPipelined.scala 20:31]
    reg coeffs : Fixed<32><<16>>[2], clock with :
      reset => (reset, _coeffs_WIRE_2) @[SCIEPipelined.scala 20:23]
    wire _data_WIRE : Fixed<32><<16>> @[SCIEPipelined.scala 21:74]
    node _data_T = asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 21:74]
    _data_WIRE <= _data_T @[SCIEPipelined.scala 21:74]
    wire _data_WIRE_1 : Fixed<32><<16>> @[SCIEPipelined.scala 21:74]
    node _data_T_1 = asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 21:74]
    _data_WIRE_1 <= _data_T_1 @[SCIEPipelined.scala 21:74]
    wire _data_WIRE_2 : Fixed<32><<16>>[2] @[SCIEPipelined.scala 21:29]
    _data_WIRE_2[0] <= _data_WIRE @[SCIEPipelined.scala 21:29]
    _data_WIRE_2[1] <= _data_WIRE_1 @[SCIEPipelined.scala 21:29]
    reg data : Fixed<32><<16>>[2], clock with :
      reset => (reset, _data_WIRE_2) @[SCIEPipelined.scala 21:21]
    wire _result_WIRE : Fixed<32><<16>> @[SCIEPipelined.scala 22:52]
    node _result_T = asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 22:52]
    _result_WIRE <= _result_T @[SCIEPipelined.scala 22:52]
    reg result : Fixed<<16>>, clock with :
      reset => (reset, _result_WIRE) @[SCIEPipelined.scala 22:23]
    when io.valid : @[SCIEPipelined.scala 24:17]
      node _T = bits(io.insn, 6, 0) @[SCIEPipelined.scala 25:19]
      node _T_1 = eq(_T, UInt<4>("hb")) @[SCIEPipelined.scala 25:26]
      when _T_1 : @[SCIEPipelined.scala 25:39]
        node _T_2 = bits(io.rs2, 0, 0)
        coeffs[_T_2] <= io.rs1 @[SCIEPipelined.scala 26:24]
        node _result_T_1 = bits(io.rs2, 0, 0)
        result <= coeffs[_result_T_1] @[SCIEPipelined.scala 27:16]
      else :
        node _T_3 = bits(io.insn, 6, 0) @[SCIEPipelined.scala 28:25]
        node _T_4 = eq(_T_3, UInt<6>("h2b")) @[SCIEPipelined.scala 28:32]
        when _T_4 : @[SCIEPipelined.scala 28:44]
          data[1] <= data[0] @[SCIEPipelined.scala 29:54]
          data[0] <= io.rs1 @[SCIEPipelined.scala 30:15]
          result <= data[0] @[SCIEPipelined.scala 31:14]
        else :
          node _T_5 = bits(io.insn, 6, 0) @[SCIEPipelined.scala 32:25]
          node _T_6 = eq(_T_5, UInt<6>("h3b")) @[SCIEPipelined.scala 32:32]
          when _T_6 : @[SCIEPipelined.scala 32:44]
            node _result_T_2 = mul(data[0], coeffs[0]) @[FixedPointTypeClass.scala 43:59]
            node _result_T_3 = mul(data[1], coeffs[1]) @[FixedPointTypeClass.scala 43:59]
            node _result_T_4 = add(_result_T_2, _result_T_3) @[FixedPointTypeClass.scala 21:58]
            node _result_T_5 = tail(_result_T_4, 1) @[FixedPointTypeClass.scala 21:58]
            node _result_T_6 = asFixedPoint(_result_T_5, 32) @[FixedPointTypeClass.scala 21:58]
            result <= _result_T_6 @[SCIEPipelined.scala 33:14]
    io.rd <= result @[SCIEPipelined.scala 36:9]

