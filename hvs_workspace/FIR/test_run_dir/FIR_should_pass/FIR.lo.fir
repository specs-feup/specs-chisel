circuit FIR :
  module FIR :
    input clock : Clock
    input reset : UInt<1>
    input io_data : UInt<32>
    input io_recv_signal : UInt<1>
    input io_exec_signal : UInt<1>
    output io_out : UInt<32>
    output io_sum : UInt<32>

    reg coeffs_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_0) @[FIR.scala 19:23]
    reg coeffs_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_1) @[FIR.scala 19:23]
    reg coeffs_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_2) @[FIR.scala 19:23]
    reg coeffs_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), coeffs_3) @[FIR.scala 19:23]
    reg taps_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), taps_0) @[FIR.scala 20:21]
    reg taps_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), taps_1) @[FIR.scala 20:21]
    reg taps_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), taps_2) @[FIR.scala 20:21]
    reg taps_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), taps_3) @[FIR.scala 20:21]
    reg coeff_count : UInt<5>, clock with :
      reset => (UInt<1>("h0"), coeff_count) @[FIR.scala 21:28]
    reg result : UInt<32>, clock with :
      reset => (UInt<1>("h0"), result) @[FIR.scala 22:23]
    node _T = lt(coeff_count, UInt<3>("h4")) @[FIR.scala 25:22]
    node _T_1 = bits(coeff_count, 1, 0)
    node _coeffs_T_1 = io_data @[FIR.scala 26:{27,27}]
    node _GEN_0 = mux(eq(UInt<1>("h0"), _T_1), _coeffs_T_1, coeffs_0) @[FIR.scala 19:23 26:{27,27}]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _T_1), _coeffs_T_1, coeffs_1) @[FIR.scala 19:23 26:{27,27}]
    node _GEN_2 = mux(eq(UInt<2>("h2"), _T_1), _coeffs_T_1, coeffs_2) @[FIR.scala 19:23 26:{27,27}]
    node _GEN_3 = mux(eq(UInt<2>("h3"), _T_1), _coeffs_T_1, coeffs_3) @[FIR.scala 19:23 26:{27,27}]
    node _coeff_count_T = add(coeff_count, UInt<1>("h1")) @[FIR.scala 27:34]
    node _coeff_count_T_1 = tail(_coeff_count_T, 1) @[FIR.scala 27:34]
    node _GEN_4 = mux(_T, _GEN_0, coeffs_0) @[FIR.scala 19:23 25:33]
    node _GEN_5 = mux(_T, _GEN_1, coeffs_1) @[FIR.scala 19:23 25:33]
    node _GEN_6 = mux(_T, _GEN_2, coeffs_2) @[FIR.scala 19:23 25:33]
    node _GEN_7 = mux(_T, _GEN_3, coeffs_3) @[FIR.scala 19:23 25:33]
    node _GEN_8 = mux(_T, _coeff_count_T_1, coeff_count) @[FIR.scala 25:33 27:19 21:28]
    node _GEN_9 = mux(_T, taps_1, taps_0) @[FIR.scala 20:21 25:33 29:52]
    node _GEN_10 = mux(_T, taps_2, taps_1) @[FIR.scala 20:21 25:33 29:52]
    node _GEN_11 = mux(_T, taps_3, taps_2) @[FIR.scala 20:21 25:33 29:52]
    node _GEN_12 = mux(_T, taps_0, io_data) @[FIR.scala 20:21 25:33 30:15]
    node _result_T = mul(taps_0, coeffs_0) @[FIR.scala 33:55]
    node _result_T_1 = mul(taps_1, coeffs_1) @[FIR.scala 33:55]
    node _result_T_2 = mul(taps_2, coeffs_2) @[FIR.scala 33:55]
    node _result_T_3 = mul(taps_3, coeffs_3) @[FIR.scala 33:55]
    node _result_T_4 = add(_result_T, _result_T_1) @[FIR.scala 33:70]
    node _result_T_5 = tail(_result_T_4, 1) @[FIR.scala 33:70]
    node _result_T_6 = add(_result_T_5, _result_T_2) @[FIR.scala 33:70]
    node _result_T_7 = tail(_result_T_6, 1) @[FIR.scala 33:70]
    node _result_T_8 = add(_result_T_7, _result_T_3) @[FIR.scala 33:70]
    node _result_T_9 = tail(_result_T_8, 1) @[FIR.scala 33:70]
    node _GEN_13 = mux(io_exec_signal, _result_T_9, result) @[FIR.scala 32:29 33:12 22:23]
    node _GEN_14 = mux(io_recv_signal, _GEN_4, coeffs_0) @[FIR.scala 19:23 24:23]
    node _GEN_15 = mux(io_recv_signal, _GEN_5, coeffs_1) @[FIR.scala 19:23 24:23]
    node _GEN_16 = mux(io_recv_signal, _GEN_6, coeffs_2) @[FIR.scala 19:23 24:23]
    node _GEN_17 = mux(io_recv_signal, _GEN_7, coeffs_3) @[FIR.scala 19:23 24:23]
    node _GEN_18 = mux(io_recv_signal, _GEN_8, coeff_count) @[FIR.scala 24:23 21:28]
    node _GEN_19 = mux(io_recv_signal, _GEN_9, taps_1) @[FIR.scala 20:21 24:23]
    node _GEN_20 = mux(io_recv_signal, _GEN_10, taps_2) @[FIR.scala 20:21 24:23]
    node _GEN_21 = mux(io_recv_signal, _GEN_11, taps_3) @[FIR.scala 20:21 24:23]
    node _GEN_22 = mux(io_recv_signal, _GEN_12, taps_0) @[FIR.scala 20:21 24:23]
    node _GEN_23 = mux(io_recv_signal, result, _GEN_13) @[FIR.scala 22:23 24:23]
    node _io_sum_T = eq(coeff_count, UInt<3>("h4")) @[FIR.scala 36:29]
    node _io_sum_T_1 = add(coeffs_0, coeffs_1) @[FIR.scala 36:58]
    node _io_sum_T_2 = tail(_io_sum_T_1, 1) @[FIR.scala 36:58]
    node _io_sum_T_3 = add(_io_sum_T_2, coeffs_2) @[FIR.scala 36:58]
    node _io_sum_T_4 = tail(_io_sum_T_3, 1) @[FIR.scala 36:58]
    node _io_sum_T_5 = add(_io_sum_T_4, coeffs_3) @[FIR.scala 36:58]
    node _io_sum_T_6 = tail(_io_sum_T_5, 1) @[FIR.scala 36:58]
    node _io_sum_T_7 = mux(_io_sum_T, _io_sum_T_6, UInt<1>("h0")) @[FIR.scala 36:16]
    node _coeffs_WIRE_0 = UInt<32>("h0") @[FIR.scala 19:{31,31}]
    node _coeffs_WIRE_1 = UInt<32>("h0") @[FIR.scala 19:{31,31}]
    node _coeffs_WIRE_2 = UInt<32>("h0") @[FIR.scala 19:{31,31}]
    node _coeffs_WIRE_3 = UInt<32>("h0") @[FIR.scala 19:{31,31}]
    node _taps_WIRE_0 = UInt<32>("h0") @[FIR.scala 20:{29,29}]
    node _taps_WIRE_1 = UInt<32>("h0") @[FIR.scala 20:{29,29}]
    node _taps_WIRE_2 = UInt<32>("h0") @[FIR.scala 20:{29,29}]
    node _taps_WIRE_3 = UInt<32>("h0") @[FIR.scala 20:{29,29}]
    io_out <= result @[FIR.scala 37:10]
    io_sum <= _io_sum_T_7 @[FIR.scala 36:10]
    coeffs_0 <= mux(reset, _coeffs_WIRE_0, _GEN_14) @[FIR.scala 19:{23,23}]
    coeffs_1 <= mux(reset, _coeffs_WIRE_1, _GEN_15) @[FIR.scala 19:{23,23}]
    coeffs_2 <= mux(reset, _coeffs_WIRE_2, _GEN_16) @[FIR.scala 19:{23,23}]
    coeffs_3 <= mux(reset, _coeffs_WIRE_3, _GEN_17) @[FIR.scala 19:{23,23}]
    taps_0 <= mux(reset, _taps_WIRE_0, _GEN_22) @[FIR.scala 20:{21,21}]
    taps_1 <= mux(reset, _taps_WIRE_1, _GEN_19) @[FIR.scala 20:{21,21}]
    taps_2 <= mux(reset, _taps_WIRE_2, _GEN_20) @[FIR.scala 20:{21,21}]
    taps_3 <= mux(reset, _taps_WIRE_3, _GEN_21) @[FIR.scala 20:{21,21}]
    coeff_count <= mux(reset, UInt<5>("h0"), _GEN_18) @[FIR.scala 21:{28,28}]
    result <= bits(mux(reset, UInt<32>("h0"), _GEN_23), 31, 0) @[FIR.scala 22:{23,23}]
