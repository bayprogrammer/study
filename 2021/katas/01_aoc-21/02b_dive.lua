#!/usr/bin/env lua

require 'utils'
require 'dive_utils'

function reload()
  dofile('utils.lua')
  dofile('dive_utils.lua')
  dofile('02b_dive.lua')
end

-- post-RTFM dive calculator
--   $ ./02b_dive.lua <02_input.txt

FixedAutopilot = Position:new()

function FixedAutopilot:forward(by)
  self:dec_z(by)
  self:dec_y(self.r * by)
end

function FixedAutopilot:down(by)
  self:inc_r(by)
end

function FixedAutopilot:up(by)
  self:dec_r(by)
end

local pilot = FixedAutopilot:new()
for command_pair in gets(io.stdin) do
  command, by = unpack(split(command_pair))
  pilot:send(command, by)
end

p(pilot:status_report())
