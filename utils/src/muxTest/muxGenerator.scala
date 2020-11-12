package muxTest

import java.io.File

import chisel3.stage.ChiselStage

object muxGenerator extends App {
    // (new ChiselStage).execute(args, Seq(ChiselGeneratorAnnotation(() => new Mux(16))))
    // (new ChiselStage).execute(args, Seq(ChiselGeneratorAnnotation(() => new Mux(32))))

    val targetDirName = "./utils/output"
    val path1 = new File(targetDirName)
    val cs = new ChiselStage
    cs.emitVerilog(new MultiMux(16),
        Array("--target-dir", path1.getAbsolutePath, "-o", "testMuxName"))
}
