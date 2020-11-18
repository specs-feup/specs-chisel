package pt.inesctec.modules.functionalUnit

import pt.inesctec.modules.functionalUnit.port.Port

trait FunctionalUnitProperties {

  /*
   * Get Name of instantiated module
   */
  final def getName() = {
    this.getClass.getSimpleName
  }

  def getNumPorts(): Int;

  def getPortByName(name: String): Option[Port]

  def getPortByIndex(idx: Int): Option[Port]
}
