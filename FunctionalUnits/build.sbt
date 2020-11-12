val defaultVersions = Seq(
    "chisel-iotesters" -> "1.5.0",
    "chisel3" -> "3.4.0"
)

lazy val root = project
        .in(file("."))
        .settings(
            name := "FunctionalUnits",
            version := "0.1.0",
            scalaVersion := "2.12.10",
            scalacOptions += "-Xsource:2.11",
            libraryDependencies += "com.novocode" % "junit-interface" % "0.11" % "test",
            libraryDependencies ++= defaultVersions.map { case (dep, ver) =>
                "edu.berkeley.cs" %% dep % sys.props.getOrElse(dep + "Version", ver)
            }
        )

