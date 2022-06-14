package scie

import chisel3._
import chisel3.experimental.FixedPoint
import dsptools.numbers.{DspComplex, DspReal, Real, Ring}
import dsptools.{DspTester, DspTesterOptions, DspTesterOptionsManager}
import firrtl.options.StageMain
import params._
import breeze.math.Complex
import scala.util.Random

class SCIESpecComplex[T<:DspComplex[_]](testParams : TestParams, c: SCIEPipelined[T], fir_type : String) extends DspTester(c) {
  val order = testParams.getInt("order")
  val data_size = testParams.getInt("data")
  val width = testParams.getInt("width")
  val binarypoint = testParams.getInt("binarypoint")
  var acc = (0, 0)

  var input_coeffs : Array[Complex] = new Array[Complex](order)
  var input_data : Array[Complex] = new Array[Complex](data_size)

  fir_type match{
    case "DspComplex" | "4" => input_coeffs = Array.fill(order)(Complex(Random.between(1, 101) - 50, Random.between(1, 101) - 50))
      input_data = Array.fill(data_size)(Complex(Random.between(1, 101) - 50, Random.between(1, 101) - 50))

    case "DspComplex-FixedPoint" | "5" =>  input_coeffs = Array.fill(order)(Complex(BigDecimal(Random.nextDouble * 100 - 50).setScale(8, BigDecimal.RoundingMode.DOWN).toDouble, BigDecimal(Random.nextDouble * 100 - 50).setScale(8, BigDecimal.RoundingMode.DOWN).toDouble))
      input_data = Array.fill(data_size)(Complex(BigDecimal(Random.nextDouble * 100 - 50).setScale(8, BigDecimal.RoundingMode.DOWN).toDouble, BigDecimal(Random.nextDouble * 100 - 50).setScale(8, BigDecimal.RoundingMode.DOWN).toDouble))

  //  case "DspComplex-Real" | "7" => input_coeffs = Array.fill(order)(DspComplex(Random.nextFloat, Random.nextFloat))
   //   input_data = Array.fill(data_size)(DspComplex(Random.nextFloat, Random.nextFloat))
  }

  for(i <- 0 until order){
    poke(c.io.valid, true.B)
    poke(c.io.insn, "h0b".U)
    poke(c.io.rs1, input_coeffs(i))
    println("COEFFICIENT SENT -> " + peek(c.io.rs1) + "\n")
    poke(c.io.rs2, i.U)
    step(1)
    poke(c.io.valid, false.B)
  }


  for(i <- 0 until data_size){
    var acc = Complex(0, 0)
    poke(c.io.valid, true.B)
    poke(c.io.insn, "h2b".U)
    poke(c.io.rs1, input_data(i))
    step(1)
    poke(c.io.valid, false.B)
    step(1)
    poke(c.io.valid, true.B)
    poke(c.io.insn, "h3b".U)
    step(1)
    for(j <- 0 until order){
      if(i - j >= 0)
        acc += input_coeffs(j) * input_data(i - j)
    }
    expect(c.io.rd, acc)
    println("Test Results:\n")
    println("Expected -> " + acc)
    println("Obtained -> " + peek(c.io.rd) + "\n")
    poke(c.io.valid, false.B)
  }
}

class SCIESpec[T<:Data:Ring](testParams : TestParams, c: SCIEPipelined[T], fir_type : String) extends DspTester(c) {
  val order = testParams.getInt("order")
  val data_size = testParams.getInt("data")
  var acc = 0.0
  var input_coeffs = Array.fill(order)(Random.nextFloat * 100)
  var input_data = Array.fill(data_size)(Random.nextFloat * 100)

  fir_type match{
    case "unsigned" | "0" =>  input_coeffs = Array.fill(order)(Random.between(1, 101))
      input_data = Array.fill(data_size)(Random.between(1, 101))
      acc = 0

    case "signed" | "1" =>  input_coeffs = Array.fill(order)(Random.between(1, 101) - 50)
      input_data = Array.fill(data_size)(Random.between(1, 101) - 50)
      acc = 0

    case "FixedPoint" | "2" | "3" =>
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
    poke(c.io.insn, "h3b".U)
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
  params.defaults ++= Seq("order" -> "5", "width" -> "32", "type" -> "0","binarypoint" -> "0")

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
    case "unsigned" | "0" => dsptools.Driver.execute(() => new SCIEPipelined(params, UInt(chisel3.internal.firrtl.Width
    (width))), testOptions){ c =>
      new SCIESpec(params, c, fir_type)}

    case "signed" | "1" => dsptools.Driver.execute(() => new SCIEPipelined(params, SInt(chisel3.internal.firrtl.Width
    (width))), testOptions){ c =>
      new SCIESpec(params, c, fir_type)}

    case "fixed-point" | "2" => dsptools.Driver.execute(() => new SCIEPipelined(params, FixedPoint(chisel3.internal.firrtl.Width(width), binarypoint.BP)),
      testOptions){ c =>
      new SCIESpec(params, c, fir_type)}

    /*case "DspReal" | "3" => dsptools.Driver.execute(() => new SCIEPipelined(params, new DspReal), testOptions){ c =>
      new SCIESpec(params, c, fir_type)}*/

    case "DspComplex" | "4" => dsptools.Driver.execute(() => new SCIEPipelined(params, DspComplex(SInt(chisel3.internal.firrtl.Width
    (width/2)), SInt(chisel3.internal.firrtl.Width
    (width/2)))), testOptions){ c =>
      new SCIESpecComplex(params, c, fir_type)}

    case "DspComplex-FixedPoint" | "5" => dsptools.Driver.execute(() => new SCIEPipelined(params, DspComplex(FixedPoint(chisel3.internal.firrtl.Width(width/2), binarypoint.BP), FixedPoint(chisel3.internal.firrtl.Width(width/2), binarypoint.BP))), testOptions){ c =>
      new SCIESpecComplex(params, c, fir_type)}
  }
})


object SCIETest extends StageMain(new SCIETesterStage)
