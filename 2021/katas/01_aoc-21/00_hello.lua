#!/usr/bin/env lua

require 'utils'

-- smoke test, are we ready for advent of code 2021?

-- NOTES:
--   * require
--   * dofile (will be useful in repl)

function make_greeter(greeting, punctuation)
  punctuation = punctuation or "."
  return function (name)
           printf("%s, %s%s\n", greeting, name, punctuation)
         end
end

hello_greeter = make_greeter("Hello")
exuberant_hello_greeter = make_greeter("Hello", "!")

hello_greeter("world")
exuberant_hello_greeter("world")
exuberant_hello_greeter("Bob")
