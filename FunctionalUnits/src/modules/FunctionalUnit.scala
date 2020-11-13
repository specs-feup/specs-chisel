package modules

import chisel3._

abstract class FunctionalUnit(ports: FunctionalUnitPorts) extends Module with FunctionalUnitProperties {
    val io = IO(ports)

    override def getName(): String = this.getClass.getSimpleName

    override def getIO(): Bundle = this.ports
}
