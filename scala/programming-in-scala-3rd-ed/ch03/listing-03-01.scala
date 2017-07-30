#!/usr/bin/env scala

val greetStrings = new Array[String](3)

/* equivalent to:
val greetStrings: Array[String] = new Array[String](3)
 */

greetStrings(0) = "Hello"
greetStrings(1) = ", "
greetStrings(2) = "world!\n"

/* equivalent to:
greetStrings.update(0, "Hello")
greetStrings.update(1, ", ")
greetStrings.update(2, "world!\n")
 */

for (i <- 0 to 2)
  print(greetStrings.apply(i))

/* equivalent to:
for (i <- 0 to 2)
  print(greetStrings.apply(i))
 */
