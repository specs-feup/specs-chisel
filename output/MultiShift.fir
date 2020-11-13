;buildInfoPackage: chisel3, version: 3.4.0, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit MultiShift : 
  module LeftShift : 
    input clock : Clock
    input reset : Reset
    output io : {flip ina : UInt<32>, flip inb : UInt<32>, out : UInt<32>}
    
    node _T = bits(io.inb, 5, 0) @[LeftShift.scala 20:30]
    node z1 = dshl(io.ina, _T) @[LeftShift.scala 20:21]
    io.out <= z1 @[LeftShift.scala 21:12]
    
  module LeftShift_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip ina : UInt<32>, flip inb : UInt<32>, out : UInt<32>}
    
    node _T = bits(io.inb, 5, 0) @[LeftShift.scala 20:30]
    node z1 = dshl(io.ina, _T) @[LeftShift.scala 20:21]
    io.out <= z1 @[LeftShift.scala 21:12]
    
  module MultiShift : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<32>, b : UInt<32>}
    
    inst LeftShift of LeftShift @[LeftShift.scala 12:23]
    LeftShift.clock <= clock
    LeftShift.reset <= reset
    LeftShift.io.ina <= io.a @[LeftShift.scala 13:18]
    LeftShift.io.inb <= UInt<2>("h02") @[LeftShift.scala 14:18]
    inst LeftShift_1 of LeftShift_1 @[LeftShift.scala 12:23]
    LeftShift_1.clock <= clock
    LeftShift_1.reset <= reset
    LeftShift_1.io.ina <= LeftShift.io.out @[LeftShift.scala 13:18]
    LeftShift_1.io.inb <= UInt<2>("h02") @[LeftShift.scala 14:18]
    io.b <= LeftShift_1.io.out @[LeftShift.scala 34:10]
    
