;buildInfoPackage: chisel3, version: 3.4.0, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit SimpleLeftShift : 
  module SimpleLeftShift : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip ina : UInt<32>, flip inb : UInt<32>, out : UInt<32>}
    
    node _io_out_T = bits(io.inb, 4, 0) @[SimpleLeftShift.scala 12:44]
    node _io_out_T_1 = dshl(io.ina, _io_out_T) @[SimpleLeftShift.scala 12:30]
    io.out <= _io_out_T_1 @[SimpleLeftShift.scala 12:15]
    
