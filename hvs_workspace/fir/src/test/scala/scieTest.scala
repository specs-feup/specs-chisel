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
    test(new SCIEUnpipelined(params)).withAnnotations(annotations) { dut =>
      val input_coeffs = Array.fill(order)(Random.between(1, 101))
      val input_data = Array.fill(order)(Random.between(1, 101))
      for (i <- 0 until order) {
        dut.io.insn.poke("h700b".U)
        dut.io.rs1.poke(input_coeffs(i).U)
        dut.io.rs2.poke(i.U)
        dut.clock.step(1)

        dut.io.insn.poke("h702b".U)
        dut.io.rs1.poke(input_data(i).U)
        dut.clock.step(1)
      }
      var acc = 0;
      for (i <- 0 until order) {
        acc += input_coeffs(i) * input_data(input_data.length - 1 - i)
      }
      dut.io.insn.poke("h705b".U)
      dut.clock.step(1)
      println("Test Results:\n")
      println("Expected -> " + acc)
      println("Obtained -> " + dut.io.rd.peek().litValue)

      dut.io.rd.expect(acc.asUInt)
    }
  }
}

class SCIETesterStage extends GenericTesterStage((params, annotations) => {
    params.defaults ++= Seq("order" -> "4", "width" -> "32")
    (new SCIESpec(params, annotations)).execute()
 })

object SCIETest extends StageMain(new SCIETesterStage)

/*class SCIETestbench extends AnyFlatSpec with ChiselScalatestTester{
  "SCIEUnpipelined" should "pass" in {
    val order = System.getProperty("param1").toInt
    val width = System.getProperty("param2").toInt
    test(new SCIEUnpipelined(order, width)) { s =>
      val input_coeffs = Array.fill(order)(Random.between(1, 101))
      val input_data = Array.fill(order)(Random.between(1, 101))
      for (i <- 0 until order) {
        s.io.insn.poke("h700b".U)
        s.io.rs1.poke(input_coeffs(i).U)
        s.io.rs2.poke(i.U)
        s.clock.step(1)

        s.io.insn.poke("h702b".U)
        s.io.rs1.poke(input_data(i).U)
        s.clock.step(1)
      }
      var acc = 0;
      for (i <- 0 until order) {
        acc += input_coeffs(i) * input_data(input_data.length - 1 - i)
      }
      s.io.insn.poke("h705b".U)
      s.clock.step(1)
      println("Expected result -> " + acc)
      println("Obtained result ->" + s.io.rd.peek())
      s.io.rd.expect(acc.asUInt)
    }
  }
}*/