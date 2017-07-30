#!/usr/bin/env scala

// List is similar to Array, but is immutable (unlike Array)
val oneTwoThree = List(1, 2, 3)

val oneTwo = List(1, 2)
val threeFour = List(3, 4)
val oneTwoThreeFour = oneTwo ::: threeFour
println(oneTwo + " and " + threeFour + " were not mutated.")
println("Thus, " + oneTwoThreeFour + " is a new list.")

// cons!
val twoThree = List(2, 3)
val oneTwoThree_ = 1 :: twoThree
//val oneTwoThree_ = twoThree.::(1)
//val oneTwoThree = 1 :: 2 :: 3 :: Nil
println(oneTwoThree_)

/* "Cons prepends a new element to the beginning of an existing list and
 * returns the resulting list."
 */
