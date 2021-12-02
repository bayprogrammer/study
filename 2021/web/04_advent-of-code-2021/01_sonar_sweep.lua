#!/usr/bin/env lua

require 'utils'

-- count depth increases
--   $ ./01_sonar_sweep.lua <01_input.txt

function count_increases(numbers)
  local count = 0

  for n, m in window(numbers) do
    if m > n then
      count = count + 1
    end
  end

  return count
end

local numbers = {}
for _, input in ipairs(read_lines(io.stdin)) do
  table.insert(numbers, tonumber(input))
end

local rolling_sums = {}
for x, y, z in window(numbers, 3) do
  table.insert(rolling_sums, x + y + z)
end

print(count_increases(numbers))
print(count_increases(rolling_sums))
