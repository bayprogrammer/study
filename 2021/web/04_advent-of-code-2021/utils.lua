function read_lines(fh)
  local lines = {}

  local curr = fh:read("*line")
  while curr do
    table.insert(lines, curr)
    curr = fh:read("*line")
  end

  return lines
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
  else
    io.write(data)
  end

  io.write(final_char)
end

function slice(tbl, i, n)
  end_i = i - 1 + n
  return {unpack(tbl, i, end_i)}
end
