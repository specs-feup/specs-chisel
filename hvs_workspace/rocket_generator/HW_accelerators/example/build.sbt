ThisBuild / scalaVersion     := "2.13.7"
ThisBuild / version          := "2.5.0"
ThisBuild / organization     := "edu.berkeley.cs"

val chiselVersion = "3.5.1"

lazy val root = (project in file("."))
  .settings(
    name := "scie",
    libraryDependencies ++= Seq(
      "edu.berkeley.cs" %% "chisel3" % chiselVersion,
      "edu.berkeley.cs" %% "chiseltest" % "0.5.0",
      "edu.berkeley.cs" %% "dsptools" % "1.5.0"
    ),
    scalacOptions ++= Seq(
      "-language:reflectiveCalls",
      "-deprecation",
      "-feature",
      "-Xcheckinit",
    ),
    addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % chiselVersion cross CrossVersion.full),
  )