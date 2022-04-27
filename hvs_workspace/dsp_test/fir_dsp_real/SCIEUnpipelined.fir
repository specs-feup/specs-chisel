circuit SCIEUnpipelined :
  module SCIEUnpipelined :
    output io : { flip insn : UInt<32>, flip rs1 : UInt<32>, flip rs2 : UInt<32>, rd : UInt<32>}

    io.rd <= UInt<1>("h0") @[SCIEUnpipelined.scala 18:9]

