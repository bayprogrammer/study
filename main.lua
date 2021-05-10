if false then
  love.draw = function()
    love.graphics.print("Hello, Love 2D world!", 100, 100)
    love.graphics.circle("fill", 10, 10, 100, 25)
    love.graphics.rectangle("line", 200, 30, 120, 100)
    return love.graphics.rectangle("fill", 100, 200, 50, 80)
  end
end
local x = 0
local y = 0
local dx = 200
local dy = 100
local W = 600
local H = 450
love.load = function()
  x = 0
  return nil
end
love.update = function(dt)
  if (x > W) then
    dx = -200
  elseif (x < 0) then
    dx = 200
  end
  if (y > H) then
    dy = -100
  elseif (y < 0) then
    dy = 100
  end
  x = (x + (dx * dt))
  y = (y + (dy * dt))
  return nil
end
love.draw = function()
  return love.graphics.rectangle("line", x, y, 200, 150)
end
return love.draw
