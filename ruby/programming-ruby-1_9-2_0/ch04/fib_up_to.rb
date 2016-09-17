def fib_up_to(max)
  i1, i2 = 1, 1
  while i1 <= max
    yield i1
    i1, i2 = i2, i1+i2
  end
end

fib_up_to(1000) {|f| print f, " " }
puts

# experiments on my own below this comment

fibs = []
fib_up_to(1000) {|f| fibs.push f }
p fibs
