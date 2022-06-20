circuit SCIEPipelined :
  module SCIEPipelined :
    input clock : Clock
    input reset : UInt<1>
    input io_valid : UInt<1>
    input io_insn : UInt<32>
    input io_rs1 : UInt<32>
    input io_rs2 : UInt<32>
    output io_rd : UInt<32>

    reg coeffs_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_0) @[SCIEPipelined.scala 20:23]
    reg coeffs_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_1) @[SCIEPipelined.scala 20:23]
    reg data_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), data_0) @[SCIEPipelined.scala 21:21]
    reg data_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), data_1) @[SCIEPipelined.scala 21:21]
    reg result : UInt<64>, clock with :
      reset => (UInt<1>("h0"), result) @[SCIEPipelined.scala 22:23]
    node _T = bits(io_insn, 6, 0) @[SCIEPipelined.scala 25:19]
    node _T_1 = eq(_T, UInt<4>("hb")) @[SCIEPipelined.scala 25:26]
    node _T_2 = bits(io_rs2, 0, 0)
    node _coeffs_T_2 = io_rs1 @[SCIEPipelined.scala 26:{24,24}]
    node _GEN_0 = mux(eq(UInt<1>("h0"), _T_2), _coeffs_T_2, coeffs_0) @[SCIEPipelined.scala 20:23 26:{24,24}]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _T_2), _coeffs_T_2, coeffs_1) @[SCIEPipelined.scala 20:23 26:{24,24}]
    node _result_T = bits(io_rs2, 0, 0)
    node _GEN_2 = validif(eq(UInt<1>("h0"), _result_T), coeffs_0) @[SCIEPipelined.scala 27:{16,16}]
    node _GEN_3 = mux(eq(UInt<1>("h1"), _result_T), coeffs_1, _GEN_2) @[SCIEPipelined.scala 27:{16,16}]
    node _T_3 = bits(io_insn, 6, 0) @[SCIEPipelined.scala 28:25]
    node _T_4 = eq(_T_3, UInt<6>("h2b")) @[SCIEPipelined.scala 28:32]
    node _T_5 = bits(io_insn, 6, 0) @[SCIEPipelined.scala 32:25]
    node _T_6 = eq(_T_5, UInt<6>("h3b")) @[SCIEPipelined.scala 32:32]
    node _result_T_1 = mul(data_0, coeffs_0) @[UIntTypeClass.scala 40:41]
    node _result_T_2 = mul(data_1, coeffs_1) @[UIntTypeClass.scala 40:41]
    node _result_T_3 = add(_result_T_1, _result_T_2) @[UIntTypeClass.scala 19:40]
    node _result_T_4 = tail(_result_T_3, 1) @[UIntTypeClass.scala 19:40]
    node _GEN_4 = mux(_T_6, _result_T_4, result) @[SCIEPipelined.scala 32:44 33:14 22:23]
    node _GEN_5 = mux(_T_4, data_0, data_1) @[SCIEPipelined.scala 21:21 28:44 29:54]
    node _GEN_6 = mux(_T_4, io_rs1, data_0) @[SCIEPipelined.scala 28:44 30:15 21:21]
    node _GEN_7 = mux(_T_4, data_0, _GEN_4) @[SCIEPipelined.scala 28:44 31:14]
    node _GEN_8 = mux(_T_1, _GEN_0, coeffs_0) @[SCIEPipelined.scala 20:23 25:39]
    node _GEN_9 = mux(_T_1, _GEN_1, coeffs_1) @[SCIEPipelined.scala 20:23 25:39]
    node _coeffs_result_T = _GEN_3 @[SCIEPipelined.scala 27:16]
    node _GEN_10 = mux(_T_1, _coeffs_result_T, _GEN_7) @[SCIEPipelined.scala 25:39 27:16]
    node _GEN_11 = mux(_T_1, data_1, _GEN_5) @[SCIEPipelined.scala 21:21 25:39]
    node _GEN_12 = mux(_T_1, data_0, _GEN_6) @[SCIEPipelined.scala 21:21 25:39]
    node _GEN_13 = mux(io_valid, _GEN_8, coeffs_0) @[SCIEPipelined.scala 24:17 20:23]
    node _GEN_14 = mux(io_valid, _GEN_9, coeffs_1) @[SCIEPipelined.scala 24:17 20:23]
    node _GEN_15 = mux(io_valid, _GEN_10, result) @[SCIEPipelined.scala 24:17 22:23]
    node _GEN_16 = mux(io_valid, _GEN_11, data_1) @[SCIEPipelined.scala 24:17 21:21]
    node _GEN_17 = mux(io_valid, _GEN_12, data_0) @[SCIEPipelined.scala 24:17 21:21]
    node _coeffs_WIRE = UInt<32>("h0") @[SCIEPipelined.scala 20:{76,76}]
    node _coeffs_WIRE_1 = UInt<32>("h0") @[SCIEPipelined.scala 20:{76,76}]
    node _coeffs_WIRE_2_0 = _coeffs_WIRE @[SCIEPipelined.scala 20:{31,31}]
    node _coeffs_WIRE_2_1 = _coeffs_WIRE_1 @[SCIEPipelined.scala 20:{31,31}]
    node _data_WIRE = UInt<32>("h0") @[SCIEPipelined.scala 21:{74,74}]
    node _data_WIRE_1 = UInt<32>("h0") @[SCIEPipelined.scala 21:{74,74}]
    node _data_WIRE_2_0 = _data_WIRE @[SCIEPipelined.scala 21:{29,29}]
    node _data_WIRE_2_1 = _data_WIRE_1 @[SCIEPipelined.scala 21:{29,29}]
    node _result_WIRE = UInt<32>("h0") @[SCIEPipelined.scala 22:{52,52}]
    io_rd <= bits(result, 31, 0) @[SCIEPipelined.scala 36:9]
    coeffs_0 <= mux(reset, _coeffs_WIRE_2_0, _GEN_13) @[SCIEPipelined.scala 20:{23,23}]
    coeffs_1 <= mux(reset, _coeffs_WIRE_2_1, _GEN_14) @[SCIEPipelined.scala 20:{23,23}]
    data_0 <= mux(reset, _data_WIRE_2_0, _GEN_17) @[SCIEPipelined.scala 21:{21,21}]
    data_1 <= mux(reset, _data_WIRE_2_1, _GEN_16) @[SCIEPipelined.scala 21:{21,21}]
    result <= mux(reset, _result_WIRE, _GEN_15) @[SCIEPipelined.scala 22:{23,23}]
