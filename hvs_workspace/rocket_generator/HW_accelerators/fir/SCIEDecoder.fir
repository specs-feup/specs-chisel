circuit SCIEDecoder :
  module SCIEDecoder :
    output io : { flip insn : UInt<32>, unpipelined : UInt<1>, pipelined : UInt<1>, multicycle : UInt<1>}

    node _io_pipelined_T = bits(io.insn, 6, 0) @[SCIEDecoder.scala 15:26]
    node _io_pipelined_T_1 = eq(_io_pipelined_T, UInt<4>("hb")) @[SCIEDecoder.scala 15:32]
    node _io_pipelined_T_2 = bits(io.insn, 6, 0) @[SCIEDecoder.scala 15:54]
    node _io_pipelined_T_3 = eq(_io_pipelined_T_2, UInt<6>("h2b")) @[SCIEDecoder.scala 15:60]
    node _io_pipelined_T_4 = or(_io_pipelined_T_1, _io_pipelined_T_3) @[SCIEDecoder.scala 15:44]
    node _io_pipelined_T_5 = bits(io.insn, 6, 0) @[SCIEDecoder.scala 15:83]
    node _io_pipelined_T_6 = eq(_io_pipelined_T_5, UInt<6>("h3b")) @[SCIEDecoder.scala 15:89]
    node _io_pipelined_T_7 = or(_io_pipelined_T_4, _io_pipelined_T_6) @[SCIEDecoder.scala 15:73]
    io.pipelined <= _io_pipelined_T_7 @[SCIEDecoder.scala 15:16]
    io.unpipelined <= UInt<1>("h0") @[SCIEDecoder.scala 16:18]
    io.multicycle <= UInt<1>("h0") @[SCIEDecoder.scala 17:17]

