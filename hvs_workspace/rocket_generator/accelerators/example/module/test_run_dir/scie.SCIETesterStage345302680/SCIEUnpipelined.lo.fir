circuit SCIEUnpipelined :
  module SCIEUnpipelined :
    input clock : Clock
    input reset : UInt<1>
    input io_insn : UInt<32>
    input io_rs1 : UInt<32>
    input io_rs2 : UInt<32>
    output io_rd : UInt<32>

    node _io_rd_WIRE = io_rs1 @[SCIEUnpipelined.scala 19:{45,45}]
    node _io_rd_WIRE_1 = UInt<32>("h0") @[SCIEUnpipelined.scala 19:{76,76}]
    node _io_rd_T = gt(_io_rd_WIRE, _io_rd_WIRE_1) @[UIntTypeClass.scala 55:47]
    node _io_rd_WIRE_2 = io_rs1 @[SCIEUnpipelined.scala 19:{112,112}]
    node _io_rd_WIRE_3 = UInt<32>("h0") @[SCIEUnpipelined.scala 19:{143,143}]
    node _io_rd_T_1 = mux(_io_rd_T, _io_rd_WIRE_2, _io_rd_WIRE_3) @[SCIEUnpipelined.scala 19:15]
    io_rd <= _io_rd_T_1 @[SCIEUnpipelined.scala 19:9]
