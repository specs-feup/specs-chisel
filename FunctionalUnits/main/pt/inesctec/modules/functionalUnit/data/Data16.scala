package pt.inesctec.modules.functionalUnit.data

object Data16 {
  def apply(): Data16 = new Data16
}

protected class Data16 extends PortData {
  override def width: Int = 16
}
