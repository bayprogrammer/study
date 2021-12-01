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

function map(tbl, cb)
  local new_tbl = {}

  local i = 1
  local curr = tbl[i]
  while curr do
    table.insert(new_tbl, cb(curr))

    i = i+1
    curr = tbl[i]
  end

  return new_tbl
end

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

function count_increases(numbers)
  local count = 0

  for n, m in window(numbers) do
    if m > n then
      count = count + 1
    end
  end

  return count
end

local numbers = map(
  read_lines(io.stdin),
  function (e)
    return tonumber(e)
  end
)

print(count_increases(numbers))
