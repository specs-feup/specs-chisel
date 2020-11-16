package pt.inesctec.modules.functionalUnit

import chisel3.{Bundle, UInt}

trait FunctionalUnitProperties {

  /*
   * Get Name of instantiated module
   */
  final def getName() = {
    this.getClass.getSimpleName
  }

  /*
   *
   */
  def getIO(): Bundle

  /*

   */
  def getPort(idx: Int): Option[UInt]
}
