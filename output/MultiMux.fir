;buildInfoPackage: chisel3, version: 3.4.0, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit MultiMux : 
  module Mux : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<16>, flip b : UInt<16>, c : UInt<16>, flip e : UInt<1>}
    
    when io.e : @[Mux.scala 26:16]
      io.c <= io.b @[Mux.scala 27:14]
      skip @[Mux.scala 26:16]
    else : @[Mux.scala 28:17]
      io.c <= io.a @[Mux.scala 29:14]
      skip @[Mux.scala 28:17]
    
  module Mux_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<16>, flip b : UInt<16>, c : UInt<16>, flip e : UInt<1>}
    
    when io.e : @[Mux.scala 26:16]
      io.c <= io.b @[Mux.scala 27:14]
      skip @[Mux.scala 26:16]
    else : @[Mux.scala 28:17]
      io.c <= io.a @[Mux.scala 29:14]
      skip @[Mux.scala 28:17]
    
  module Mux_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<16>, flip b : UInt<16>, c : UInt<16>, flip e : UInt<1>}
    
    when io.e : @[Mux.scala 26:16]
      io.c <= io.b @[Mux.scala 27:14]
      skip @[Mux.scala 26:16]
    else : @[Mux.scala 28:17]
      io.c <= io.a @[Mux.scala 29:14]
      skip @[Mux.scala 28:17]
    
  module MultiMux : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<16>, flip b : UInt<16>, flip c : UInt<16>, flip d : UInt<16>, e : UInt<16>, flip f : UInt<2>}
    
    node _io_e_T = bits(io.f, 1, 1) @[MultiMux.scala 17:31]
    node _io_e_T_1 = bits(io.f, 0, 0) @[MultiMux.scala 18:22]
    inst Mux of Mux @[Mux.scala 10:23]
    Mux.clock <= clock
    Mux.reset <= reset
    Mux.io.a <= io.a @[Mux.scala 11:16]
    Mux.io.b <= io.b @[Mux.scala 12:16]
    Mux.io.e <= _io_e_T_1 @[Mux.scala 13:16]
    node _io_e_T_2 = bits(io.f, 0, 0) @[MultiMux.scala 19:22]
    inst Mux_1 of Mux_1 @[Mux.scala 10:23]
    Mux_1.clock <= clock
    Mux_1.reset <= reset
    Mux_1.io.a <= io.c @[Mux.scala 11:16]
    Mux_1.io.b <= io.d @[Mux.scala 12:16]
    Mux_1.io.e <= _io_e_T_2 @[Mux.scala 13:16]
    inst Mux_2 of Mux_2 @[Mux.scala 10:23]
    Mux_2.clock <= clock
    Mux_2.reset <= reset
    Mux_2.io.a <= Mux.io.c @[Mux.scala 11:16]
    Mux_2.io.b <= Mux_1.io.c @[Mux.scala 12:16]
    Mux_2.io.e <= _io_e_T @[Mux.scala 13:16]
    io.e <= Mux_2.io.c @[MultiMux.scala 17:15]
    
