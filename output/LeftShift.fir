;buildInfoPackage: chisel3, version: 3.4.0, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit LeftShift : 
  module LeftShift : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip ina : UInt<32>, flip inb : UInt<32>, out : UInt<32>}
    
    node _T = bits(io.inb, 5, 0) @[LeftShift.scala 20:30]
    node z1 = dshl(io.ina, _T) @[LeftShift.scala 20:21]
    io.out <= z1 @[LeftShift.scala 21:12]
    
