#!/usr/bin/env ruby

# Usage example: ./fuel_calculator.rb <01_input.txt
# Completed by Zeb DeOs on 1 Dec 2019.

def fuel_needed(module_mass)
  needed = module_mass / 3 - 2
  return 0 if needed < 1
  needed + fuel_needed(needed)
end

sum = 0
while line = $stdin.gets
  sum += fuel_needed(line.to_i)
end

puts sum
