;buildInfoPackage: chisel3, version: 3.4.0, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit TestDataMirror : 
  module Add : 
    input clock : Clock
    input reset : Reset
    output io : {flip inb : UInt<32>, flip ina : UInt<32>, outa : UInt<32>}
    
    node _io_outa_T = add(io.ina, io.inb) @[Add.scala 8:23]
    node _io_outa_T_1 = tail(_io_outa_T, 1) @[Add.scala 8:23]
    io.outa <= _io_outa_T_1 @[Add.scala 8:12]
    
  module TestDataMirror : 
    input clock : Clock
    input reset : UInt<1>
    
    inst add of Add @[TestDataMirror.scala 9:19]
    add.clock <= clock
    add.reset <= reset
    add.io.ina is invalid @[TestDataMirror.scala 10:15]
    add.io.inb is invalid @[TestDataMirror.scala 11:15]
    
