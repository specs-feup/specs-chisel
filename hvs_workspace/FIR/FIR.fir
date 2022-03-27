circuit FIR :
  module FIR :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip data : UInt<32>, flip recv_signal : UInt<1>, flip exec_signal : UInt<1>, out : UInt<32>}

    wire _coeffs_WIRE : UInt<32>[4] @[FIR.scala 22:31]
    _coeffs_WIRE[0] <= UInt<32>("h0") @[FIR.scala 22:31]
    _coeffs_WIRE[1] <= UInt<32>("h0") @[FIR.scala 22:31]
    _coeffs_WIRE[2] <= UInt<32>("h0") @[FIR.scala 22:31]
    _coeffs_WIRE[3] <= UInt<32>("h0") @[FIR.scala 22:31]
    reg coeffs : UInt<32>[4], clock with :
      reset => (reset, _coeffs_WIRE) @[FIR.scala 22:23]
    wire _taps_WIRE : UInt<32>[4] @[FIR.scala 23:29]
    _taps_WIRE[0] <= UInt<32>("h0") @[FIR.scala 23:29]
    _taps_WIRE[1] <= UInt<32>("h0") @[FIR.scala 23:29]
    _taps_WIRE[2] <= UInt<32>("h0") @[FIR.scala 23:29]
    _taps_WIRE[3] <= UInt<32>("h0") @[FIR.scala 23:29]
    reg taps : UInt<32>[4], clock with :
      reset => (reset, _taps_WIRE) @[FIR.scala 23:21]
    reg coeff_count : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[FIR.scala 24:28]
    reg result : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[FIR.scala 25:23]
    when io.recv_signal : @[FIR.scala 27:23]
      node _T = lt(coeff_count, UInt<3>("h4")) @[FIR.scala 28:22]
      when _T : @[FIR.scala 28:33]
        node _T_1 = bits(coeff_count, 1, 0)
        coeffs[_T_1] <= io.data @[FIR.scala 29:27]
        node _coeff_count_T = add(coeff_count, UInt<1>("h1")) @[FIR.scala 30:34]
        node _coeff_count_T_1 = tail(_coeff_count_T, 1) @[FIR.scala 30:34]
        coeff_count <= _coeff_count_T_1 @[FIR.scala 30:19]
      else :
        taps[1] <= taps[0] @[FIR.scala 32:52]
        taps[2] <= taps[1] @[FIR.scala 32:52]
        taps[3] <= taps[2] @[FIR.scala 32:52]
        taps[0] <= io.data @[FIR.scala 33:15]
      result <= UInt<1>("h1") @[FIR.scala 35:12]
    else :
      when io.exec_signal : @[FIR.scala 36:29]
        node _result_T = mul(taps[0], coeffs[0]) @[FIR.scala 37:55]
        node _result_T_1 = mul(taps[1], coeffs[1]) @[FIR.scala 37:55]
        node _result_T_2 = mul(taps[2], coeffs[2]) @[FIR.scala 37:55]
        node _result_T_3 = mul(taps[3], coeffs[3]) @[FIR.scala 37:55]
        node _result_T_4 = add(_result_T, _result_T_1) @[FIR.scala 37:70]
        node _result_T_5 = tail(_result_T_4, 1) @[FIR.scala 37:70]
        node _result_T_6 = add(_result_T_5, _result_T_2) @[FIR.scala 37:70]
        node _result_T_7 = tail(_result_T_6, 1) @[FIR.scala 37:70]
        node _result_T_8 = add(_result_T_7, _result_T_3) @[FIR.scala 37:70]
        node _result_T_9 = tail(_result_T_8, 1) @[FIR.scala 37:70]
        result <= _result_T_9 @[FIR.scala 37:12]
    io.out <= result @[FIR.scala 40:10]

