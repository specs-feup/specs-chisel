package scie

import chisel3._
import dsptools.{DspTester, DspTesterOptions, DspTesterOptionsManager}
import firrtl.options.StageMain
import params._
import scala.util.Random


class SCIESpec(testParams : TestParams, c: SCIEPipelined) extends DspTester(c) {
  val order = testParams.getInt("order")
  val input_coeffs = Array.fill(order)(Random.nextFloat)
  val input_data = Array.fill(order)(Random.nextFloat)

  for(i <- 0 until order){
    poke(c.io.valid, true.B)
    poke(c.io.insn, "h0b".U)
    poke(c.io.rs1, input_coeffs(i))
    poke(c.io.rs2, i.U)
    step(1)
    poke(c.io.valid, false.B)
  }


  for(i <- 0 until input_data.length){
    poke(c.io.valid, true.B)
    poke(c.io.insn, "h2b".U)
    poke(c.io.rs1, input_data(i))
    step(1)
    poke(c.io.valid, false.B)
    step(1)
    poke(c.io.valid, true.B)
    poke(c.io.insn, "h5b".U)
    step(1)
    var acc = 0.0
    for(j <- 0 until order){
      if(i - j >= 0)
        acc += input_coeffs(j) * input_data(i - j)
    }
    expect(c.io.rd, acc)
    println("Test Results:\n")
    println("Expected -> " + acc)
    println("Obtained -> " + peek(c.io.rd))
    poke(c.io.valid, false.B)
  }
}


class SCIETesterStage extends GenericTesterStage((params, annotations) => {
  params.defaults ++= Seq("order" -> "4", "width" -> "32", "binarypoint" -> "0")

  val testOptions = new DspTesterOptionsManager {
    dspTesterOptions = DspTesterOptions(
      fixTolLSBs = 2,
      genVerilogTb = true,
      isVerbose = true)
  }

    dsptools.Driver.execute(() => new SCIEPipelined(params), testOptions){ c =>
      new SCIESpec(params, c)}

})

object SCIETest extends StageMain(new SCIETesterStage)
