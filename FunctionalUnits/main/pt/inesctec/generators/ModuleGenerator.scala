package pt.inesctec.generators

import java.io.File

import chisel3.stage.ChiselStage
import pt.inesctec.modules.functionalUnit.singleOperation.twoInputUnit.Add

object ModuleGenerator extends App {

  val path1 = new File("./FunctionalUnits/output/")
  val cs = new ChiselStage
  cs.emitVerilog(Add(32),
    Array("--target-dir", path1.getAbsolutePath, "-o", "Add"))

  /*
  val annot = new ChiselGeneratorAnnotation(() => new Mul(32))

  def generate(module : Module, path : File) {
      val cs = new ChiselStage
      cs.emitVerilog(module,
          Array("--target-dir", path.getAbsolutePath, "-o", module.getName()))
  }*/
}
