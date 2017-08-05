#!/usr/bin/env scala

import scala.collection.mutable

val treasureMap = mutable.Map[Int, String]()
treasureMap += (1 -> "Go to island.")
treasureMap += (2 -> "Find big X on ground.")
treasureMap += (3 -> "Dig.")
println(treasureMap(2))


val treasureMap2 = mutable.Map(
  1 -> "Go to island.",
  2 -> "Find big X on ground.",
  3 -> "Dig."
)
println(treasureMap2(3))


val treasureMap3 = mutable.Map[Int, String](
  1 -> "Go to island.",
  2 -> "Find big X on ground.",
  3 -> "Dig."
)
println(treasureMap3(1))


// so `1 -> "foo" == (1, "foo")`, interesting... pair's are a thing by
// themselves?
val treasureMap4 = mutable.Map[Int, String](
  (1, "Go to island."),
  (2, "Find big X on ground."),
  (3, "DIGGGGG!")
)
println(treasureMap4(3))

// NO! They're actually two-tuples! Huh!
val foo = (12 -> 22)
println(foo._1)
println(foo._2)

val bar = (24, 44)
println(bar._1)
println(bar._2)

println((1, 2) == (1 -> 2))

// -> is just a method that generates a tuple. Got it!
println((1, 2) == (1).->(2))
