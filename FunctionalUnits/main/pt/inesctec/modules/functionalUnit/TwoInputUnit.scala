package pt.inesctec.modules.functionalUnit

import pt.inesctec.modules.functionalUnit.portlist.FunctionPorts

abstract class TwoInputUnit[A <: FunctionPorts](ports: A) extends AFunctionalUnit(ports) {
  type T = A
}
