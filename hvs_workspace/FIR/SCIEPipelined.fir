circuit SCIEPipelined :
  module SCIEPipelined :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip valid : UInt<1>, flip insn : UInt<32>, flip rs1 : UInt<32>, flip rs2 : UInt<32>, rd : UInt<32>, out_valid : UInt<1>, flip recv_signal : UInt<1>, flip exec_signal : UInt<1>}

    wire _coeffs_WIRE : UInt<32>[4] @[FIR.scala 58:31]
    _coeffs_WIRE[0] <= UInt<32>("h0") @[FIR.scala 58:31]
    _coeffs_WIRE[1] <= UInt<32>("h0") @[FIR.scala 58:31]
    _coeffs_WIRE[2] <= UInt<32>("h0") @[FIR.scala 58:31]
    _coeffs_WIRE[3] <= UInt<32>("h0") @[FIR.scala 58:31]
    reg coeffs : UInt<32>[4], clock with :
      reset => (reset, _coeffs_WIRE) @[FIR.scala 58:23]
    wire _taps_WIRE : UInt<32>[4] @[FIR.scala 59:29]
    _taps_WIRE[0] <= UInt<32>("h0") @[FIR.scala 59:29]
    _taps_WIRE[1] <= UInt<32>("h0") @[FIR.scala 59:29]
    _taps_WIRE[2] <= UInt<32>("h0") @[FIR.scala 59:29]
    _taps_WIRE[3] <= UInt<32>("h0") @[FIR.scala 59:29]
    reg taps : UInt<32>[4], clock with :
      reset => (reset, _taps_WIRE) @[FIR.scala 59:21]
    reg coeff_count : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[FIR.scala 60:28]
    reg result : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[FIR.scala 61:23]
    when io.valid : @[FIR.scala 63:18]
      result <= UInt<1>("h0") @[FIR.scala 64:12]
      when io.recv_signal : @[FIR.scala 65:26]
        node _T = lt(coeff_count, UInt<3>("h4")) @[FIR.scala 66:24]
        when _T : @[FIR.scala 66:31]
          node _T_1 = bits(coeff_count, 1, 0)
          coeffs[_T_1] <= io.rs1 @[FIR.scala 67:29]
          node _coeff_count_T = add(coeff_count, UInt<1>("h1")) @[FIR.scala 68:36]
          node _coeff_count_T_1 = tail(_coeff_count_T, 1) @[FIR.scala 68:36]
          coeff_count <= _coeff_count_T_1 @[FIR.scala 68:21]
        else :
          taps[1] <= taps[0] @[FIR.scala 70:56]
          taps[2] <= taps[1] @[FIR.scala 70:56]
          taps[3] <= taps[2] @[FIR.scala 70:56]
          taps[0] <= io.rs1 @[FIR.scala 71:17]
        result <= UInt<1>("h1") @[FIR.scala 73:14]
      else :
        when io.exec_signal : @[FIR.scala 74:32]
          node _result_T = mul(taps[0], coeffs[0]) @[FIR.scala 75:57]
          node _result_T_1 = mul(taps[1], coeffs[1]) @[FIR.scala 75:57]
          node _result_T_2 = mul(taps[2], coeffs[2]) @[FIR.scala 75:57]
          node _result_T_3 = mul(taps[3], coeffs[3]) @[FIR.scala 75:57]
          node _result_T_4 = add(_result_T, _result_T_1) @[FIR.scala 75:72]
          node _result_T_5 = tail(_result_T_4, 1) @[FIR.scala 75:72]
          node _result_T_6 = add(_result_T_5, _result_T_2) @[FIR.scala 75:72]
          node _result_T_7 = tail(_result_T_6, 1) @[FIR.scala 75:72]
          node _result_T_8 = add(_result_T_7, _result_T_3) @[FIR.scala 75:72]
          node _result_T_9 = tail(_result_T_8, 1) @[FIR.scala 75:72]
          result <= _result_T_9 @[FIR.scala 75:14]
    io.rd <= result @[FIR.scala 79:9]
    node _io_out_valid_T = neq(result, UInt<1>("h0")) @[FIR.scala 80:30]
    node _io_out_valid_T_1 = mux(_io_out_valid_T, UInt<1>("h1"), UInt<1>("h0")) @[FIR.scala 80:22]
    io.out_valid <= _io_out_valid_T_1 @[FIR.scala 80:16]

