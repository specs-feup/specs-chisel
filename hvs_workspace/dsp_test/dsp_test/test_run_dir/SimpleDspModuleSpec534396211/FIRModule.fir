circuit FIRModule :
  module FIRModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip rs1 : { real : UInt<16>, imag : UInt<16>}, flip rs2 : { real : UInt<16>, imag : UInt<16>}, rd : { real : UInt<16>, imag : UInt<16>}}

    node _io_rd_T = add(io.rs1.real, io.rs2.real) @[UIntTypeClass.scala 19:40]
    node _io_rd_T_1 = tail(_io_rd_T, 1) @[UIntTypeClass.scala 19:40]
    node _io_rd_T_2 = add(io.rs1.imag, io.rs2.imag) @[UIntTypeClass.scala 19:40]
    node _io_rd_T_3 = tail(_io_rd_T_2, 1) @[UIntTypeClass.scala 19:40]
    wire io_rd_result : { real : UInt<16>, imag : UInt<16>} @[DspComplex.scala 34:22]
    io_rd_result.real <= _io_rd_T_1 @[DspComplex.scala 35:17]
    io_rd_result.imag <= _io_rd_T_3 @[DspComplex.scala 36:17]
    io.rd.imag <= io_rd_result.imag @[dsp_test.scala 25:11]
    io.rd.real <= io_rd_result.real @[dsp_test.scala 25:11]

