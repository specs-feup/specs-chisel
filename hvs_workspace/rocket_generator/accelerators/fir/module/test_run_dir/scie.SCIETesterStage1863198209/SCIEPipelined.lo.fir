circuit SCIEPipelined :
  extmodule BBFMultiply :
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    defname = BBFMultiply

  extmodule BBFAdd :
    input in1 : UInt<64>
    input in2 : UInt<64>
    output out : UInt<64>
    defname = BBFAdd

  module SCIEPipelined :
    input clock : Clock
    input reset : UInt<1>
    input io_valid : UInt<1>
    input io_insn : UInt<32>
    input io_rs1_node : UInt<64>
    input io_rs2 : UInt<32>
    output io_rd_node : UInt<64>

    inst result_blackbox of BBFMultiply @[DspReal.scala 49:36]
    inst result_blackbox_1 of BBFMultiply @[DspReal.scala 49:36]
    inst result_blackbox_2 of BBFMultiply @[DspReal.scala 49:36]
    inst result_blackbox_3 of BBFMultiply @[DspReal.scala 49:36]
    inst result_blackbox_4 of BBFMultiply @[DspReal.scala 49:36]
    inst result_blackbox_5 of BBFAdd @[DspReal.scala 41:36]
    inst result_blackbox_6 of BBFAdd @[DspReal.scala 41:36]
    inst result_blackbox_7 of BBFAdd @[DspReal.scala 41:36]
    inst result_blackbox_8 of BBFAdd @[DspReal.scala 41:36]
    reg coeffs_0_node : UInt<64>, clock with :
      reset => (UInt<1>("h0"), coeffs_0_node) @[SCIEPipelined.scala 20:23]
    reg coeffs_1_node : UInt<64>, clock with :
      reset => (UInt<1>("h0"), coeffs_1_node) @[SCIEPipelined.scala 20:23]
    reg coeffs_2_node : UInt<64>, clock with :
      reset => (UInt<1>("h0"), coeffs_2_node) @[SCIEPipelined.scala 20:23]
    reg coeffs_3_node : UInt<64>, clock with :
      reset => (UInt<1>("h0"), coeffs_3_node) @[SCIEPipelined.scala 20:23]
    reg coeffs_4_node : UInt<64>, clock with :
      reset => (UInt<1>("h0"), coeffs_4_node) @[SCIEPipelined.scala 20:23]
    reg data_0_node : UInt<64>, clock with :
      reset => (UInt<1>("h0"), data_0_node) @[SCIEPipelined.scala 21:21]
    reg data_1_node : UInt<64>, clock with :
      reset => (UInt<1>("h0"), data_1_node) @[SCIEPipelined.scala 21:21]
    reg data_2_node : UInt<64>, clock with :
      reset => (UInt<1>("h0"), data_2_node) @[SCIEPipelined.scala 21:21]
    reg data_3_node : UInt<64>, clock with :
      reset => (UInt<1>("h0"), data_3_node) @[SCIEPipelined.scala 21:21]
    reg data_4_node : UInt<64>, clock with :
      reset => (UInt<1>("h0"), data_4_node) @[SCIEPipelined.scala 21:21]
    reg result_node : UInt<64>, clock with :
      reset => (UInt<1>("h0"), result_node) @[SCIEPipelined.scala 22:23]
    node _T = bits(io_insn, 6, 0) @[SCIEPipelined.scala 25:17]
    node _T_1 = eq(_T, UInt<4>("hb")) @[SCIEPipelined.scala 25:24]
    node _T_2 = bits(io_rs2, 2, 0)
    node _coeffs_T_2_node = io_rs1_node @[SCIEPipelined.scala 26:{22,22}]
    node _GEN_0 = mux(eq(UInt<1>("h0"), _T_2), _coeffs_T_2_node, coeffs_0_node) @[SCIEPipelined.scala 26:{22,22} 20:23]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _T_2), _coeffs_T_2_node, coeffs_1_node) @[SCIEPipelined.scala 26:{22,22} 20:23]
    node _GEN_2 = mux(eq(UInt<2>("h2"), _T_2), _coeffs_T_2_node, coeffs_2_node) @[SCIEPipelined.scala 26:{22,22} 20:23]
    node _GEN_3 = mux(eq(UInt<2>("h3"), _T_2), _coeffs_T_2_node, coeffs_3_node) @[SCIEPipelined.scala 26:{22,22} 20:23]
    node _GEN_4 = mux(eq(UInt<3>("h4"), _T_2), _coeffs_T_2_node, coeffs_4_node) @[SCIEPipelined.scala 26:{22,22} 20:23]
    node _T_3 = bits(io_insn, 6, 0) @[SCIEPipelined.scala 27:23]
    node _T_4 = eq(_T_3, UInt<6>("h2b")) @[SCIEPipelined.scala 27:30]
    node _T_5 = bits(io_insn, 6, 0) @[SCIEPipelined.scala 30:23]
    node _T_6 = eq(_T_5, UInt<7>("h5b")) @[SCIEPipelined.scala 30:30]
    node result_out_8_node = result_blackbox_8.out @[DspReal.scala 26:19 27:14]
    node _GEN_5 = mux(_T_6, result_out_8_node, result_node) @[SCIEPipelined.scala 30:48 31:14 22:23]
    node _GEN_6 = mux(_T_4, data_0_node, data_1_node) @[SCIEPipelined.scala 21:21 27:48 28:54]
    node _GEN_7 = mux(_T_4, data_1_node, data_2_node) @[SCIEPipelined.scala 21:21 27:48 28:54]
    node _GEN_8 = mux(_T_4, data_2_node, data_3_node) @[SCIEPipelined.scala 21:21 27:48 28:54]
    node _GEN_9 = mux(_T_4, data_3_node, data_4_node) @[SCIEPipelined.scala 21:21 27:48 28:54]
    node _GEN_10 = mux(_T_4, io_rs1_node, data_0_node) @[SCIEPipelined.scala 27:48 29:15 21:21]
    node _GEN_11 = mux(_T_4, result_node, _GEN_5) @[SCIEPipelined.scala 22:23 27:48]
    node _GEN_12 = mux(_T_1, _GEN_0, coeffs_0_node) @[SCIEPipelined.scala 20:23 25:42]
    node _GEN_13 = mux(_T_1, _GEN_1, coeffs_1_node) @[SCIEPipelined.scala 20:23 25:42]
    node _GEN_14 = mux(_T_1, _GEN_2, coeffs_2_node) @[SCIEPipelined.scala 20:23 25:42]
    node _GEN_15 = mux(_T_1, _GEN_3, coeffs_3_node) @[SCIEPipelined.scala 20:23 25:42]
    node _GEN_16 = mux(_T_1, _GEN_4, coeffs_4_node) @[SCIEPipelined.scala 20:23 25:42]
    node _GEN_17 = mux(_T_1, data_1_node, _GEN_6) @[SCIEPipelined.scala 21:21 25:42]
    node _GEN_18 = mux(_T_1, data_2_node, _GEN_7) @[SCIEPipelined.scala 21:21 25:42]
    node _GEN_19 = mux(_T_1, data_3_node, _GEN_8) @[SCIEPipelined.scala 21:21 25:42]
    node _GEN_20 = mux(_T_1, data_4_node, _GEN_9) @[SCIEPipelined.scala 21:21 25:42]
    node _GEN_21 = mux(_T_1, data_0_node, _GEN_10) @[SCIEPipelined.scala 21:21 25:42]
    node _GEN_22 = mux(_T_1, result_node, _GEN_11) @[SCIEPipelined.scala 22:23 25:42]
    node _GEN_23 = mux(io_valid, _GEN_12, coeffs_0_node) @[SCIEPipelined.scala 24:17 20:23]
    node _GEN_24 = mux(io_valid, _GEN_13, coeffs_1_node) @[SCIEPipelined.scala 24:17 20:23]
    node _GEN_25 = mux(io_valid, _GEN_14, coeffs_2_node) @[SCIEPipelined.scala 24:17 20:23]
    node _GEN_26 = mux(io_valid, _GEN_15, coeffs_3_node) @[SCIEPipelined.scala 24:17 20:23]
    node _GEN_27 = mux(io_valid, _GEN_16, coeffs_4_node) @[SCIEPipelined.scala 24:17 20:23]
    node _GEN_28 = mux(io_valid, _GEN_17, data_1_node) @[SCIEPipelined.scala 24:17 21:21]
    node _GEN_29 = mux(io_valid, _GEN_18, data_2_node) @[SCIEPipelined.scala 24:17 21:21]
    node _GEN_30 = mux(io_valid, _GEN_19, data_3_node) @[SCIEPipelined.scala 24:17 21:21]
    node _GEN_31 = mux(io_valid, _GEN_20, data_4_node) @[SCIEPipelined.scala 24:17 21:21]
    node _GEN_32 = mux(io_valid, _GEN_21, data_0_node) @[SCIEPipelined.scala 24:17 21:21]
    node _GEN_33 = mux(io_valid, _GEN_22, result_node) @[SCIEPipelined.scala 24:17 22:23]
    node _coeffs_WIRE_node = UInt<64>("h0") @[SCIEPipelined.scala 20:{76,76}]
    node _coeffs_WIRE_1_node = UInt<64>("h0") @[SCIEPipelined.scala 20:{76,76}]
    node _coeffs_WIRE_2_node = UInt<64>("h0") @[SCIEPipelined.scala 20:{76,76}]
    node _coeffs_WIRE_3_node = UInt<64>("h0") @[SCIEPipelined.scala 20:{76,76}]
    node _coeffs_WIRE_4_node = UInt<64>("h0") @[SCIEPipelined.scala 20:{76,76}]
    node _coeffs_WIRE_5_0_node = _coeffs_WIRE_node @[SCIEPipelined.scala 20:{31,31}]
    node _coeffs_WIRE_5_1_node = _coeffs_WIRE_1_node @[SCIEPipelined.scala 20:{31,31}]
    node _coeffs_WIRE_5_2_node = _coeffs_WIRE_2_node @[SCIEPipelined.scala 20:{31,31}]
    node _coeffs_WIRE_5_3_node = _coeffs_WIRE_3_node @[SCIEPipelined.scala 20:{31,31}]
    node _coeffs_WIRE_5_4_node = _coeffs_WIRE_4_node @[SCIEPipelined.scala 20:{31,31}]
    node _data_WIRE_node = UInt<64>("h0") @[SCIEPipelined.scala 21:{74,74}]
    node _data_WIRE_1_node = UInt<64>("h0") @[SCIEPipelined.scala 21:{74,74}]
    node _data_WIRE_2_node = UInt<64>("h0") @[SCIEPipelined.scala 21:{74,74}]
    node _data_WIRE_3_node = UInt<64>("h0") @[SCIEPipelined.scala 21:{74,74}]
    node _data_WIRE_4_node = UInt<64>("h0") @[SCIEPipelined.scala 21:{74,74}]
    node _data_WIRE_5_0_node = _data_WIRE_node @[SCIEPipelined.scala 21:{29,29}]
    node _data_WIRE_5_1_node = _data_WIRE_1_node @[SCIEPipelined.scala 21:{29,29}]
    node _data_WIRE_5_2_node = _data_WIRE_2_node @[SCIEPipelined.scala 21:{29,29}]
    node _data_WIRE_5_3_node = _data_WIRE_3_node @[SCIEPipelined.scala 21:{29,29}]
    node _data_WIRE_5_4_node = _data_WIRE_4_node @[SCIEPipelined.scala 21:{29,29}]
    node _result_WIRE_node = UInt<64>("h0") @[SCIEPipelined.scala 22:{52,52}]
    node result_out_node = result_blackbox.out @[DspReal.scala 26:19 27:14]
    node result_out_1_node = result_blackbox_1.out @[DspReal.scala 26:19 27:14]
    node result_out_2_node = result_blackbox_2.out @[DspReal.scala 26:19 27:14]
    node result_out_3_node = result_blackbox_3.out @[DspReal.scala 26:19 27:14]
    node result_out_4_node = result_blackbox_4.out @[DspReal.scala 26:19 27:14]
    node result_out_5_node = result_blackbox_5.out @[DspReal.scala 26:19 27:14]
    node result_out_6_node = result_blackbox_6.out @[DspReal.scala 26:19 27:14]
    node result_out_7_node = result_blackbox_7.out @[DspReal.scala 26:19 27:14]
    io_rd_node <= result_node @[SCIEPipelined.scala 34:9]
    coeffs_0_node <= mux(reset, _coeffs_WIRE_5_0_node, _GEN_23) @[SCIEPipelined.scala 20:{23,23}]
    coeffs_1_node <= mux(reset, _coeffs_WIRE_5_1_node, _GEN_24) @[SCIEPipelined.scala 20:{23,23}]
    coeffs_2_node <= mux(reset, _coeffs_WIRE_5_2_node, _GEN_25) @[SCIEPipelined.scala 20:{23,23}]
    coeffs_3_node <= mux(reset, _coeffs_WIRE_5_3_node, _GEN_26) @[SCIEPipelined.scala 20:{23,23}]
    coeffs_4_node <= mux(reset, _coeffs_WIRE_5_4_node, _GEN_27) @[SCIEPipelined.scala 20:{23,23}]
    data_0_node <= mux(reset, _data_WIRE_5_0_node, _GEN_32) @[SCIEPipelined.scala 21:{21,21}]
    data_1_node <= mux(reset, _data_WIRE_5_1_node, _GEN_28) @[SCIEPipelined.scala 21:{21,21}]
    data_2_node <= mux(reset, _data_WIRE_5_2_node, _GEN_29) @[SCIEPipelined.scala 21:{21,21}]
    data_3_node <= mux(reset, _data_WIRE_5_3_node, _GEN_30) @[SCIEPipelined.scala 21:{21,21}]
    data_4_node <= mux(reset, _data_WIRE_5_4_node, _GEN_31) @[SCIEPipelined.scala 21:{21,21}]
    result_node <= mux(reset, _result_WIRE_node, _GEN_33) @[SCIEPipelined.scala 22:{23,23}]
    result_blackbox.in1 <= data_0_node @[DspReal.scala 24:21]
    result_blackbox.in2 <= coeffs_0_node @[DspReal.scala 25:21]
    result_blackbox_1.in1 <= data_1_node @[DspReal.scala 24:21]
    result_blackbox_1.in2 <= coeffs_1_node @[DspReal.scala 25:21]
    result_blackbox_2.in1 <= data_2_node @[DspReal.scala 24:21]
    result_blackbox_2.in2 <= coeffs_2_node @[DspReal.scala 25:21]
    result_blackbox_3.in1 <= data_3_node @[DspReal.scala 24:21]
    result_blackbox_3.in2 <= coeffs_3_node @[DspReal.scala 25:21]
    result_blackbox_4.in1 <= data_4_node @[DspReal.scala 24:21]
    result_blackbox_4.in2 <= coeffs_4_node @[DspReal.scala 25:21]
    result_blackbox_5.in1 <= result_out_node @[DspReal.scala 24:21]
    result_blackbox_5.in2 <= result_out_1_node @[DspReal.scala 25:21]
    result_blackbox_6.in1 <= result_out_5_node @[DspReal.scala 24:21]
    result_blackbox_6.in2 <= result_out_2_node @[DspReal.scala 25:21]
    result_blackbox_7.in1 <= result_out_6_node @[DspReal.scala 24:21]
    result_blackbox_7.in2 <= result_out_3_node @[DspReal.scala 25:21]
    result_blackbox_8.in1 <= result_out_7_node @[DspReal.scala 24:21]
    result_blackbox_8.in2 <= result_out_4_node @[DspReal.scala 25:21]
