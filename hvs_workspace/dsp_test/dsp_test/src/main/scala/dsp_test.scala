/*
import chisel3._
import chisel3.experimental.FixedPoint
import dsptools.{DspContext, DspTester, Wrap}
import dsptools.numbers._
import org.scalatest.{FlatSpec}
import spire.algebra.Ring

class FIRIO[T<:Data:Ring](gen:T) extends Bundle{
//class FIRIO extends Bundle{
  val rs1 = Input(gen)
  val rs2 = Input(gen)
  val rd = Output(gen)
 /*val rs1 = Input(DspComplex(UInt(16.W),UInt(16.W)))
val rs2 = Input(DspComplex(UInt(16.W),UInt(16.W)))
val rd = Output(DspComplex(UInt(16.W),UInt(16.W)))*/

}

class FIRModule[T<:Data:Ring](gen:T) extends Module{
//class FIRModule extends Module{
  //val io = IO(new FIRIO(gen))
  val io = IO(new FIRIO(gen))
  //DspContext.alter(DspContext.current.copy(overflowType = Wrap)) {
    io.rd := io.rs1 + io.rs2
  //}
}


class FIRModuleTester[T<:Data:Ring](c:FIRModule[T]) extends DspTester(c){
//class FIRModuleTester(c:FIRModule) extends DspTester(c){
  poke(c.io.rs1.real, 5)
  poke(c.io.rs1.imag, 8)

  poke(c.io.rs2.real, 19)
  poke(c.io.rs2.imag, 33)

  expect(c.io.rd.real,  24)
  expect(c.io.rd.imag,  41)
}


class SimpleDspModuleSpec extends FlatSpec {

  it should "Perform correct operation" in {
   /* chisel3.iotesters.Driver(() => new FIRModule(DspComplex(UInt(16.W), UInt(16.W)))){ c =>
      new FIRModuleTester(c)
    }should be (true)*/
    chisel3.iotesters.Driver(() => new FIRModule(DspComplex(UInt(16.W),UInt(16.W)))){ c =>
      new FIRModuleTester(c)
    }
  }
}*/

import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.stage.ChiselStage
import dsptools.DspTester
import dsptools.numbers._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

//scalastyle:off magic.number

class ParameterizedAdder[T <: Data:Ring](gen:T) extends Module {
  val io = IO(new Bundle {
    val a1: T = Input(gen.cloneType)
    val a2: T = Input(gen.cloneType)
    val c     = Output(gen.cloneType)
  })

  val register1 = Reg(gen.cloneType)

  register1 := io.a1 + io.a2

  io.c := register1
}

class ParameterizedAdderTester[T<:Data:Ring](c: ParameterizedAdder[T]) extends DspTester(c) {
  updatableDspVerbose.withValue(false) {
    for {
      i <- (BigDecimal(-2.0) to 1.0 by 0.25).map(_.toDouble)
      j <- (BigDecimal(-2.0) to 4.0 by 0.5).map(_.toDouble)
    } {
      poke(c.io.a1, i)
      poke(c.io.a2, j)
      step(1)

      val result = peek(c.io.c)

      expect(c.io.c, i + j, s"parameterize adder tester $i + $j => $result should have been ${i + j}")
    }
  }
}

class ParameterizedAdderSpec extends AnyFlatSpec with Matchers {

  behavior of "parameterized adder circuit on blackbox real"

  it should "allow registers to be declared that infer widths" in {
    dsptools.Driver.execute(() => new ParameterizedAdder(new DspReal)) { c =>
      new ParameterizedAdderTester(c)
    } should be (true)
  }

  behavior of "parameterized adder circuit on fixed point"

  it should "allow registers to be declared that infer widths" in {
    dsptools.Driver.execute(() => new ParameterizedAdder(FixedPoint(32.W, 16.BP))) { c =>
      new ParameterizedAdderTester(c)
    } should be (true)

  }
}

object main extends App{
  (new ChiselStage)emitVerilog(new ParameterizedAdder(new DspReal), args)
}