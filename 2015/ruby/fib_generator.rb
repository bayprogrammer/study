#!/usr/bin/env ruby

# Fibonacci Sequence Formula:
# f(1) = 1
# f(2) = 1
# f(n) = f(n-1) + f(n-2)

# Using Enumerator as generator per Programming Ruby 1.9 & 2.0, pg. 59
# Using basic non-recursive fib method, also contained earlier in book

fib_generator = Enumerator.new do |yielder|
  n1 = 1
  n2 = 1
  yielder.yield n1
  yielder.yield n2
  loop do
    n1, n2 = n2, n2 + n1
    yielder.yield n2
  end
end

n = (ARGV[0] || 20).to_i
n.times { print fib_generator.next, " " }
puts
