package pt.inesctec.modules.functionalUnit.port

import chisel3.{Data, SInt, UInt}
import pt.inesctec.modules.GPort

class Port[T <: Data](name: String, data: T, direction: PortDirection.Value) {
  val portName: String = name;
  val portData: T = data;
  var portDir: PortDirection.Value = direction

  def := (that : => GPort) = {
    that.portData match {
      case uint: UInt => this.portData := uint;
      case sint: SInt => this.portData := sint;
      //case uint: UInt => this.portData := uint;
    }
  }

  def width = this.portData.getWidth
}
