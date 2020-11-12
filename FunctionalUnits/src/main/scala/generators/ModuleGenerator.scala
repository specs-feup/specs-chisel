package generators

import java.io.File
import chisel3.stage.ChiselStage
import modules.FunctionalUnit

object ModuleGenerator extends App {
    def generate(unit: FunctionalUnit, targetDir : String) {
        val path1 = new File(targetDir)
        val cs = new ChiselStage
        cs.emitVerilog(unit,
            Array("--target-dir", path1.getAbsolutePath, "-o", unit.getName()))
    }
}
