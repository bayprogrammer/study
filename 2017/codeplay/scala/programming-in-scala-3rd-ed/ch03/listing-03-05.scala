#!/usr/bin/env scala

// Immutable Set is default:
var jetSet = Set("Boeing", "Airbus")
jetSet += "Lear"
println(jetSet.contains("Cessna"))
println(jetSet.contains("Lear"))

// Note on += above:

/*
jetSet = jetSet + "Lear"  // not the += method, which *does* exist on
                          // mutaple sets...
 */

// So += in some contexts is a method, in others it is properly shorthand for
// n = n + x -- I have to admit, that seems inconsistent.

// Did I make a mistake in moving to Scala from Clojure/Scheme? I'm going to
// roll with it anyway. I will, Lord-willing, return to Clojure/Scheme after
// I've done some useful things in Scala/Java land.

// I think (from some compiler output while experimenting with listing 3-5)
// that there's a thing called "converting an expression to an assignment" that
// works when the receiver is assignable, otherwise it's treated as a method?
// Hopefully the book will clarify this as I continue. Pressing on!
