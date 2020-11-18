package pt.inesctec.modules.functionalUnit

import pt.inesctec.modules.GPort

trait FunctionalUnitProperties {

  /*
   * Get Name of instantiated module
   */
  final def getName() = {
    this.getClass.getSimpleName
  }

  def getNumPorts(): Int;

  def getPortByName(name: String): GPort

  def getPortByIndex(idx: Int): GPort
}
