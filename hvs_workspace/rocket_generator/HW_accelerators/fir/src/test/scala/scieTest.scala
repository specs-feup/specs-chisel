package scie

import chisel3._
import chisel3.stage.{ChiselStage, ChiselGeneratorAnnotation}
import firrtl._
import chisel3.tester._
import org.scalatest.freespec.AnyFreeSpec
import firrtl.options.StageMain
import params._

import scala.util.Random

class SCIESpec(params: TestParams, annotations: AnnotationSeq = Seq()) extends AnyFreeSpec with ChiselScalatestTester {
  val order = params.getInt("order")
  val width = params.getInt("width")
  "FIR should perform MAC operation between its coeffs and its data" in {
    test(new SCIEPipelined(params)).withAnnotations(annotations) { dut =>
      val input_coeffs = Array.fill(order)(Random.between(1, 101))
      val input_data = Array.fill(order)(Random.between(1, 101))
      dut.io.valid.poke(true.B)
      for (i <- 0 until order) {
        dut.io.insn.poke("h0b".U)
        dut.io.rs1.poke(input_coeffs(i).U)
        dut.io.rs2.poke(i.U)
        dut.clock.step(1)

        dut.io.insn.poke("h2b".U)
        dut.io.rs1.poke(input_data(i).U)
        dut.clock.step(1)
      }
      var acc = 0;
      for (i <- 0 until order) {
        acc += input_coeffs(i) * input_data(input_data.length - 1 - i)
      }
      dut.io.insn.poke("h5b".U)
      dut.clock.step(1)
      println("Test Results:\n")
      println("Expected -> " + acc)
      println("Obtained -> " + dut.io.rd.peek().litValue)
      dut.io.valid.poke(false.B)
      dut.io.rd.expect(acc.asUInt)
    }
  }
}

class SCIETesterStage extends GenericTesterStage((params, annotations) => {
    params.defaults ++= Seq("order" -> "4", "width" -> "32")
    (new SCIESpec(params, annotations)).execute()
 })

object SCIETest extends StageMain(new SCIETesterStage)
