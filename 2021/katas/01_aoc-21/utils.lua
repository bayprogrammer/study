function printf(str, ...)
  io.write(string.format(str, ...))
end

function read_lines(fh)
  local lines = {}

  local curr = fh:read("*line")
  while curr do
    table.insert(lines, curr)
    curr = fh:read("*line")
  end

  return lines
end

function gets(fh)
  return function ()
           local curr = fh:read("*line")
           if curr then
             return curr
           end
         end
end

function split(str, split_char, acc)
  acc = acc or {}
  split_char = split_char or " "
  local i, _ = string.find(str, split_char)
  if not i then
    table.insert(acc, str)
    return acc
  else
    segment = string.sub(str, 1, i-1)
    remainder = string.sub(str, i+1)
    table.insert(acc, segment)
    return split(remainder, split_char, acc)
  end
end

function inspect(data, final_char)
  final_char = final_char or '\n'

  if type(data) == 'table' then
    io.write('{')
    local first = true
    local print_key = true

    for k, v in pairs(data) do
      if k then
        if first then
          if k == 1 then print_key = false end
          first = false
        else
          io.write(', ')
        end

        if print_key then
          io.write(k)
          io.write(' = ')
        end

        inspect(v, '')
      end
    end

    io.write('}')
  elseif type(data) == 'string' then
    io.write('"' .. data .. '"')
  elseif type(data) == 'boolean' then
    if data then
      io.write('true')
    else
      io.write('false')
    end
  elseif type(data) == 'nil' then
    io.write('nil')
  elseif type(data) == 'function' then
    io.write('<function>')
  else
    io.write(data)
  end

  io.write(final_char)
end
p = inspect

function slice(tbl, i, n)
  local end_i = i - 1 + n
  return {unpack(tbl, i, end_i)}
end

function count(tbl)
  local counter = 0
  for _, _ in pairs(tbl) do
    counter = counter + 1
  end

  return counter
end

function window(tbl, size)
  size = size or 2
  local curr_i = 1

  return function ()
           local subset = slice(tbl, curr_i, size)
           curr_i = curr_i + 1

           if count(subset) == size then
             return unpack(subset)
           end
         end
end
