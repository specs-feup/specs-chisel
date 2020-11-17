package pt.inesctec.modules.functionalUnit

import chisel3.{Module, UInt}

trait InlineApply[T <: AFunctionalUnit] {

  /*
  Must be overridden by companion objects of children
   */
  def newInstance(bits: Int): T;

  /*
  Applies operands to ports in order in which they are passed, relative to port declaration;
  returns the last port in the port list (assumed to be single result of operation)
  */
  final def apply(operands: UInt*) = {
    val opa = operands(0)
    val m = Module(newInstance(opa.getWidth))
    var i = 0;
    for (op <- operands) {
      val port = m.getPort(i).get
      port := op
      i = i + 1
    }
    m.getPort(m.getPorts.size - 1).get // return last port
  }
}
