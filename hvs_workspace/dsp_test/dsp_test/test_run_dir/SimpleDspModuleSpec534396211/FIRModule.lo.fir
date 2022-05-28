circuit FIRModule :
  module FIRModule :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1_real : UInt<16>
    input io_rs1_imag : UInt<16>
    input io_rs2_real : UInt<16>
    input io_rs2_imag : UInt<16>
    output io_rd_real : UInt<16>
    output io_rd_imag : UInt<16>

    node _io_rd_T = add(io_rs1_real, io_rs2_real) @[UIntTypeClass.scala 19:40]
    node _io_rd_T_1 = tail(_io_rd_T, 1) @[UIntTypeClass.scala 19:40]
    node _io_rd_T_2 = add(io_rs1_imag, io_rs2_imag) @[UIntTypeClass.scala 19:40]
    node _io_rd_T_3 = tail(_io_rd_T_2, 1) @[UIntTypeClass.scala 19:40]
    node io_rd_result_real = _io_rd_T_1 @[DspComplex.scala 34:22 35:17]
    node io_rd_result_imag = _io_rd_T_3 @[DspComplex.scala 34:22 36:17]
    io_rd_real <= io_rd_result_real @[dsp_test.scala 25:11]
    io_rd_imag <= io_rd_result_imag @[dsp_test.scala 25:11]
