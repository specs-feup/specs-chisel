package pt.inesctec.modules.functionalUnit.portlist

import pt.inesctec.modules.functionalUnit.port.Port

trait PortListProperties {

  def getNumPorts(): Int;

  def getPortByName(name: String): Option[Port]

  def getPortByIndex(idx: Int): Option[Port]
}
