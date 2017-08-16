package example

object Hello extends Greeting with App {
  println(greeting)

  val csa = new ChecksumAccumulator
  csa.add(0x1)
  csa.add(0x1)
  println(csa.checksum())
}

trait Greeting {
  lazy val greeting: String = "hello"
}
