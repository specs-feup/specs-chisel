package pt.inesctec.modules.functionalUnit.port

import chisel3.UInt

class Port(name: String, data: UInt, direction: PortDirection.Value) {
  val portName: String = name;
  val portData: UInt = data;
  var portDir: PortDirection.Value = direction
}
