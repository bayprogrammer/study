#!/usr/bin/env lua

--
-- x: -left | right
-- y: -down | up
-- z: -forward | backward
-- r: rotation around x
--
--             ^ +y
--             |  ,-z
--     -x      | /    +x
--     <-------*------->  (r)
--           / |
--        +z'  |
--             V -y
--
Position = { x = 0, y = 0, z = 0, r = 0 }

function Position:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Position:send(method, ...)
  self[method](self, ...)
end

function Position:inc_x(by)
  self.x = self.x + by
end

function Position:dec_x(by)
  self.x = self.x - by
end

function Position:inc_y(by)
  self.y = self.y + by
end

function Position:dec_y(by)
  self.y = self.y - by
end

function Position:inc_z(by)
  self.z = self.z + by
end

function Position:dec_z(by)
  self.z = self.z - by
end

function Position:inc_r(by)
  self.r = self.r + by
end

function Position:dec_r(by)
  self.r = self.r - by
end

function Position:horizontal()
  return -self.z
end

function Position:depth()
  return -self.y
end

function Position:aim()
  return self.r
end

function Position:status_report()
  local d = self:depth()
  local h = self:horizontal()
  local a = self:aim()

  return {depth = d, horizontal = h, aim = a, product = d * h}
end
