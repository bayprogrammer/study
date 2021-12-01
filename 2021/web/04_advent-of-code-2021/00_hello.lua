#!/usr/bin/env lua

-- smoke test, are we ready for advent of code 2021?

-- NOTES:
--   * require
--   * dofile (will be useful in repl)

function printf(str, ...)
  print(string.format(str, ...))
end

function make_greeter(greeting, punctuation)
  punctuation = punctuation or "."
  return function (name)
           printf("%s, %s%s", greeting, name, punctuation)
         end
end

hello_greeter = make_greeter("Hello")
exuberant_hello_greeter = make_greeter("Hello", "!")

hello_greeter("world")
exuberant_hello_greeter("world")
exuberant_hello_greeter("Bob")
