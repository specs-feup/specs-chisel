package scie

import chisel3.experimental.FixedPoint
import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
import dsptools.numbers.{DspComplex, DspReal}
import firrtl.options.StageMain
import params.GenericTesterStage


class SCIEUnpipelineGenStage extends GenericTesterStage((params, _) => {
  (new chisel3.stage.ChiselStage).execute(
    Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new SCIEUnpipelined(params))))})

class SCIEPipelineGenStage extends GenericTesterStage((params, _) => {
  val fir_type = params.getString("type")
  val width = params.getInt("width")
  val binarypoint = params.getInt("binarypoint")
  fir_type match{

    case "UInt" | "0" => (new chisel3.stage.ChiselStage).execute(
      Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
      Seq(ChiselGeneratorAnnotation(() => new SCIEPipelined(params, UInt(chisel3.internal.firrtl.Width
      (width))))))

    case "SInt" | "1" => (new chisel3.stage.ChiselStage).execute(
      Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
      Seq(ChiselGeneratorAnnotation(() => new SCIEPipelined(params, SInt(chisel3.internal.firrtl.Width
      (width))))))

    case "FixedPoint" | "2" | "3" => (new chisel3.stage.ChiselStage).execute(
      Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
      Seq(ChiselGeneratorAnnotation(() => new SCIEPipelined(params, FixedPoint(chisel3.internal.firrtl.Width
      (width), binarypoint.BP)))))

    /*case "DspReal" | "3" => (new chisel3.stage.ChiselStage).execute(
     Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
     Seq(ChiselGeneratorAnnotation(() => new SCIEPipelined(params, new DspReal))))*/

    case "DspComplex" | "4" => (new chisel3.stage.ChiselStage).execute(
      Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
      Seq(ChiselGeneratorAnnotation(() => new SCIEPipelined(params, DspComplex(SInt(chisel3.internal.firrtl.Width
      (width/2)),SInt(chisel3.internal.firrtl.Width
      (width/2)))))))

    case "DspComplex-FixedPoint" | "5" => (new chisel3.stage.ChiselStage).execute(
      Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
      Seq(ChiselGeneratorAnnotation(() => new SCIEPipelined(params, DspComplex(FixedPoint(chisel3.internal.firrtl.Width
      (width/2), binarypoint.BP), FixedPoint(chisel3.internal.firrtl.Width(width/2), binarypoint.BP))))))

    /*case "DspComplex-Real" | "5" => (new chisel3.stage.ChiselStage).execute(
      Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
      Seq(ChiselGeneratorAnnotation(() => new SCIEPipelined(params, DspComplex(new DspReal, new DspReal)))))*/
  }
  })

class SCIEDecoderGenStage extends GenericTesterStage((_,_) => {
  (new chisel3.stage.ChiselStage).execute(
    Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new SCIEDecoder)))})

object SCIEDecoderGen extends StageMain(new SCIEDecoderGenStage)

object SCIEUnpipelinedGen extends StageMain(new SCIEUnpipelineGenStage)

object SCIEPipelinedGen extends StageMain(new SCIEPipelineGenStage)
