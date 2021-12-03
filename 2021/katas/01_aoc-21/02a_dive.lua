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

BorkedAutopilot = Position:new()

function BorkedAutopilot:forward(by)
  self:dec_z(by)
end

function BorkedAutopilot:down(by)
  self:dec_y(by)
end

function BorkedAutopilot:up(by)
  self:inc_y(by)
end

local pilot = BorkedAutopilot:new()
for command_pair in gets(io.stdin) do
  command, by = unpack(split(command_pair))
  pilot:send(command, by)
end

p(pilot:status_report())
