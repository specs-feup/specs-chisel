package pt.inesctec.modules.functionalUnit

import chisel3.{Data, Module}
import pt.inesctec.modules.functionalUnit.portlist.FunctionPorts

trait UInlineApply[T <: AFunctionalUnit[_ <: FunctionPorts]] extends InlineApply[T] {
  def apply(operands: Data*) = super.apply(operands).asUInt()
}

trait SInlineApply[T <: AFunctionalUnit[_ <: FunctionPorts]] extends InlineApply[T] {
  def apply(operands: Data*) = super.apply(operands).asUInt().asSInt() // lol?
}

sealed trait InlineApply[T <: AFunctionalUnit[_ <: FunctionPorts]] {

  /*
  Must be overridden by companion objects of children
   */
  def newInstance(bits: Int): T;

  /*
  Applies operands to ports in order in which they are passed, relative to port declaration;
  returns the last port in the port list (assumed to be single result of operation)
  */
  def apply(operands: Seq[Data]) = {
    val opa = operands(0)
    val m = Module(newInstance(opa.getWidth))
    val portlist = m.io.portlist  // list comes out reversed here, relative to declaration order in FunctionPorts
    var i = 0
    for (op <- operands) {
      portlist(i) := op
      i = i + 1
    }
    portlist.last
  }
}
