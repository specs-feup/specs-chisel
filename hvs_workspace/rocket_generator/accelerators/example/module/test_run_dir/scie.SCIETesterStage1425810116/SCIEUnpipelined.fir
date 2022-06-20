circuit SCIEUnpipelined :
  module SCIEUnpipelined :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip insn : UInt<32>, flip rs1 : Fixed<32><<8>>, flip rs2 : UInt<32>, rd : Fixed<32><<8>>}

    wire _io_rd_WIRE : Fixed<32><<8>> @[SCIEUnpipelined.scala 19:45]
    node _io_rd_T = asUInt(io.rs1) @[SCIEUnpipelined.scala 19:45]
    node _io_rd_T_1 = asFixedPoint(_io_rd_T, 8) @[SCIEUnpipelined.scala 19:45]
    _io_rd_WIRE <= _io_rd_T_1 @[SCIEUnpipelined.scala 19:45]
    wire _io_rd_WIRE_1 : Fixed<32><<8>> @[SCIEUnpipelined.scala 19:76]
    node _io_rd_T_2 = asFixedPoint(UInt<1>("h0"), 8) @[SCIEUnpipelined.scala 19:76]
    _io_rd_WIRE_1 <= _io_rd_T_2 @[SCIEUnpipelined.scala 19:76]
    node _io_rd_T_3 = gt(_io_rd_WIRE, _io_rd_WIRE_1) @[FixedPointTypeClass.scala 56:59]
    wire _io_rd_WIRE_2 : Fixed<32><<8>> @[SCIEUnpipelined.scala 19:112]
    node _io_rd_T_4 = asUInt(io.rs1) @[SCIEUnpipelined.scala 19:112]
    node _io_rd_T_5 = asFixedPoint(_io_rd_T_4, 8) @[SCIEUnpipelined.scala 19:112]
    _io_rd_WIRE_2 <= _io_rd_T_5 @[SCIEUnpipelined.scala 19:112]
    wire _io_rd_WIRE_3 : Fixed<32><<8>> @[SCIEUnpipelined.scala 19:143]
    node _io_rd_T_6 = asFixedPoint(UInt<1>("h0"), 8) @[SCIEUnpipelined.scala 19:143]
    _io_rd_WIRE_3 <= _io_rd_T_6 @[SCIEUnpipelined.scala 19:143]
    node _io_rd_T_7 = mux(_io_rd_T_3, _io_rd_WIRE_2, _io_rd_WIRE_3) @[SCIEUnpipelined.scala 19:15]
    io.rd <= _io_rd_T_7 @[SCIEUnpipelined.scala 19:9]

