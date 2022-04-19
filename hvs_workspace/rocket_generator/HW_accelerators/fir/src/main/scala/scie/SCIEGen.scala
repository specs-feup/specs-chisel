package scie

import chisel3.stage.ChiselGeneratorAnnotation
import firrtl.options.StageMain
import firrtl.transforms.RemoveReset
import params.GenericTesterStage


class SCIEUnpipelineGenStage extends GenericTesterStage((params, annotations) => {
  (new chisel3.stage.ChiselStage).execute(
    Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new SCIEUnpipelined(params))))})

class SCIEPipelineGenStage extends GenericTesterStage((params,annotations) => {
   (new chisel3.stage.ChiselStage).execute(
    Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new SCIEPipelined(params))))})

class SCIEDecoderGenStage extends GenericTesterStage((params,annotations) => {
  (new chisel3.stage.ChiselStage).execute(
    Array("--emission-options=disableMemRandomization,disableRegisterRandomization","-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new SCIEDecoder)))})


object SCIEDecoderGen extends StageMain(new SCIEDecoderGenStage)

object SCIEUnpipelinedGen extends StageMain(new SCIEUnpipelineGenStage)

object SCIEPipelinedGen extends StageMain(new SCIEPipelineGenStage)
