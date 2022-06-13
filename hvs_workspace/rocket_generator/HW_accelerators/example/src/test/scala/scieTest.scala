package scie

import Chisel.iotesters.PeekPokeTester
import chisel3._
import firrtl.options.StageMain
import params._


class SCIESpec[T<:Data:Ring](testParams : TestParams, c: SCIEPipelined[T]) extends PeekPokeTester(c) {


}


class SCIETesterStage extends GenericTesterStage((params, _) => {


})


object SCIETest extends StageMain(new SCIETesterStage)
