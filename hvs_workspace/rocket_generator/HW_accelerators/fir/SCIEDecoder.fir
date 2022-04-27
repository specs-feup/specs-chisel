circuit SCIEDecoder :
  module SCIEDecoder :
    output io : { flip insn : UInt<32>, unpipelined : UInt<1>, pipelined : UInt<1>, multicycle : UInt<1>}

    node _io_pipelined_T = bits(io.insn, 6, 0) @[SCIEDecoder.scala 16:26]
    node _io_pipelined_T_1 = eq(_io_pipelined_T, UInt<4>("hb")) @[SCIEDecoder.scala 16:32]
    node _io_pipelined_T_2 = bits(io.insn, 6, 0) @[SCIEDecoder.scala 16:59]
    node _io_pipelined_T_3 = eq(_io_pipelined_T_2, UInt<6>("h2b")) @[SCIEDecoder.scala 16:65]
    node _io_pipelined_T_4 = or(_io_pipelined_T_1, _io_pipelined_T_3) @[SCIEDecoder.scala 16:49]
    node _io_pipelined_T_5 = bits(io.insn, 6, 0) @[SCIEDecoder.scala 16:93]
    node _io_pipelined_T_6 = eq(_io_pipelined_T_5, UInt<7>("h5b")) @[SCIEDecoder.scala 16:99]
    node _io_pipelined_T_7 = or(_io_pipelined_T_4, _io_pipelined_T_6) @[SCIEDecoder.scala 16:83]
    io.pipelined <= _io_pipelined_T_7 @[SCIEDecoder.scala 16:16]
    io.unpipelined <= UInt<1>("h0") @[SCIEDecoder.scala 17:18]
    io.multicycle <= UInt<1>("h0") @[SCIEDecoder.scala 18:17]

