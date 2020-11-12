package modules

import chisel3.Wire

class LeftShift(bitWidth : Int) extends FunctionalUnit(bitWidth) {
    val z1 = Wire(io.ina << io.inb);
    this.io.out := z1.asUInt();

    override def getName(): String = this.getClass.getSimpleName;
}
