circuit SCIEUnpipelined :
  module SCIEUnpipelined :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip insn : UInt<32>, flip rs1 : UInt<32>, flip rs2 : UInt<32>, rd : UInt<32>}

    wire _io_rd_WIRE : UInt<32> @[SCIEUnpipelined.scala 19:45]
    _io_rd_WIRE <= io.rs1 @[SCIEUnpipelined.scala 19:45]
    wire _io_rd_WIRE_1 : UInt<32> @[SCIEUnpipelined.scala 19:76]
    _io_rd_WIRE_1 <= UInt<1>("h0") @[SCIEUnpipelined.scala 19:76]
    node _io_rd_T = gt(_io_rd_WIRE, _io_rd_WIRE_1) @[UIntTypeClass.scala 55:47]
    wire _io_rd_WIRE_2 : UInt<32> @[SCIEUnpipelined.scala 19:112]
    _io_rd_WIRE_2 <= io.rs1 @[SCIEUnpipelined.scala 19:112]
    wire _io_rd_WIRE_3 : UInt<32> @[SCIEUnpipelined.scala 19:143]
    _io_rd_WIRE_3 <= UInt<1>("h0") @[SCIEUnpipelined.scala 19:143]
    node _io_rd_T_1 = mux(_io_rd_T, _io_rd_WIRE_2, _io_rd_WIRE_3) @[SCIEUnpipelined.scala 19:15]
    io.rd <= _io_rd_T_1 @[SCIEUnpipelined.scala 19:9]

