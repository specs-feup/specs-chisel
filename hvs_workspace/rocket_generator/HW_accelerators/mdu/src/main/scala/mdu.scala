import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

object main extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new MDU, args)
}

object MDU{
  val MUL = 0.U(3.W)
  val MULH = 1.U(3.W)
  val MULHSU = 2.U(3.W)
  val MULHU = 3.U(3.W)
  val DIV = 4.U(3.W)
  val DIVU = 5.U(3.W)
  val REM = 6.U(3.W)
  val REMU = 7.U(3.W)
  val init_state :: mult_state :: div_state :: Nil = Enum(3)
}

class MDU_IO(width : Int) extends Bundle{
  val A = Input(Bits(width.W))
  val B = Input(Bits(width.W))
  val fn = Input(UInt(3.W))
  val en = Input(Bool())
  val out = Output(Bits(width.W))
  val sys_stall = Output(Bool())
}

class MDU extends Module{
  val io = IO(new MDU_IO(32))
  val is_mult = Wire(Bool())
  val storeReg_A = RegInit(0.U(32.W))
  val storeReg_B = RegInit(0.U(32.W))
  val storeReg64 = RegInit(0.U(64.W))
  val stateReg = RegInit(0.U(2.W))
  val remainder = RegInit(0.U(32.W))
  val divisor = RegInit(0.U(32.W))
  val coefficient = RegInit(0.U(32.W))
  val result = RegInit(0.U(32.W))

  is_mult := (io.fn === MDU.MUL || io.fn === MDU.MULH || io.fn === MDU.MULHSU || io.fn === MDU.MULHU)
  io.sys_stall := ~(stateReg === MDU.init_state)
  io.out := result

  switch(stateReg){
    is(MDU.init_state){
      when(io.en){
        storeReg_A := io.A
        storeReg_B := io.B
        remainder := Mux((io.fn === MDU.DIV || io.fn === MDU.REM) && io.A(31) === 1.U, ~(io.A) + 1.U, io.A)
        divisor := Mux((io.fn === MDU.DIV || io.fn === MDU.REM) && io.B(31) === 1.U, ~(io.B) + 1.U, io.B)
        stateReg := Mux(is_mult, MDU.mult_state, MDU.div_state)
      }
    }
    is(MDU.mult_state){
        storeReg64 := storeReg_A * storeReg_B
        result := Mux(io.fn === MDU.MUL, storeReg64(31, 0), Mux((io.A)(31) =/= (io.B)(31),  Cat(1.U, storeReg64(62, 32)) , storeReg64(63, 32)))
        stateReg := MDU.init_state
    }
    is(MDU.div_state){
      when(remainder >= divisor){
        remainder := remainder - divisor
        coefficient := coefficient + 1.U
      }.otherwise{
        result := Mux(io.fn === MDU.REM || io.fn === MDU.REMU, Mux(io.fn === MDU.REM, Mux((io.A)(31) === 1.U, ~remainder + 1.U, remainder), remainder),
          Mux(io.fn === MDU.DIV, Mux((io.A)(31) =/= (io.B)(31),  ~coefficient + 1.U, coefficient), coefficient))
        stateReg := MDU.init_state
      }
    }
  }
}

class BasicTest extends AnyFlatSpec with ChiselScalatestTester {
  "MDU" should "pass" in {
    test(new MDU()) { m =>
      m.io.fn.poke(0.U) //MUL
      m.io.A.poke("hfffffff0".U) //-16.S
      m.io.B.poke(10.U) // 10.S
      m.io.en.poke(true.B)
      m.clock.step(7)
      m.io.en.poke(false.B)
      m.clock.step(10)
      m.io.out.expect("hffffff60".U)
      m.clock.step(1)
      m.io.fn.poke(6.U) // REM
      m.io.A.poke("hfffffff0".U) //-16.S
      m.io.B.poke("hfffffff6".U) // -10.S
      m.io.en.poke(true.B)
      m.clock.step(7)
      m.io.en.poke(false.B)
      m.clock.step(10)
      m.io.out.expect("hfffffffa".U)
      m.clock.step(1)
    }
  }
}