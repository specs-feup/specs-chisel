package pt.inesctec.modules.functionalUnit.data

import chisel3.core.fromIntToWidth
import chisel3.internal.sourceinfo.SourceInfo
import chisel3.{CompileOptions, Data, Printable, UInt}

object Data8 extends Data {
  def apply() = UInt(8.W)

  override def cloneType: Data8.this.type = ???

  override def litOption(): Option[BigInt] = ???

  override def do_asUInt(implicit sourceInfo: SourceInfo, compileOptions: CompileOptions): UInt = ???

  override def toPrintable: Printable = ???
}