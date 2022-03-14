package testPack

import java.io.File

import chisel3.stage.ChiselStage
import chisel3.{Module, _}

class testScalaClass(bits: Int) extends Module {
    val io = IO(new Bundle {
        val a = Input(UInt(bits.W))
        val b = Input(UInt(bits.W))
        val c = Output(UInt(bits.W))
        val e = Input(Bool())
    })

    when(io.e) {
        io.c := io.b
    }.otherwise {
        io.c := io.a
    }
}

object testScalaClass extends App {

    val path1 = new File("./testScalaModule/output/")
    val cs = new ChiselStage
    var unit = Module(new testScalaClass(32))
    cs.emitVerilog(unit,
        Array("--target-dir", path1.getAbsolutePath, "-o", "testName"))
}
