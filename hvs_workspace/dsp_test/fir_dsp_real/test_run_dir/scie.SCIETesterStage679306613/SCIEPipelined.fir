circuit SCIEPipelined :
  module SCIEPipelined :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip valid : UInt<1>, flip insn : UInt<32>, flip rs1 : Fixed<32><<16>>, flip rs2 : UInt<32>, rd : Fixed<32><<16>>}

    wire _coeffs_WIRE : Fixed<32><<16>>[5] @[SCIEPipelined.scala 22:31]
    _coeffs_WIRE[0] <= asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 22:31]
    _coeffs_WIRE[1] <= asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 22:31]
    _coeffs_WIRE[2] <= asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 22:31]
    _coeffs_WIRE[3] <= asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 22:31]
    _coeffs_WIRE[4] <= asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 22:31]
    reg coeffs : Fixed<32><<16>>[5], clock with :
      reset => (reset, _coeffs_WIRE) @[SCIEPipelined.scala 22:23]
    wire _data_WIRE : Fixed<32><<16>>[5] @[SCIEPipelined.scala 23:29]
    _data_WIRE[0] <= asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 23:29]
    _data_WIRE[1] <= asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 23:29]
    _data_WIRE[2] <= asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 23:29]
    _data_WIRE[3] <= asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 23:29]
    _data_WIRE[4] <= asFixedPoint(UInt<32>("h0"), 16) @[SCIEPipelined.scala 23:29]
    reg data : Fixed<32><<16>>[5], clock with :
      reset => (reset, _data_WIRE) @[SCIEPipelined.scala 23:21]
    reg result : Fixed<32><<16>>, clock with :
      reset => (reset, asFixedPoint(UInt<32>("h0"), 16)) @[SCIEPipelined.scala 24:23]
    when io.valid : @[SCIEPipelined.scala 26:17]
      node _T = bits(io.insn, 6, 0) @[SCIEPipelined.scala 27:17]
      node _T_1 = eq(_T, UInt<4>("hb")) @[SCIEPipelined.scala 27:24]
      when _T_1 : @[SCIEPipelined.scala 27:42]
        node _T_2 = bits(io.rs2, 2, 0)
        coeffs[_T_2] <= io.rs1 @[SCIEPipelined.scala 28:22]
      else :
        node _T_3 = bits(io.insn, 6, 0) @[SCIEPipelined.scala 30:23]
        node _T_4 = eq(_T_3, UInt<6>("h2b")) @[SCIEPipelined.scala 30:30]
        when _T_4 : @[SCIEPipelined.scala 30:48]
          data[1] <= data[0] @[SCIEPipelined.scala 31:54]
          data[2] <= data[1] @[SCIEPipelined.scala 31:54]
          data[3] <= data[2] @[SCIEPipelined.scala 31:54]
          data[4] <= data[3] @[SCIEPipelined.scala 31:54]
          data[0] <= io.rs1 @[SCIEPipelined.scala 32:15]
        else :
          node _T_5 = bits(io.insn, 6, 0) @[SCIEPipelined.scala 34:23]
          node _T_6 = eq(_T_5, UInt<7>("h5b")) @[SCIEPipelined.scala 34:30]
          when _T_6 : @[SCIEPipelined.scala 34:48]
            node _result_T = mul(data[0], coeffs[0]) @[SCIEPipelined.scala 35:57]
            node _result_T_1 = mul(data[1], coeffs[1]) @[SCIEPipelined.scala 35:57]
            node _result_T_2 = mul(data[2], coeffs[2]) @[SCIEPipelined.scala 35:57]
            node _result_T_3 = mul(data[3], coeffs[3]) @[SCIEPipelined.scala 35:57]
            node _result_T_4 = mul(data[4], coeffs[4]) @[SCIEPipelined.scala 35:57]
            node _result_T_5 = add(_result_T, _result_T_1) @[SCIEPipelined.scala 35:72]
            node _result_T_6 = tail(_result_T_5, 1) @[SCIEPipelined.scala 35:72]
            node _result_T_7 = asFixedPoint(_result_T_6, 32) @[SCIEPipelined.scala 35:72]
            node _result_T_8 = add(_result_T_7, _result_T_2) @[SCIEPipelined.scala 35:72]
            node _result_T_9 = tail(_result_T_8, 1) @[SCIEPipelined.scala 35:72]
            node _result_T_10 = asFixedPoint(_result_T_9, 32) @[SCIEPipelined.scala 35:72]
            node _result_T_11 = add(_result_T_10, _result_T_3) @[SCIEPipelined.scala 35:72]
            node _result_T_12 = tail(_result_T_11, 1) @[SCIEPipelined.scala 35:72]
            node _result_T_13 = asFixedPoint(_result_T_12, 32) @[SCIEPipelined.scala 35:72]
            node _result_T_14 = add(_result_T_13, _result_T_4) @[SCIEPipelined.scala 35:72]
            node _result_T_15 = tail(_result_T_14, 1) @[SCIEPipelined.scala 35:72]
            node _result_T_16 = asFixedPoint(_result_T_15, 32) @[SCIEPipelined.scala 35:72]
            result <= _result_T_16 @[SCIEPipelined.scala 35:14]
    io.rd <= result @[SCIEPipelined.scala 38:9]

