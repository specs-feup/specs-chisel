package pt.inesctec.modules

import chisel3.experimental.DataMirror
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.{DontCare, Module, MultiIOModule}
import pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit.Add

class TestDataMirror extends MultiIOModule {
  val add = Module(Add(32))
  add.mio.ina := DontCare
  add.mio.inb := DontCare

  DataMirror.fullModulePorts(add).foreach { case (name, port) => {
    println(s"Found port $name: $port")
  }}
}

object TestDataMirror extends App {
  (new ChiselStage).execute(Array[String](), Seq(ChiselGeneratorAnnotation(() => new TestDataMirror)))
}