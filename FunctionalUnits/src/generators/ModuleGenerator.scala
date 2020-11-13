package generators

import java.io.File

import chisel3.stage.ChiselStage
import modules.MultiShift

object ModuleGenerator extends App {

    val path1 = new File("./output/")
    val cs = new ChiselStage
    cs.emitVerilog(new MultiShift,
        Array("--target-dir", path1.getAbsolutePath, "-o", "multiShift"))
}
