#!/usr/bin/env ruby

def my_if(condition, then_clause, else_clause)
  if condition
    then_clause.call
  else
    else_clause.call
  end
end

5.times do |val|
  my_if val < 2,
        -> { puts "#{val} is small" },
        -> { puts "#{val} is big" }
end

def my_while(cond, &body)
  while cond.call
    body.call
  end
end

a = 0

my_while -> { a < 3 } do
  puts a
  a += 1
end
