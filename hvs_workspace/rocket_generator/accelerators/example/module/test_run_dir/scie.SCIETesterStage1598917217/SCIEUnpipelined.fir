circuit SCIEUnpipelined :
  module SCIEUnpipelined :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip insn : UInt<32>, flip rs1 : SInt<32>, flip rs2 : UInt<32>, rd : SInt<32>}

    wire _io_rd_WIRE : SInt<32> @[SCIEUnpipelined.scala 19:45]
    node _io_rd_T = asUInt(io.rs1) @[SCIEUnpipelined.scala 19:45]
    node _io_rd_T_1 = asSInt(_io_rd_T) @[SCIEUnpipelined.scala 19:45]
    _io_rd_WIRE <= _io_rd_T_1 @[SCIEUnpipelined.scala 19:45]
    wire _io_rd_WIRE_1 : SInt<32> @[SCIEUnpipelined.scala 19:76]
    node _io_rd_T_2 = asSInt(UInt<1>("h0")) @[SCIEUnpipelined.scala 19:76]
    _io_rd_WIRE_1 <= _io_rd_T_2 @[SCIEUnpipelined.scala 19:76]
    node _io_rd_T_3 = gt(_io_rd_WIRE, _io_rd_WIRE_1) @[SIntTypeClass.scala 60:47]
    wire _io_rd_WIRE_2 : SInt<32> @[SCIEUnpipelined.scala 19:112]
    node _io_rd_T_4 = asUInt(io.rs1) @[SCIEUnpipelined.scala 19:112]
    node _io_rd_T_5 = asSInt(_io_rd_T_4) @[SCIEUnpipelined.scala 19:112]
    _io_rd_WIRE_2 <= _io_rd_T_5 @[SCIEUnpipelined.scala 19:112]
    wire _io_rd_WIRE_3 : SInt<32> @[SCIEUnpipelined.scala 19:143]
    node _io_rd_T_6 = asSInt(UInt<1>("h0")) @[SCIEUnpipelined.scala 19:143]
    _io_rd_WIRE_3 <= _io_rd_T_6 @[SCIEUnpipelined.scala 19:143]
    node _io_rd_T_7 = mux(_io_rd_T_3, _io_rd_WIRE_2, _io_rd_WIRE_3) @[SCIEUnpipelined.scala 19:15]
    io.rd <= _io_rd_T_7 @[SCIEUnpipelined.scala 19:9]

