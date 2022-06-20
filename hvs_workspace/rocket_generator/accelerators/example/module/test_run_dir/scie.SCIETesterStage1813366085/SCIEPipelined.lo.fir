circuit SCIEPipelined :
  module SCIEPipelined :
    input clock : Clock
    input reset : UInt<1>
    input io_valid : UInt<1>
    input io_insn : UInt<32>
    input io_rs1_real : SInt<16>
    input io_rs1_imag : SInt<16>
    input io_rs2 : UInt<32>
    output io_rd_real : SInt<16>
    output io_rd_imag : SInt<16>

    node _coeffs_T = asSInt(UInt<16>("h0")) @[SCIEPipelined.scala 22:76]
    node _coeffs_T_1 = asSInt(UInt<16>("h0")) @[SCIEPipelined.scala 22:76]
    reg coeffs_0_real : SInt<16>, clock with :
      reset => (UInt<1>("h0"), coeffs_0_real) @[SCIEPipelined.scala 22:23]
    reg coeffs_0_imag : SInt<16>, clock with :
      reset => (UInt<1>("h0"), coeffs_0_imag) @[SCIEPipelined.scala 22:23]
    node _data_T = asSInt(UInt<16>("h0")) @[SCIEPipelined.scala 23:74]
    node _data_T_1 = asSInt(UInt<16>("h0")) @[SCIEPipelined.scala 23:74]
    reg data_0_real : SInt<16>, clock with :
      reset => (UInt<1>("h0"), data_0_real) @[SCIEPipelined.scala 23:21]
    reg data_0_imag : SInt<16>, clock with :
      reset => (UInt<1>("h0"), data_0_imag) @[SCIEPipelined.scala 23:21]
    node _result_T = asSInt(UInt<16>("h0")) @[SCIEPipelined.scala 24:52]
    node _result_T_1 = asSInt(UInt<16>("h0")) @[SCIEPipelined.scala 24:52]
    reg result_real : SInt<16>, clock with :
      reset => (UInt<1>("h0"), result_real) @[SCIEPipelined.scala 24:23]
    reg result_imag : SInt<16>, clock with :
      reset => (UInt<1>("h0"), result_imag) @[SCIEPipelined.scala 24:23]
    node _T = bits(io_insn, 6, 0) @[SCIEPipelined.scala 27:17]
    node _T_1 = eq(_T, UInt<4>("hb")) @[SCIEPipelined.scala 27:24]
    node _T_2 = bits(io_insn, 6, 0) @[SCIEPipelined.scala 30:23]
    node _T_3 = eq(_T_2, UInt<6>("h2b")) @[SCIEPipelined.scala 30:30]
    node _T_4 = bits(io_insn, 6, 0) @[SCIEPipelined.scala 34:23]
    node _T_5 = eq(_T_4, UInt<7>("h5b")) @[SCIEPipelined.scala 34:30]
    node _result_c_p_d_T = add(coeffs_0_real, coeffs_0_imag) @[FixedPointTypeClass.scala 21:58]
    node _result_c_p_d_T_1 = tail(_result_c_p_d_T, 1) @[FixedPointTypeClass.scala 21:58]
    node result_c_p_d = asSInt(_result_c_p_d_T_1) @[FixedPointTypeClass.scala 21:58]
    node _result_a_p_b_T = add(data_0_real, data_0_imag) @[FixedPointTypeClass.scala 21:58]
    node _result_a_p_b_T_1 = tail(_result_a_p_b_T, 1) @[FixedPointTypeClass.scala 21:58]
    node result_a_p_b = asSInt(_result_a_p_b_T_1) @[FixedPointTypeClass.scala 21:58]
    node _result_b_m_a_T = sub(data_0_imag, data_0_real) @[FixedPointTypeClass.scala 31:68]
    node _result_b_m_a_T_1 = tail(_result_b_m_a_T, 1) @[FixedPointTypeClass.scala 31:68]
    node result_b_m_a = asSInt(_result_b_m_a_T_1) @[FixedPointTypeClass.scala 31:68]
    node result_ac_p_ad = mul(data_0_real, result_c_p_d) @[FixedPointTypeClass.scala 43:59]
    node result_ad_p_bd = mul(result_a_p_b, coeffs_0_imag) @[FixedPointTypeClass.scala 43:59]
    node result_bc_m_ac = mul(result_b_m_a, coeffs_0_real) @[FixedPointTypeClass.scala 43:59]
    node _result_T_2 = sub(result_ac_p_ad, result_ad_p_bd) @[FixedPointTypeClass.scala 31:68]
    node _result_T_3 = tail(_result_T_2, 1) @[FixedPointTypeClass.scala 31:68]
    node _result_T_4 = asSInt(_result_T_3) @[FixedPointTypeClass.scala 31:68]
    node _result_T_5 = add(result_ac_p_ad, result_bc_m_ac) @[FixedPointTypeClass.scala 21:58]
    node _result_T_6 = tail(_result_T_5, 1) @[FixedPointTypeClass.scala 21:58]
    node _result_T_7 = asSInt(_result_T_6) @[FixedPointTypeClass.scala 21:58]
    node result_result_imag = _result_T_7 @[DspComplex.scala 34:22 36:17]
    node _GEN_0 = mux(_T_5, result_result_imag, shl(result_imag, 8)) @[SCIEPipelined.scala 34:48 35:16 24:23]
    node result_result_real = _result_T_4 @[DspComplex.scala 34:22 35:17]
    node _GEN_1 = mux(_T_5, result_result_real, shl(result_real, 8)) @[SCIEPipelined.scala 34:48 35:16 24:23]
    node _GEN_2 = mux(_T_3, io_rs1_imag, data_0_imag) @[SCIEPipelined.scala 30:48 32:15 23:21]
    node _GEN_3 = mux(_T_3, io_rs1_real, data_0_real) @[SCIEPipelined.scala 30:48 32:15 23:21]
    node _GEN_4 = mux(_T_3, shl(data_0_imag, 8), _GEN_0) @[SCIEPipelined.scala 30:48 33:14]
    node _GEN_5 = mux(_T_3, shl(data_0_real, 8), _GEN_1) @[SCIEPipelined.scala 30:48 33:14]
    node _GEN_6 = mux(_T_1, io_rs1_imag, coeffs_0_imag) @[SCIEPipelined.scala 27:42 28:22 22:23]
    node _GEN_7 = mux(_T_1, io_rs1_real, coeffs_0_real) @[SCIEPipelined.scala 27:42 28:22 22:23]
    node _GEN_8 = mux(_T_1, shl(coeffs_0_imag, 8), _GEN_4) @[SCIEPipelined.scala 27:42 29:14]
    node _GEN_9 = mux(_T_1, shl(coeffs_0_real, 8), _GEN_5) @[SCIEPipelined.scala 27:42 29:14]
    node _GEN_10 = mux(_T_1, data_0_imag, _GEN_2) @[SCIEPipelined.scala 23:21 27:42]
    node _GEN_11 = mux(_T_1, data_0_real, _GEN_3) @[SCIEPipelined.scala 23:21 27:42]
    node _GEN_12 = mux(io_valid, _GEN_6, coeffs_0_imag) @[SCIEPipelined.scala 26:17 22:23]
    node _GEN_13 = mux(io_valid, _GEN_7, coeffs_0_real) @[SCIEPipelined.scala 26:17 22:23]
    node _GEN_14 = mux(io_valid, _GEN_8, shl(result_imag, 8)) @[SCIEPipelined.scala 26:17 24:23]
    node _GEN_15 = mux(io_valid, _GEN_9, shl(result_real, 8)) @[SCIEPipelined.scala 26:17 24:23]
    node _GEN_16 = mux(io_valid, _GEN_10, data_0_imag) @[SCIEPipelined.scala 26:17 23:21]
    node _GEN_17 = mux(io_valid, _GEN_11, data_0_real) @[SCIEPipelined.scala 26:17 23:21]
    node _coeffs_WIRE_real = _coeffs_T_1 @[SCIEPipelined.scala 22:{76,76}]
    node _coeffs_WIRE_imag = _coeffs_T @[SCIEPipelined.scala 22:{76,76}]
    node _coeffs_WIRE_1_0_real = _coeffs_WIRE_real @[SCIEPipelined.scala 22:{31,31}]
    node _coeffs_WIRE_1_0_imag = _coeffs_WIRE_imag @[SCIEPipelined.scala 22:{31,31}]
    node _data_WIRE_real = _data_T_1 @[SCIEPipelined.scala 23:{74,74}]
    node _data_WIRE_imag = _data_T @[SCIEPipelined.scala 23:{74,74}]
    node _data_WIRE_1_0_real = _data_WIRE_real @[SCIEPipelined.scala 23:{29,29}]
    node _data_WIRE_1_0_imag = _data_WIRE_imag @[SCIEPipelined.scala 23:{29,29}]
    node _result_WIRE_real = _result_T_1 @[SCIEPipelined.scala 24:{52,52}]
    node _result_WIRE_imag = _result_T @[SCIEPipelined.scala 24:{52,52}]
    io_rd_real <= result_real @[SCIEPipelined.scala 38:9]
    io_rd_imag <= result_imag @[SCIEPipelined.scala 38:9]
    coeffs_0_real <= mux(reset, _coeffs_WIRE_1_0_real, _GEN_13) @[SCIEPipelined.scala 22:{23,23}]
    coeffs_0_imag <= mux(reset, _coeffs_WIRE_1_0_imag, _GEN_12) @[SCIEPipelined.scala 22:{23,23}]
    data_0_real <= mux(reset, _data_WIRE_1_0_real, _GEN_17) @[SCIEPipelined.scala 23:{21,21}]
    data_0_imag <= mux(reset, _data_WIRE_1_0_imag, _GEN_16) @[SCIEPipelined.scala 23:{21,21}]
    result_real <= asSInt(bits(mux(reset, _result_WIRE_real, shr(_GEN_15, 8)), 15, 0)) @[SCIEPipelined.scala 24:{23,23}]
    result_imag <= asSInt(bits(mux(reset, _result_WIRE_imag, shr(_GEN_14, 8)), 15, 0)) @[SCIEPipelined.scala 24:{23,23}]
