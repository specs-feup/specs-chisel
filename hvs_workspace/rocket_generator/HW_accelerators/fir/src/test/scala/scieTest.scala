package scie

import chisel3._
import chisel3.experimental.FixedPoint
import dsptools.numbers.{DspComplex, DspReal, Real, Ring}
import dsptools.{DspTester, DspTesterOptions, DspTesterOptionsManager}
import firrtl.options.StageMain
import params._
import breeze.math.Complex

import scala.util.Random

/*class SCIEComplexSpec[T<:Data:Ring](testParams : TestParams, c : SCIEPipelined[T]) extends DspTester(c){
  val order = testParams.getInt("order")
  val data_size = testParams.getInt("data")

  val input_coeffs = Array.fill(order)(DspComplex(Random.nextFloat, Random.nextFloat))
  val input_data = Array.fill(data_size)(Complex(Random.nextFloat, Random.nextFloat))

  for(i <- 0 until order){
    poke(c.io.valid, true.B)
    poke(c.io.insn, "h0b".U)
    poke(c.io.rs1, input_coeffs(i))
    poke(c.io.rs2, i.U)
    step(1)
    poke(c.io.valid, false.B)
  }

  for(i <- 0 until data_size){
    var acc = Complex(0,0)
    poke(c.io.valid, true.B)
    poke(c.io.insn, "h2b".U)
    poke(c.io.rs1, input_data(i))
    step(1)
    poke(c.io.valid, false.B)
    step(1)
    poke(c.io.valid, true.B)
    poke(c.io.insn, "h5b".U)
    step(1)
    for(j <- 0 until order){
      if(i - j >= 0)
        acc = Ring[T].plus(acc, Ring[T].times(input_coeffs(j), input_data(i-j)))
    }
    expect(c.io.rd, acc)
    println("Test Results:\n")
    println("Expected -> " + acc)
    println("Obtained -> " + peek(c.io.rd) + "\n")
    poke(c.io.valid, false.B)
  }
}*/

class SCIESpec[T<:Data:Ring](testParams : TestParams, c: SCIEPipelined[T], fir_type : String) extends DspTester(c) {
  val order = testParams.getInt("order")
  val data_size = testParams.getInt("data")
  var acc = 0.0
  var input_coeffs = Array.fill(order)(Random.nextFloat)
  var input_data = Array.fill(data_size)(Random.nextFloat)

  fir_type match{
    case "DspReal" | "3" =>

    case "SInt" | "1" =>  input_coeffs = Array.fill(order)(Random.between(1, 101) - 100)
      input_data = Array.fill(data_size)(Random.between(1, 101) - 100)
      acc = 0

    case "UInt" | "0" =>  input_coeffs = Array.fill(order)(Random.between(1, 101))
      input_data = Array.fill(data_size)(Random.between(1, 101))
      acc = 0

    case "FixedPoint" | "2" =>
   // case "DspComplex-FixedPoint" =>  input_coeffs = Array.fill(order)(Complex(Random.nextFloat, Random.nextFloat))
    //  input_data = Array.fill(data_size)(Complex(Random.nextFloat, Random.nextFloat))

    //case "DspComplex-Real" => input_coeffs = Array.fill(order)(Complex(Random.nextFloat, Random.nextFloat))
    //  input_data = Array.fill(data_size)(Complex(Random.nextFloat, Random.nextFloat))
  }

  for(i <- 0 until order){
    poke(c.io.valid, true.B)
    poke(c.io.insn, "h0b".U)
    poke(c.io.rs1, input_coeffs(i))
    poke(c.io.rs2, i.U)
    step(1)
    poke(c.io.valid, false.B)
  }


  for(i <- 0 until data_size){
    acc = 0
    poke(c.io.valid, true.B)
    poke(c.io.insn, "h2b".U)
    poke(c.io.rs1, input_data(i))
    step(1)
    poke(c.io.valid, false.B)
    step(1)
    poke(c.io.valid, true.B)
    poke(c.io.insn, "h5b".U)
    step(1)
    for(j <- 0 until order){
      if(i - j >= 0)
        acc += input_coeffs(j) * input_data(i-j)
    }
    expect(c.io.rd, acc)
    println("Test Results:\n")
    println("Expected -> " + acc)
    println("Obtained -> " + peek(c.io.rd) + "\n")
    poke(c.io.valid, false.B)
  }
}


class SCIETesterStage extends GenericTesterStage((params, _) => {
  params.defaults ++= Seq("order" -> "4", "width" -> "32", "binarypoint" -> "0")

  val testOptions = new DspTesterOptionsManager {
    dspTesterOptions = DspTesterOptions(
      fixTolLSBs = 2,
      genVerilogTb = true,
      isVerbose = true)
  }

  val fir_type = params.getString("type")
  val width = params.getInt("width")
  val binarypoint = params.getInt("binarypoint")

  fir_type match{
    case "DspReal" => dsptools.Driver.execute(() => new SCIEPipelined(params, new DspReal), testOptions){ c =>
      new SCIESpec(params, c, fir_type)}

    case "SInt" => dsptools.Driver.execute(() => new SCIEPipelined(params, SInt(chisel3.internal.firrtl.Width
    (width))), testOptions){ c =>
      new SCIESpec(params, c, fir_type)}

    case "UInt" => dsptools.Driver.execute(() => new SCIEPipelined(params, UInt(chisel3.internal.firrtl.Width
    (width))), testOptions){ c =>
      new SCIESpec(params, c, fir_type)}

    case "FixedPoint" => dsptools.Driver.execute(() => new SCIEPipelined(params, FixedPoint(chisel3.internal.firrtl.Width(width), binarypoint.BP)),
      testOptions){ c =>
      new SCIESpec(params, c, fir_type)}

   /* case "DspComplex-FixedPoint" => dsptools.Driver.execute(() => new SCIEPipelined(params, DspComplex(FixedPoint(chisel3.internal.firrtl.Width
    (width), binarypoint.BP), FixedPoint(chisel3.internal.firrtl.Width(width), binarypoint.BP))), testOptions){ c =>
      new SCIEComplexSpec(params, c)}

    case "DspComplex-Real" => dsptools.Driver.execute(() => new SCIEPipelined(params, DspComplex(new DspReal, new DspReal)), testOptions){ c =>
      new SCIEComplexSpec(params, c)}

    case "DspComplex-SInt" => dsptools.Driver.execute(() => new SCIEPipelined(params, DspComplex(new DspReal, new DspReal)), testOptions){ c =>
      new SCIEComplexSpec(params, c)}*/
  }
})

object SCIETest extends StageMain(new SCIETesterStage)
