package pt.inesctec.modules.functionalUnit

import chisel3.{Data, Module, SInt, UInt}
import pt.inesctec.modules.GPort

trait InlineApply[T <: AFunctionalUnit] {

  /*
  Must be overridden by companion objects of children
   */
  def newInstance(bits: Int): T;

  /*
  Applies operands to ports in order in which they are passed, relative to port declaration;
  returns the last port in the port list (assumed to be single result of operation)
  */
  final def apply(operands: GPort*) = {
    val opa = operands(0)
    val m = Module(newInstance(opa.width))
    var i = 0;
    for (op <- operands) {
      m.getPortByIndex(i) := op
      i = i + 1
    }
    m.getPortByIndex(m.getNumPorts - 1) // return last port
  }

  final def apply(operands: Data*) = {
    val opa = operands(0)
    val m = Module(newInstance(opa.getWidth))
    var i = 0;
    for (op <- operands) {
      val port = m.io.ports(i)
      op match {
        case uint: UInt => port := uint;
        case sint: SInt => port := sint;
        //case uint: UInt => this.portData := uint;
      }
      port := op
      i = i + 1
    }
    m.io.ports(m.getPorts.size - 1)
  }
}
