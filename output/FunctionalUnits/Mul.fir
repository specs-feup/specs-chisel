;buildInfoPackage: chisel3, version: 3.4.0, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Mul : 
  module Mul : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip ina : UInt<32>, flip inb : UInt<32>, out : UInt<32>}
    
    node _io_out_T = mul(io.ina, io.inb) @[TwoInputUnit.scala 7:103]
    io.out <= _io_out_T @[TwoInputUnit.scala 7:90]
    
