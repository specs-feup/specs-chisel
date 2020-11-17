package pt.inesctec.modules.functionalUnit.port

import chisel3.Data

class Port(name: String, data: Data, direction: PortDirection.Value) {
  val portName: String = name;
  val portData: Data = data;
  var portDir: PortDirection.Value = direction
}
