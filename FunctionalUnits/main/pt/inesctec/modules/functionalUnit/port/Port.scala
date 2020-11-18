package pt.inesctec.modules.functionalUnit.port

import chisel3.{Data, SInt, UInt}
import pt.inesctec.modules.GPort

object Port {
  def apply[T <: Data](name: String, data: T, direction: PortDirection.Value): Port[T] = new Port(name, data, direction)
/*
  def asInput[T <: Data](port : Port[T]): Unit = Input(port)

  def asOutput[T <: Data](port : Port[T]): Unit = Output(port)*/
}

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

  def + (that : => GPort) = {
    that.portData match {
      case uint: UInt => this.portData + uint;
      case sint: SInt => this.portData + sint;
      //case uint: UInt => this.portData := uint;
    }
  }

  def width = this.portData.getWidth
}
