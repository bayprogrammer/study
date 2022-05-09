import Dependencies._

lazy val hello = taskKey[Unit]("An example task")
lazy val fooBar = taskKey[String]("A foo task")

// lazy val root = (project in file("."))
// lazy val root = project.in(file("."))
lazy val root = project.in(new File("."))
  .settings(
    inThisBuild(List(
      organization := "com.bayprogrammer",
      scalaVersion := "2.12.1",
      version      := "0.1.0-SNAPSHOT"
    )),
    name   := "Hello",
    hello  := { println("Hello!") },
    fooBar := { println("Foo bar!") ; "Foo" },
    name in fooBar := "fooooooo",
    libraryDependencies += scalaTest % Test,
    scalacOptions := {
      val ur = update.value
      if (false) {
        val x = clean.value
      }
      ur.allConfigurations.take(3)
    },
    /* name in Global := "Baaaaaaaaaar" */
    name in (Global, Global, Global) := "Baaaaaaaaaar"
  )
