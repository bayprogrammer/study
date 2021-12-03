#!/usr/bin/env lua

require 'utils'
require 'dive_utils'

function reload()
  dofile('utils.lua')
  dofile('dive_utils.lua')
  dofile('02a_dive.lua')
end

-- pre-RTFM dive calculator
--   $ ./02a_dive.lua <02_input.txt

function forward(pos, by)
  dec_z(pos, by)
end

function down(pos, by)
  dec_y(pos, by)
end

function up(pos, by)
  inc_y(pos, by)
end

local pos = make_position()
for command_pair in gets(io.stdin) do
  command, by = unpack(split(command_pair))
  _G[command](pos, by)
end

p(status_report(pos))
