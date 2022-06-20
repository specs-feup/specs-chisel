circuit SCIEUnpipelined :
  module SCIEUnpipelined :
    input clock : Clock
    input reset : UInt<1>
    input io_insn : UInt<32>
    input io_rs1 : SInt<32>
    input io_rs2 : UInt<32>
    output io_rd : SInt<32>

    node _io_rd_T = asUInt(io_rs1) @[SCIEUnpipelined.scala 19:45]
    node _io_rd_T_1 = asSInt(_io_rd_T) @[SCIEUnpipelined.scala 19:45]
    node _io_rd_T_2 = asSInt(UInt<1>("h0")) @[SCIEUnpipelined.scala 19:76]
    node _io_rd_WIRE = _io_rd_T_1 @[SCIEUnpipelined.scala 19:{45,45}]
    node _io_rd_WIRE_1 = pad(_io_rd_T_2, 32) @[SCIEUnpipelined.scala 19:{76,76}]
    node _io_rd_T_3 = gt(_io_rd_WIRE, _io_rd_WIRE_1) @[FixedPointTypeClass.scala 56:59]
    node _io_rd_T_4 = asUInt(io_rs1) @[SCIEUnpipelined.scala 19:112]
    node _io_rd_T_5 = asSInt(_io_rd_T_4) @[SCIEUnpipelined.scala 19:112]
    node _io_rd_T_6 = asSInt(UInt<1>("h0")) @[SCIEUnpipelined.scala 19:143]
    node _io_rd_WIRE_2 = _io_rd_T_5 @[SCIEUnpipelined.scala 19:{112,112}]
    node _io_rd_WIRE_3 = pad(_io_rd_T_6, 32) @[SCIEUnpipelined.scala 19:{143,143}]
    node _io_rd_T_7 = mux(_io_rd_T_3, _io_rd_WIRE_2, _io_rd_WIRE_3) @[SCIEUnpipelined.scala 19:15]
    io_rd <= _io_rd_T_7 @[SCIEUnpipelined.scala 19:9]
