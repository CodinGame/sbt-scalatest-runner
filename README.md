# sbt-scalatest-runner

This is a Scala 2.12 runner that fetches dependencies using sbt, and executes tests using scalatest.

## How to Use

In order to use this runner for your project, edit the `codingame.yml` file and add the following lines to your project:

```yaml
    runner:
      name: codingame/sbt-scalatest-runner
      version: 1.0-scala-2.12
```

## Example

In this example, the user is asked to write a hello world (file `src/main/scala/example/Hello.scala`):

```scala
package example

object Hello extends Greeting with App {
  println(greeting)
}

trait Greeting {
  lazy val greeting: String = "hello"
}
```

In order to test the answer, the following unit test is created (file `src/test/scala/example/HelloSpec.scala`):

```scala
package example

import org.scalatest._

class HelloSpec extends FlatSpec with Matchers {
  "The Hello object" should "say hello" in {
    Hello.greeting shouldEqual "hello"
  }
}
```

In the markdown file, the unit test can be called using:

```markdown
@[Hello world!]({"stubs":["src/main/scala/example/Hello.scala"], "command":"example.HelloSpec"})
```
