#!/usr/bin/env scala

import scala.collection.mutable
import scala.collection.immutable.HashSet

val movieSet = mutable.Set("Hitch", "Poltergeist")
movieSet += "Shrek"
//movieSet.+=("Shrek")
// NOT equivalent to `movieSet = movieSet + "Shrek"`, which would create a new
// list replacing the old one
println(movieSet)

val hashSet = HashSet("Tomatoes", "Chilies")
println(hashSet + "Coriander")
