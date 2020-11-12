package generators

import java.io.File

import chisel3.stage.ChiselStage
import modules.LeftShift

object ModuleGenerator extends App {

    val path1 = new File("./output/")
    val cs = new ChiselStage
    cs.emitVerilog(new LeftShift(32),
        Array("--target-dir", path1.getAbsolutePath, "-o", "testName"))
}
