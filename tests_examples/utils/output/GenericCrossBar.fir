;buildInfoPackage: chisel3, version: 3.4.0, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit GenericCrossBar : 
  module GenericCrossBar : 
    output io : {flip select : UInt<2>, inputs : {flip valuein : UInt<8>, valueout : UInt<8>}[1], flip output : {flip valuein : UInt<8>, valueout : UInt<8>}[2]}
    
    node right = bits(io.select, 0, 0) @[GenericMux.scala 40:27]
    node left = bits(io.select, 0, 0) @[GenericMux.scala 42:37]
    node _T = cat(right, left) @[Cat.scala 29:58]
    node _io_inputs_0_T = bits(_T, 0, 0) @[GenericMux.scala 43:41]
    node _io_inputs_0_T_1 = bits(_T, 1, 1) @[GenericMux.scala 43:41]
    wire _io_inputs_0_WIRE : {flip valuein : UInt<8>, valueout : UInt<8>} @[Mux.scala 27:72]
    node _io_inputs_0__io_inputs_0_WIRE_valueout_T = mux(_io_inputs_0_T, io.output[0].valueout, UInt<1>("h00")) @[Mux.scala 27:72]
    node _io_inputs_0__io_inputs_0_WIRE_valueout_T_1 = mux(_io_inputs_0_T_1, io.output[1].valueout, UInt<1>("h00")) @[Mux.scala 27:72]
    node _io_inputs_0__io_inputs_0_WIRE_valueout_T_2 = or(_io_inputs_0__io_inputs_0_WIRE_valueout_T, _io_inputs_0__io_inputs_0_WIRE_valueout_T_1) @[Mux.scala 27:72]
    wire _io_inputs_0__io_inputs_0_WIRE_valueout_WIRE : UInt<8> @[Mux.scala 27:72]
    _io_inputs_0__io_inputs_0_WIRE_valueout_WIRE <= _io_inputs_0__io_inputs_0_WIRE_valueout_T_2 @[Mux.scala 27:72]
    _io_inputs_0_WIRE.valueout <= _io_inputs_0__io_inputs_0_WIRE_valueout_WIRE @[Mux.scala 27:72]
    node _io_inputs_0__io_inputs_0_WIRE_valuein_T = mux(_io_inputs_0_T, io.output[0].valuein, UInt<1>("h00")) @[Mux.scala 27:72]
    node _io_inputs_0__io_inputs_0_WIRE_valuein_T_1 = mux(_io_inputs_0_T_1, io.output[1].valuein, UInt<1>("h00")) @[Mux.scala 27:72]
    node _io_inputs_0__io_inputs_0_WIRE_valuein_T_2 = or(_io_inputs_0__io_inputs_0_WIRE_valuein_T, _io_inputs_0__io_inputs_0_WIRE_valuein_T_1) @[Mux.scala 27:72]
    wire _io_inputs_0__io_inputs_0_WIRE_valuein_WIRE : UInt<8> @[Mux.scala 27:72]
    _io_inputs_0__io_inputs_0_WIRE_valuein_WIRE <= _io_inputs_0__io_inputs_0_WIRE_valuein_T_2 @[Mux.scala 27:72]
    _io_inputs_0_WIRE.valuein <= _io_inputs_0__io_inputs_0_WIRE_valuein_WIRE @[Mux.scala 27:72]
    io.inputs[0].valueout <= _io_inputs_0_WIRE.valueout @[GenericMux.scala 43:18]
    _io_inputs_0_WIRE.valuein <= io.inputs[0].valuein @[GenericMux.scala 43:18]
    node _T_1 = bits(io.select, 0, 0) @[GenericMux.scala 46:29]
    node _io_output_0_T = bits(_T_1, 0, 0) @[GenericMux.scala 47:43]
    io.inputs[0].valueout <= io.output[0].valueout @[GenericMux.scala 47:18]
    io.output[0].valuein <= io.inputs[0].valuein @[GenericMux.scala 47:18]
    node _T_2 = bits(io.select, 1, 1) @[GenericMux.scala 46:29]
    node _io_output_1_T = bits(_T_2, 0, 0) @[GenericMux.scala 47:43]
    io.inputs[0].valueout <= io.output[1].valueout @[GenericMux.scala 47:18]
    io.output[1].valuein <= io.inputs[0].valuein @[GenericMux.scala 47:18]
    
