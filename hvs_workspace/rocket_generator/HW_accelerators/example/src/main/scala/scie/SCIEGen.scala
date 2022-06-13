package scie

import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
import firrtl.options.StageMain
import params.GenericTesterStage


class SCIEUnpipelineGenStage extends GenericTesterStage((params, _) => {
  (new chisel3.stage.ChiselStage).execute(
    Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new SCIEUnpipelined(params))))})

class SCIEPipelineGenStage extends GenericTesterStage((params, _) => {
  (new chisel3.stage.ChiselStage).execute(Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new SCIEPipelined(params, UInt(chisel3.internal.firrtl.Width
    (width))))))

class SCIEDecoderGenStage extends GenericTesterStage((_,_) => {
  (new chisel3.stage.ChiselStage).execute(
    Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new SCIEDecoder)))})

object SCIEDecoderGen extends StageMain(new SCIEDecoderGenStage)

object SCIEUnpipelinedGen extends StageMain(new SCIEUnpipelineGenStage)

object SCIEPipelinedGen extends StageMain(new SCIEPipelineGenStage)
