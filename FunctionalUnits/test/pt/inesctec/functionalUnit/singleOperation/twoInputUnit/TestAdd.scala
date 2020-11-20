package pt.inesctec.functionalUnit.singleOperation.twoInputUnit

import chisel3.{Bundle, Module}
import pt.inesctec.modules.functionalUnit.portlist.UBiFunctionPorts

class TestAdd extends Module {

  val io = IO(new Bundle {
    val ports = new UBiFunctionPorts(32)
  })

  io.ports.outa := io.ports.inb + io.ports.ina
}
