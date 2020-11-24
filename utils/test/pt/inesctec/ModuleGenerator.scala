package pt.inesctec

import java.io.File

import chisel3.stage.ChiselStage
import pt.inesctec.genericmux.GenericCrossBar

object ModuleGenerator extends App {

  val path1 = new File("./utils/output/")
  val cs = new ChiselStage
  cs.emitVerilog(GenericCrossBar(2),
    Array("--target-dir", path1.getAbsolutePath, "-o", "GenericCrossBar"))

  //(new ChiselStage).execute(Array[String](), Seq(ChiselGeneratorAnnotation(() => new TestDataMirror)))
}
