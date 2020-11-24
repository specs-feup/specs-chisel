package pt.inesctec

import java.io.File

import chisel3.stage.ChiselStage
import pt.inesctec.genericmux.GenericMux

object ModuleGenerator extends App {

  val path1 = new File("./utils/output/")
  val cs = new ChiselStage
  cs.emitVerilog(GenericMux(2),
    Array("--target-dir", path1.getAbsolutePath, "-o", "GenericMux"))

  //(new ChiselStage).execute(Array[String](), Seq(ChiselGeneratorAnnotation(() => new TestDataMirror)))
}
