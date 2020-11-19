package pt.inesctec.modules.functionalUnit

import chisel3.experimental.IO
import pt.inesctec.modules.functionalUnit.portlist.BiFunctionPorts

class TestAdder {
  val io = IO(new BiFunctionPorts(32))
}
