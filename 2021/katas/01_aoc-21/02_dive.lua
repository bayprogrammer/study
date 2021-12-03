#!/usr/bin/env lua

require 'utils'
function reload()
  dofile('utils.lua')
  dofile('02_dive.lua')
end

-- dive calculator
--   $ ./02_dive.lua <02_input.txt

-- x: -left | right
-- y: -down | up
-- z: -forward | backward
--
--             ^+y
--             |  ,-z
--     -x      | /    +x
--     <-------*------->
--           / |
--        +z'  |
--             V-y
--
function make_position()
  return { x = 0, y = 0, z = 0 }
end

function forward(tbl, n)
  tbl.z = tbl.z - n
end

function backward(tbl, n)
  tbl.z = tbl.z + n
end

function horizontal(tbl)
  return -tbl.z
end

function down(tbl, n)
  tbl.y = tbl.y - n
end

function up(tbl, n)
  tbl.y = tbl.y + n
end

function depth(tbl)
  return -tbl.y
end

local pos = make_position()
for command_pair in gets(io.stdin) do
  command, n = unpack(split(command_pair))
  _G[command](pos, n)
end

local d = depth(pos)
local h = horizontal(pos)
p({depth = d, horizontal = h, product = d * h})
