package scie

import chisel3._
import chisel3.experimental.FixedPoint
import dsptools.numbers.Order
import dsptools.{DspTester, DspTesterOptions, DspTesterOptionsManager}
import firrtl.options.StageMain
import params._

import scala.util.Random

class SCIESpec[T<:Data:Order](testParams : TestParams, c: SCIEUnpipelined[T]) extends DspTester(c) {
  var data_size=100
  var expected= -1.0

  var data = Array.fill(data_size)(Random.between(1, 101) - 50)

  testParams.getString("type") match{

    case "signed" | "1" =>

    case "fixed-point" | "2" => Array.fill(data_size)((Random.nextFloat * 100) - 50.0)
  }


  for(i<-0 until data_size){
    expected = if(data(i) > 0) data(i) else 0
    poke(c.io.insn, "h7b".U)
    poke(c.io.rs1, data(i))
    expect(c.io.rd, expected)
    expected = -1.0
  }
}


class SCIETesterStage extends GenericTesterStage((params, _) => {
  params.defaults ++= Seq("width" -> "32", "type" -> "1","binarypoint" -> "0")

  val testOptions = new DspTesterOptionsManager {
    dspTesterOptions = DspTesterOptions(
      fixTolLSBs = 2,
      genVerilogTb = true,
      isVerbose = true)
  }

  val width = params.getInt("width")
  val module_type = params.getString("type")
  val binarypoint=params.getInt("binarypoint")

  module_type match{
    case "signed" | "1" => dsptools.Driver.execute(() => new SCIEUnpipelined(params, SInt(chisel3.internal.firrtl.Width
    (width))), testOptions){ c =>
      new SCIESpec(params, c)}

    case "fixed-point" | "2" => dsptools.Driver.execute(() => new SCIEUnpipelined(params, FixedPoint(chisel3.internal.firrtl.Width
    (width), binarypoint.BP)), testOptions){ c =>
      new SCIESpec(params, c)}
  }
})


object SCIETest extends StageMain(new SCIETesterStage)
