# sbt-scalatest-runner

This is a Scala 2.12 runner that fetches dependencies using sbt, and executes tests using scalatest.

## How to Use

In order to use this runner for your project, edit the `codingame.yml` file and add the following lines to your project:

```yaml
    runner:
      name: codingame/sbt-scalatest-runner
      version: 1.0.1-scala-2.12
```

## Example

We're using the following project:

```
.
├── build.sbt
├── codingame.yml
└── src
    ├── main
    │   └── scala
    │       └── example
    │           └── Hello.scala
    └── test
        └── scala
            └── example
                └── HelloSpec.scala
```

In this example, the user is asked to write a hello world (in `Hello.scala`):

```scala
package example

object Hello extends Greeting with App {
  println(greeting)
}

trait Greeting {
  lazy val greeting: String = "hello"
}
```

In order to test the answer, the following unit test is created (in `HelloSpec.scala`):

```scala
package example

import org.scalatest._

class HelloSpec extends FlatSpec with Matchers {
  "The Hello object" should "say hello" in {
    Hello.greeting shouldEqual "hello"
  }
}
```

The sbt build configuration is:

```
organization := "com.example"
version := "0.1.0-SNAPSHOT"
name := "Hello world"
scalaVersion := "2.12.0"

libraryDependencies += "org.scalatest" %% "scalatest" % "3.0.0"
```

In the markdown file, the unit test can be called using:

```markdown
@[Hello world!]({"stubs":["src/main/scala/example/Hello.scala"], "command":"example.HelloSpec"})
```
