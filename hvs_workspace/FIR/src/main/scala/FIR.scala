import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

object FIR{
  val init_state :: exec_state :: Nil = Enum(3)
}

class FIR(length : Int) extends Module{
   val io = IO(new Bundle{
     val data = Input(UInt(32.W))
     val recv_signal = Input(Bool())
     val exec_signal = Input(Bool())
     val out = Output(UInt(32.W))
     val sum = Output(UInt(32.W))
   })

  val coeffs = RegInit(VecInit(Seq.fill(length)(0.U(32.W))))
  val taps = RegInit(VecInit(Seq.fill(length)(0.U(32.W))))
  val coeff_count = RegInit(0.U(5.W))
  val result = RegInit(0.U(32.W))

  when(io.recv_signal){ //Receives data
    when(coeff_count < length.U){
      coeffs(coeff_count) := io.data
      coeff_count := coeff_count + 1.U
    }.otherwise{
      taps.zip(taps.tail).foreach{ case(a, b) => b := a }
      taps(0) := io.data
    }
  }.elsewhen(io.exec_signal){ // Receives exec command
    result := taps.zip(coeffs).map { case (a, b) => a * b }.reduce(_ + _)
  }

  io.sum := Mux(coeff_count === length.U, coeffs.reduce(_+_), 0.U)
  io.out :=  result

}

class test extends AnyFlatSpec with ChiselScalatestTester{
  "FIR" should "pass" in{
    test(new FIR(4)){ f =>
      f.io.data.poke(43.U)
      f.io.recv_signal.poke(true.B)
      f.clock.step(1)
      f.io.recv_signal.poke(false.B)

      f.io.data.poke(32.U)
      f.io.recv_signal.poke(true.B)
      f.clock.step(1)
      f.io.recv_signal.poke(false.B)

      f.io.data.poke(17.U)
      f.io.recv_signal.poke(true.B)
      f.clock.step(1)
      f.io.recv_signal.poke(false.B)

      f.io.data.poke(79.U)
      f.io.recv_signal.poke(true.B)
      f.clock.step(1)
      f.io.recv_signal.poke(false.B)
      f.io.sum.expect(171.U)

      f.io.data.poke(12.U)
      f.io.recv_signal.poke(true.B)
      f.clock.step(1)
      f.io.recv_signal.poke(false.B)

      f.io.exec_signal.poke(true.B)
      f.clock.step(4)
      f.io.exec_signal.poke(false.B)
    //  f.clock.step(3)
      f.io.out.expect(516.U)
    }
  }
}
