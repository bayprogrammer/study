#!/usr/bin/env ruby

# Fibonacci Sequence Formula:
# f(1) = 1
# f(2) = 1
# f(n) = f(n-1) + f(n-2)

def fib(n)
  return 0 if n <= 0
  return 1 if n <= 2
  fib(n-1) + fib(n-2)
end

n = (ARGV[0] || 20).to_i
puts fib(n)
