circuit SCIEPipelined :
  module SCIEPipelined :
    input clock : Clock
    input reset : UInt<1>
    input io_valid : UInt<1>
    input io_insn : UInt<32>
    input io_rs1 : SInt<32>
    input io_rs2 : UInt<32>
    output io_rd : SInt<32>

    reg coeffs_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_0) @[SCIEPipelined.scala 23:23]
    reg coeffs_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_1) @[SCIEPipelined.scala 23:23]
    reg coeffs_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_2) @[SCIEPipelined.scala 23:23]
    reg coeffs_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_3) @[SCIEPipelined.scala 23:23]
    reg coeffs_4 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_4) @[SCIEPipelined.scala 23:23]
    reg data_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), data_0) @[SCIEPipelined.scala 24:21]
    reg data_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), data_1) @[SCIEPipelined.scala 24:21]
    reg data_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), data_2) @[SCIEPipelined.scala 24:21]
    reg data_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), data_3) @[SCIEPipelined.scala 24:21]
    reg data_4 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), data_4) @[SCIEPipelined.scala 24:21]
    reg result : SInt<32>, clock with :
      reset => (UInt<1>("h0"), result) @[SCIEPipelined.scala 25:23]
    node _T = bits(io_insn, 6, 0) @[SCIEPipelined.scala 28:17]
    node _T_1 = eq(_T, UInt<4>("hb")) @[SCIEPipelined.scala 28:24]
    node _T_2 = bits(io_rs2, 2, 0)
    node _coeffs_T_2 = io_rs1 @[SCIEPipelined.scala 29:{22,22}]
    node _GEN_0 = mux(eq(UInt<1>("h0"), _T_2), _coeffs_T_2, coeffs_0) @[SCIEPipelined.scala 29:{22,22} 23:23]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _T_2), _coeffs_T_2, coeffs_1) @[SCIEPipelined.scala 29:{22,22} 23:23]
    node _GEN_2 = mux(eq(UInt<2>("h2"), _T_2), _coeffs_T_2, coeffs_2) @[SCIEPipelined.scala 29:{22,22} 23:23]
    node _GEN_3 = mux(eq(UInt<2>("h3"), _T_2), _coeffs_T_2, coeffs_3) @[SCIEPipelined.scala 29:{22,22} 23:23]
    node _GEN_4 = mux(eq(UInt<3>("h4"), _T_2), _coeffs_T_2, coeffs_4) @[SCIEPipelined.scala 29:{22,22} 23:23]
    node _T_3 = bits(io_insn, 6, 0) @[SCIEPipelined.scala 30:23]
    node _T_4 = eq(_T_3, UInt<6>("h2b")) @[SCIEPipelined.scala 30:30]
    node _T_5 = bits(io_insn, 6, 0) @[SCIEPipelined.scala 33:23]
    node _T_6 = eq(_T_5, UInt<7>("h5b")) @[SCIEPipelined.scala 33:30]
    node _result_T = mul(data_0, coeffs_0) @[SCIEPipelined.scala 34:57]
    node _result_T_1 = mul(data_1, coeffs_1) @[SCIEPipelined.scala 34:57]
    node _result_T_2 = mul(data_2, coeffs_2) @[SCIEPipelined.scala 34:57]
    node _result_T_3 = mul(data_3, coeffs_3) @[SCIEPipelined.scala 34:57]
    node _result_T_4 = mul(data_4, coeffs_4) @[SCIEPipelined.scala 34:57]
    node _result_T_5 = add(_result_T, _result_T_1) @[SCIEPipelined.scala 34:72]
    node _result_T_6 = tail(_result_T_5, 1) @[SCIEPipelined.scala 34:72]
    node _result_T_7 = asSInt(_result_T_6) @[SCIEPipelined.scala 34:72]
    node _result_T_8 = add(_result_T_7, _result_T_2) @[SCIEPipelined.scala 34:72]
    node _result_T_9 = tail(_result_T_8, 1) @[SCIEPipelined.scala 34:72]
    node _result_T_10 = asSInt(_result_T_9) @[SCIEPipelined.scala 34:72]
    node _result_T_11 = add(_result_T_10, _result_T_3) @[SCIEPipelined.scala 34:72]
    node _result_T_12 = tail(_result_T_11, 1) @[SCIEPipelined.scala 34:72]
    node _result_T_13 = asSInt(_result_T_12) @[SCIEPipelined.scala 34:72]
    node _result_T_14 = add(_result_T_13, _result_T_4) @[SCIEPipelined.scala 34:72]
    node _result_T_15 = tail(_result_T_14, 1) @[SCIEPipelined.scala 34:72]
    node _result_T_16 = asSInt(_result_T_15) @[SCIEPipelined.scala 34:72]
    node _GEN_5 = mux(_T_6, _result_T_16, shl(result, 16)) @[SCIEPipelined.scala 33:48 34:14 25:23]
    node _GEN_6 = mux(_T_4, data_0, data_1) @[SCIEPipelined.scala 24:21 30:48 31:54]
    node _GEN_7 = mux(_T_4, data_1, data_2) @[SCIEPipelined.scala 24:21 30:48 31:54]
    node _GEN_8 = mux(_T_4, data_2, data_3) @[SCIEPipelined.scala 24:21 30:48 31:54]
    node _GEN_9 = mux(_T_4, data_3, data_4) @[SCIEPipelined.scala 24:21 30:48 31:54]
    node _GEN_10 = mux(_T_4, io_rs1, data_0) @[SCIEPipelined.scala 30:48 32:15 24:21]
    node _GEN_11 = mux(_T_4, shl(result, 16), _GEN_5) @[SCIEPipelined.scala 25:23 30:48]
    node _GEN_12 = mux(_T_1, _GEN_0, coeffs_0) @[SCIEPipelined.scala 23:23 28:42]
    node _GEN_13 = mux(_T_1, _GEN_1, coeffs_1) @[SCIEPipelined.scala 23:23 28:42]
    node _GEN_14 = mux(_T_1, _GEN_2, coeffs_2) @[SCIEPipelined.scala 23:23 28:42]
    node _GEN_15 = mux(_T_1, _GEN_3, coeffs_3) @[SCIEPipelined.scala 23:23 28:42]
    node _GEN_16 = mux(_T_1, _GEN_4, coeffs_4) @[SCIEPipelined.scala 23:23 28:42]
    node _GEN_17 = mux(_T_1, data_1, _GEN_6) @[SCIEPipelined.scala 24:21 28:42]
    node _GEN_18 = mux(_T_1, data_2, _GEN_7) @[SCIEPipelined.scala 24:21 28:42]
    node _GEN_19 = mux(_T_1, data_3, _GEN_8) @[SCIEPipelined.scala 24:21 28:42]
    node _GEN_20 = mux(_T_1, data_4, _GEN_9) @[SCIEPipelined.scala 24:21 28:42]
    node _GEN_21 = mux(_T_1, data_0, _GEN_10) @[SCIEPipelined.scala 24:21 28:42]
    node _GEN_22 = mux(_T_1, shl(result, 16), _GEN_11) @[SCIEPipelined.scala 25:23 28:42]
    node _GEN_23 = mux(io_valid, _GEN_12, coeffs_0) @[SCIEPipelined.scala 27:17 23:23]
    node _GEN_24 = mux(io_valid, _GEN_13, coeffs_1) @[SCIEPipelined.scala 27:17 23:23]
    node _GEN_25 = mux(io_valid, _GEN_14, coeffs_2) @[SCIEPipelined.scala 27:17 23:23]
    node _GEN_26 = mux(io_valid, _GEN_15, coeffs_3) @[SCIEPipelined.scala 27:17 23:23]
    node _GEN_27 = mux(io_valid, _GEN_16, coeffs_4) @[SCIEPipelined.scala 27:17 23:23]
    node _GEN_28 = mux(io_valid, _GEN_17, data_1) @[SCIEPipelined.scala 27:17 24:21]
    node _GEN_29 = mux(io_valid, _GEN_18, data_2) @[SCIEPipelined.scala 27:17 24:21]
    node _GEN_30 = mux(io_valid, _GEN_19, data_3) @[SCIEPipelined.scala 27:17 24:21]
    node _GEN_31 = mux(io_valid, _GEN_20, data_4) @[SCIEPipelined.scala 27:17 24:21]
    node _GEN_32 = mux(io_valid, _GEN_21, data_0) @[SCIEPipelined.scala 27:17 24:21]
    node _GEN_33 = mux(io_valid, _GEN_22, shl(result, 16)) @[SCIEPipelined.scala 27:17 25:23]
    node _coeffs_WIRE_0 = asSInt(UInt<32>("h0")) @[SCIEPipelined.scala 23:{31,31}]
    node _coeffs_WIRE_1 = asSInt(UInt<32>("h0")) @[SCIEPipelined.scala 23:{31,31}]
    node _coeffs_WIRE_2 = asSInt(UInt<32>("h0")) @[SCIEPipelined.scala 23:{31,31}]
    node _coeffs_WIRE_3 = asSInt(UInt<32>("h0")) @[SCIEPipelined.scala 23:{31,31}]
    node _coeffs_WIRE_4 = asSInt(UInt<32>("h0")) @[SCIEPipelined.scala 23:{31,31}]
    node _data_WIRE_0 = asSInt(UInt<32>("h0")) @[SCIEPipelined.scala 24:{29,29}]
    node _data_WIRE_1 = asSInt(UInt<32>("h0")) @[SCIEPipelined.scala 24:{29,29}]
    node _data_WIRE_2 = asSInt(UInt<32>("h0")) @[SCIEPipelined.scala 24:{29,29}]
    node _data_WIRE_3 = asSInt(UInt<32>("h0")) @[SCIEPipelined.scala 24:{29,29}]
    node _data_WIRE_4 = asSInt(UInt<32>("h0")) @[SCIEPipelined.scala 24:{29,29}]
    io_rd <= result @[SCIEPipelined.scala 37:9]
    coeffs_0 <= mux(reset, _coeffs_WIRE_0, _GEN_23) @[SCIEPipelined.scala 23:{23,23}]
    coeffs_1 <= mux(reset, _coeffs_WIRE_1, _GEN_24) @[SCIEPipelined.scala 23:{23,23}]
    coeffs_2 <= mux(reset, _coeffs_WIRE_2, _GEN_25) @[SCIEPipelined.scala 23:{23,23}]
    coeffs_3 <= mux(reset, _coeffs_WIRE_3, _GEN_26) @[SCIEPipelined.scala 23:{23,23}]
    coeffs_4 <= mux(reset, _coeffs_WIRE_4, _GEN_27) @[SCIEPipelined.scala 23:{23,23}]
    data_0 <= mux(reset, _data_WIRE_0, _GEN_32) @[SCIEPipelined.scala 24:{21,21}]
    data_1 <= mux(reset, _data_WIRE_1, _GEN_28) @[SCIEPipelined.scala 24:{21,21}]
    data_2 <= mux(reset, _data_WIRE_2, _GEN_29) @[SCIEPipelined.scala 24:{21,21}]
    data_3 <= mux(reset, _data_WIRE_3, _GEN_30) @[SCIEPipelined.scala 24:{21,21}]
    data_4 <= mux(reset, _data_WIRE_4, _GEN_31) @[SCIEPipelined.scala 24:{21,21}]
    result <= asSInt(bits(mux(reset, asSInt(UInt<32>("h0")), shr(_GEN_33, 16)), 31, 0)) @[SCIEPipelined.scala 25:{23,23}]
