#!/usr/bin/env lua

-- x: -left | right
-- y: -down | up
-- z: -forward | backward
--
--             ^ +y
--             |  ,-z
--     -x      | /    +x
--     <-------*------->
--           / |
--        +z'  |
--             V -y
--
function make_position()
  return { x = 0, y = 0, z = 0 }
end

function dec_z(pos, n)
  pos.z = pos.z - n
end

function inc_z(pos, n)
  pos.z = pos.z + n
end

function horizontal(pos)
  return -pos.z
end

function dec_y(pos, n)
  pos.y = pos.y - n
end

function inc_y(pos, n)
  pos.y = pos.y + n
end

function depth(pos)
  return -pos.y
end

function status_report(pos)
  local d = depth(pos)
  local h = horizontal(pos)

  return {depth = d, horizontal = h, product = d * h}
end
