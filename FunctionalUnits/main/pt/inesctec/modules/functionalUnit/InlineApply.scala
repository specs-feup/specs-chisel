package pt.inesctec.modules.functionalUnit

import chisel3.{Data, Module}

trait InlineApply[T <: AFunctionalUnit] {

  /*
  Must be overridden by companion objects of children
   */
  def newInstance(bits: Int): T;

  /*
  Applies operands to ports in order in which they are passed, relative to port declaration;
  returns the last port in the port list (assumed to be single result of operation)
  */
  def apply(operands: Data*) = {
    val opa = operands(0)
    val m = Module(newInstance(opa.getWidth))
    val portlist = m.io.portlist
    var i = 0
    for (op <- operands) {
      portlist(i) := op
      i = i + 1
    }
    portlist.last
  }
}
