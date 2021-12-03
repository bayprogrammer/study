#!/usr/bin/env lua

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
function make_position()
  return { x = 0, y = 0, z = 0, r = 0 }
end

function inc_x(pos, by)
  pos.x = pos.x + by
end

function dec_x(pos, by)
  pos.x = pos.x - by
end

function inc_y(pos, by)
  pos.y = pos.y + by
end

function dec_y(pos, by)
  pos.y = pos.y - by
end

function inc_z(pos, by)
  pos.z = pos.z + by
end

function dec_z(pos, by)
  pos.z = pos.z - by
end

function inc_r(pos, by)
  pos.r = pos.r + by
end

function dec_r(pos, by)
  pos.r = pos.r - by
end

function horizontal(pos)
  return -pos.z
end

function depth(pos)
  return -pos.y
end

function aim(pos)
  return pos.r
end

function status_report(pos)
  local d = depth(pos)
  local h = horizontal(pos)
  local a = aim(pos)

  return {depth = d, horizontal = h, aim = a, product = d * h}
end
