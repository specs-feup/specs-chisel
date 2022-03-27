import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

object main extends App{
  (new chisel3.stage.ChiselStage).emitVerilog(new SCIEPipelined(32), args)
}


/*class FIR(length : Int) extends Module{
   val io = IO(new Bundle{
     val data = Input(UInt(32.W))
     val recv_signal = Input(Bool())
     val exec_signal = Input(Bool())
     val out = Output(UInt(32.W))
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
    result := 1.U //É escrita em rd -> 1 sinalizando o sucesso da operação
  }.elsewhen(io.exec_signal){ // Receives exec command
    result := taps.zip(coeffs).map { case (a, b) => a * b }.reduce(_ + _)
  }

  io.out :=  result

}*/


class SCIEPipelinedInterface(xLen: Int) extends Bundle {
  //val clock = Input(Clock())
  val valid = Input(Bool())
  val insn = Input(UInt(xLen.W))
  val rs1 = Input(UInt(xLen.W))
  val rs2 = Input(UInt(xLen.W))
  val rd = Output(UInt(xLen.W))
  val out_valid = Output(Bool())
  val recv_signal = Input(Bool())
  val exec_signal = Input(Bool())
}

//class SCIEPipelined(xLen: Int) extends BlackBox(Map("XLEN" -> xLen)) with HasBlackBoxInline {
class SCIEPipelined(xLen: Int) extends Module{
  val io = IO(new SCIEPipelinedInterface(xLen))

  val coeffs = RegInit(VecInit(Seq.fill(4)(0.U(32.W))))
  val taps = RegInit(VecInit(Seq.fill(4)(0.U(32.W))))
  val coeff_count = RegInit(0.U(5.W))
  val result = RegInit(0.U(32.W))

  when(io.valid) {
    result := 0.U
    when(io.recv_signal) { //Receives data
      when(coeff_count < 4.U) {
        coeffs(coeff_count) := io.rs1
        coeff_count := coeff_count + 1.U
      }.otherwise {
        taps.zip(taps.tail).foreach { case (a, b) => b := a }
        taps(0) := io.rs1
      }
      result := 1.U //rd -> 1 success
    }.elsewhen(io.exec_signal) { // Receives exec command
      result := taps.zip(coeffs).map { case (a, b) => a * b }.reduce(_ + _)
    }
  }

  io.rd := result
  io.out_valid := Mux(result =/= 0.U, true.B, false.B)

}


class test extends AnyFlatSpec with ChiselScalatestTester{
  "FIR" should "pass" in{
    test(new SCIEPipelined(32)){ f =>
      f.io.valid.poke(true.B)
      f.io.rs1.poke(43.U)
      f.io.recv_signal.poke(true.B)
      f.clock.step(1)
      f.io.valid.poke(false.B)

      f.io.valid.poke(true.B)
      f.io.rs1.poke(32.U)
      f.io.recv_signal.poke(true.B)
      f.clock.step(1)
      f.io.valid.poke(false.B)

      f.io.valid.poke(true.B)
      f.io.rs1.poke(17.U)
      f.io.recv_signal.poke(true.B)
      f.clock.step(1)
      f.io.valid.poke(false.B)

      f.io.valid.poke(true.B)
      f.io.rs1.poke(79.U)
      f.io.recv_signal.poke(true.B)
      f.clock.step(1)
      f.io.valid.poke(false.B)

      f.io.valid.poke(true.B) //Envio de dados
      f.io.rs1.poke(12.U)
      f.io.recv_signal.poke(true.B)
      f.clock.step(1)
      f.io.valid.poke(false.B)
      f.io.recv_signal.poke(false.B)

      f.io.valid.poke(true.B)
      f.io.exec_signal.poke(true.B)
      f.clock.step(4)
      f.io.valid.poke(false.B)

      f.io.rd.expect(516.U)

      f.io.valid.poke(true.B)
      f.io.rs1.poke(0.U)
      f.io.recv_signal.poke(true.B)
      f.clock.step(1)
      f.io.valid.poke(false.B)
      f.io.recv_signal.poke(false.B)

      f.io.valid.poke(true.B)
      f.io.exec_signal.poke(true.B)
      f.clock.step(1)
      f.io.valid.poke(false.B)
      f.clock.step(4)
      f.io.valid.poke(false.B)
      f.io.rd.expect(384.U)
    }
  }
}
