package scie

import chisel3.experimental.FixedPoint
import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
import dsptools.numbers.{DspComplex, DspReal}
import firrtl.options.StageMain
import params.GenericTesterStage


class SCIEUnpipelineGenStage extends GenericTesterStage((params, _) => {
  val width = params.getInt("width")
  val module_type = params.getString("type")
  val binarypoint = params.getInt("binarypoint")

  module_type match{
    case "signed" | "1" => (new chisel3.stage.ChiselStage).execute(
    Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new SCIEUnpipelined(params,UInt(chisel3.internal.firrtl.Width
    (width))))))

    case "fixed-point" | "2" => (new chisel3.stage.ChiselStage).execute(
      Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
      Seq(ChiselGeneratorAnnotation(() => new SCIEPipelined(params, FixedPoint(chisel3.internal.firrtl.Width
      (width), binarypoint.BP)))))
  }})


class SCIEPipelineGenStage extends GenericTesterStage((params, _) => {
  val width = params.getInt("width")

  (new chisel3.stage.ChiselStage).execute(
      Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
      Seq(ChiselGeneratorAnnotation(() => new SCIEPipelined(params, SInt(chisel3.internal.firrtl.Width
      (width))))))
  })

class SCIEDecoderGenStage extends GenericTesterStage((_,_) => {
  (new chisel3.stage.ChiselStage).execute(
    Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new SCIEDecoder)))})

object SCIEDecoderGen extends StageMain(new SCIEDecoderGenStage)

object SCIEUnpipelinedGen extends StageMain(new SCIEUnpipelineGenStage)

object SCIEPipelinedGen extends StageMain(new SCIEPipelineGenStage)
