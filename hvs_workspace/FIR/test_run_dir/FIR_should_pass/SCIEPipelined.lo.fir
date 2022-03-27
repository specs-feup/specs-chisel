circuit SCIEPipelined :
  module SCIEPipelined :
    input clock : Clock
    input reset : UInt<1>
    input io_valid : UInt<1>
    input io_insn : UInt<32>
    input io_rs1 : UInt<32>
    input io_rs2 : UInt<32>
    output io_rd : UInt<32>
    output io_out_valid : UInt<1>
    input io_recv_signal : UInt<1>
    input io_exec_signal : UInt<1>

    reg coeffs_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_0) @[FIR.scala 58:23]
    reg coeffs_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_1) @[FIR.scala 58:23]
    reg coeffs_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_2) @[FIR.scala 58:23]
    reg coeffs_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_3) @[FIR.scala 58:23]
    reg taps_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), taps_0) @[FIR.scala 59:21]
    reg taps_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), taps_1) @[FIR.scala 59:21]
    reg taps_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), taps_2) @[FIR.scala 59:21]
    reg taps_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), taps_3) @[FIR.scala 59:21]
    reg coeff_count : UInt<5>, clock with :
      reset => (UInt<1>("h0"), coeff_count) @[FIR.scala 60:28]
    reg result : UInt<32>, clock with :
      reset => (UInt<1>("h0"), result) @[FIR.scala 61:23]
    node _T = lt(coeff_count, UInt<3>("h4")) @[FIR.scala 66:24]
    node _T_1 = bits(coeff_count, 1, 0)
    node _coeffs_T_1 = io_rs1 @[FIR.scala 67:{29,29}]
    node _GEN_0 = mux(eq(UInt<1>("h0"), _T_1), _coeffs_T_1, coeffs_0) @[FIR.scala 58:23 67:{29,29}]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _T_1), _coeffs_T_1, coeffs_1) @[FIR.scala 58:23 67:{29,29}]
    node _GEN_2 = mux(eq(UInt<2>("h2"), _T_1), _coeffs_T_1, coeffs_2) @[FIR.scala 58:23 67:{29,29}]
    node _GEN_3 = mux(eq(UInt<2>("h3"), _T_1), _coeffs_T_1, coeffs_3) @[FIR.scala 58:23 67:{29,29}]
    node _coeff_count_T = add(coeff_count, UInt<1>("h1")) @[FIR.scala 68:36]
    node _coeff_count_T_1 = tail(_coeff_count_T, 1) @[FIR.scala 68:36]
    node _GEN_4 = mux(_T, _GEN_0, coeffs_0) @[FIR.scala 58:23 66:31]
    node _GEN_5 = mux(_T, _GEN_1, coeffs_1) @[FIR.scala 58:23 66:31]
    node _GEN_6 = mux(_T, _GEN_2, coeffs_2) @[FIR.scala 58:23 66:31]
    node _GEN_7 = mux(_T, _GEN_3, coeffs_3) @[FIR.scala 58:23 66:31]
    node _GEN_8 = mux(_T, _coeff_count_T_1, coeff_count) @[FIR.scala 66:31 68:21 60:28]
    node _GEN_9 = mux(_T, taps_1, taps_0) @[FIR.scala 59:21 66:31 70:56]
    node _GEN_10 = mux(_T, taps_2, taps_1) @[FIR.scala 59:21 66:31 70:56]
    node _GEN_11 = mux(_T, taps_3, taps_2) @[FIR.scala 59:21 66:31 70:56]
    node _GEN_12 = mux(_T, taps_0, io_rs1) @[FIR.scala 59:21 66:31 71:17]
    node _result_T = mul(taps_0, coeffs_0) @[FIR.scala 75:57]
    node _result_T_1 = mul(taps_1, coeffs_1) @[FIR.scala 75:57]
    node _result_T_2 = mul(taps_2, coeffs_2) @[FIR.scala 75:57]
    node _result_T_3 = mul(taps_3, coeffs_3) @[FIR.scala 75:57]
    node _result_T_4 = add(_result_T, _result_T_1) @[FIR.scala 75:72]
    node _result_T_5 = tail(_result_T_4, 1) @[FIR.scala 75:72]
    node _result_T_6 = add(_result_T_5, _result_T_2) @[FIR.scala 75:72]
    node _result_T_7 = tail(_result_T_6, 1) @[FIR.scala 75:72]
    node _result_T_8 = add(_result_T_7, _result_T_3) @[FIR.scala 75:72]
    node _result_T_9 = tail(_result_T_8, 1) @[FIR.scala 75:72]
    node _GEN_13 = mux(io_exec_signal, _result_T_9, UInt<1>("h0")) @[FIR.scala 64:12 74:32 75:14]
    node _GEN_14 = mux(io_recv_signal, _GEN_4, coeffs_0) @[FIR.scala 58:23 65:26]
    node _GEN_15 = mux(io_recv_signal, _GEN_5, coeffs_1) @[FIR.scala 58:23 65:26]
    node _GEN_16 = mux(io_recv_signal, _GEN_6, coeffs_2) @[FIR.scala 58:23 65:26]
    node _GEN_17 = mux(io_recv_signal, _GEN_7, coeffs_3) @[FIR.scala 58:23 65:26]
    node _GEN_18 = mux(io_recv_signal, _GEN_8, coeff_count) @[FIR.scala 65:26 60:28]
    node _GEN_19 = mux(io_recv_signal, _GEN_9, taps_1) @[FIR.scala 59:21 65:26]
    node _GEN_20 = mux(io_recv_signal, _GEN_10, taps_2) @[FIR.scala 59:21 65:26]
    node _GEN_21 = mux(io_recv_signal, _GEN_11, taps_3) @[FIR.scala 59:21 65:26]
    node _GEN_22 = mux(io_recv_signal, _GEN_12, taps_0) @[FIR.scala 59:21 65:26]
    node _GEN_23 = mux(io_recv_signal, UInt<1>("h1"), _GEN_13) @[FIR.scala 65:26 73:14]
    node _GEN_24 = mux(io_valid, _GEN_23, result) @[FIR.scala 63:18 61:23]
    node _GEN_25 = mux(io_valid, _GEN_14, coeffs_0) @[FIR.scala 63:18 58:23]
    node _GEN_26 = mux(io_valid, _GEN_15, coeffs_1) @[FIR.scala 63:18 58:23]
    node _GEN_27 = mux(io_valid, _GEN_16, coeffs_2) @[FIR.scala 63:18 58:23]
    node _GEN_28 = mux(io_valid, _GEN_17, coeffs_3) @[FIR.scala 63:18 58:23]
    node _GEN_29 = mux(io_valid, _GEN_18, coeff_count) @[FIR.scala 63:18 60:28]
    node _GEN_30 = mux(io_valid, _GEN_19, taps_1) @[FIR.scala 63:18 59:21]
    node _GEN_31 = mux(io_valid, _GEN_20, taps_2) @[FIR.scala 63:18 59:21]
    node _GEN_32 = mux(io_valid, _GEN_21, taps_3) @[FIR.scala 63:18 59:21]
    node _GEN_33 = mux(io_valid, _GEN_22, taps_0) @[FIR.scala 63:18 59:21]
    node _io_out_valid_T = neq(result, UInt<1>("h0")) @[FIR.scala 81:30]
    node _io_out_valid_T_1 = mux(_io_out_valid_T, UInt<1>("h1"), UInt<1>("h0")) @[FIR.scala 81:22]
    node _coeffs_WIRE_0 = UInt<32>("h0") @[FIR.scala 58:{31,31}]
    node _coeffs_WIRE_1 = UInt<32>("h0") @[FIR.scala 58:{31,31}]
    node _coeffs_WIRE_2 = UInt<32>("h0") @[FIR.scala 58:{31,31}]
    node _coeffs_WIRE_3 = UInt<32>("h0") @[FIR.scala 58:{31,31}]
    node _taps_WIRE_0 = UInt<32>("h0") @[FIR.scala 59:{29,29}]
    node _taps_WIRE_1 = UInt<32>("h0") @[FIR.scala 59:{29,29}]
    node _taps_WIRE_2 = UInt<32>("h0") @[FIR.scala 59:{29,29}]
    node _taps_WIRE_3 = UInt<32>("h0") @[FIR.scala 59:{29,29}]
    io_rd <= result @[FIR.scala 80:9]
    io_out_valid <= _io_out_valid_T_1 @[FIR.scala 81:16]
    coeffs_0 <= mux(reset, _coeffs_WIRE_0, _GEN_25) @[FIR.scala 58:{23,23}]
    coeffs_1 <= mux(reset, _coeffs_WIRE_1, _GEN_26) @[FIR.scala 58:{23,23}]
    coeffs_2 <= mux(reset, _coeffs_WIRE_2, _GEN_27) @[FIR.scala 58:{23,23}]
    coeffs_3 <= mux(reset, _coeffs_WIRE_3, _GEN_28) @[FIR.scala 58:{23,23}]
    taps_0 <= mux(reset, _taps_WIRE_0, _GEN_33) @[FIR.scala 59:{21,21}]
    taps_1 <= mux(reset, _taps_WIRE_1, _GEN_30) @[FIR.scala 59:{21,21}]
    taps_2 <= mux(reset, _taps_WIRE_2, _GEN_31) @[FIR.scala 59:{21,21}]
    taps_3 <= mux(reset, _taps_WIRE_3, _GEN_32) @[FIR.scala 59:{21,21}]
    coeff_count <= mux(reset, UInt<5>("h0"), _GEN_29) @[FIR.scala 60:{28,28}]
    result <= bits(mux(reset, UInt<32>("h0"), _GEN_24), 31, 0) @[FIR.scala 61:{23,23}]
