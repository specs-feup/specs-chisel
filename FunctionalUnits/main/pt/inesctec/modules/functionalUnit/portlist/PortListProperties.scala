package pt.inesctec.modules.functionalUnit.portlist

import pt.inesctec.modules.GPort

trait PortListProperties {

  def getNumPorts(): Int;

  def getPortByName(name: String): Option[GPort]

  def getPortByIndex(idx: Int): Option[GPort]
}
