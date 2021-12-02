#!/usr/bin/env lua

-- count depth increases
--   $ ./01_sonar_sweep.lua <01_input.txt

function read_lines(fh)
  local lines = {}

  local curr = fh:read("*line")
  while curr do
    table.insert(lines, curr)
    curr = fh:read("*line")
  end

  return lines
end

-- TODO(zmd): have window accept optional second param that specifies the
--   window frame_size (generalizing so we don't need e.g. window_three())
function window(tbl)
  local curr_i = 1
  local next_i = 2

  return function ()
           local n = tbl[curr_i]
           local m = tbl[next_i]
           curr_i = curr_i + 1
           next_i = next_i + 1

           if n and m then
             return n, m
           else
             return nil
           end
         end
end

function window_three(tbl)
  local x_i = 1
  local y_i = 2
  local z_i = 3

  return function ()
           local x = tbl[x_i]
           local y = tbl[y_i]
           local z = tbl[z_i]
           x_i = x_i + 1
           y_i = y_i + 1
           z_i = z_i + 1

           if x and y and z then
             return x, y, z
           else
             return nil
           end
         end
end

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
for x, y, z in window_three(numbers) do
  table.insert(rolling_sums, x + y + z)
end

print(count_increases(numbers))
print(count_increases(rolling_sums))
