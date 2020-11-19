package pt.inesctec.modules.functionalUnit

import chisel3.{Bundle, Module}
import pt.inesctec.modules.functionalUnit.portlist.BiFunctionPorts

class TestAdd extends Module {

  val io = IO(new Bundle { val ports = new BiFunctionPorts(32) })

  io.ports.outa := io.ports.inb + io.ports.ina
}
