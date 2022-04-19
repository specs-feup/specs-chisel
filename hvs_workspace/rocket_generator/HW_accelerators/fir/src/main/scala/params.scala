package params

import chisel3.stage.ChiselCli
import firrtl.AnnotationSeq
import firrtl.annotations.{Annotation, NoTargetAnnotation}
import firrtl.options.{HasShellOptions, Shell, ShellOption, Stage, Unserializable}
import firrtl.stage.FirrtlCli

trait TesterAnnotation {
  this: Annotation =>
}

case class TestParams(params: Map[String, String] = Map.empty) {
  val defaults: collection.mutable.HashMap[String, String] = new collection.mutable.HashMap()

  def getInt(key:     String): Int = params.getOrElse(key, defaults(key)).toInt
  def getBoolean(key: String): Boolean = params.getOrElse(key, defaults(key)).toBoolean
  def getString(key:  String): String = params.getOrElse(key, defaults(key))
}

case class TesterParameterAnnotation(paramString: TestParams)
  extends TesterAnnotation
    with NoTargetAnnotation
    with Unserializable

object TesterParameterAnnotation extends HasShellOptions {
  val options = Seq(
    new ShellOption[Map[String, String]](
      longOption = "params",
      toAnnotationSeq = (a: Map[String, String]) => Seq(TesterParameterAnnotation(TestParams(a))),
      helpText = """e.g. --params "order=7,width=16" """
    )
  )
}

trait TesterCli {
  this: Shell =>
  Seq(TesterParameterAnnotation).foreach(_.addOptions(parser))
}

class GenericTesterStage(thunk: (TestParams, AnnotationSeq) => Unit) extends Stage {
  val shell: Shell = new Shell("chiseltest") with TesterCli with ChiselCli with FirrtlCli

  def run(annotations: AnnotationSeq): AnnotationSeq = {
    val params = annotations.collectFirst { case TesterParameterAnnotation(p) => p }.getOrElse(TestParams())

    thunk(params, annotations)
    annotations
  }
}
