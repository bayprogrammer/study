if false then
  love.draw = function()
    love.graphics.print("Hello, Love 2D world!", 100, 100)
    love.graphics.circle("fill", 10, 10, 100, 25)
    love.graphics.rectangle("line", 200, 30, 120, 100)
    return love.graphics.rectangle("fill", 100, 200, 50, 80)
  end
end
local x = 0
love.load = function()
  x = 0
  return nil
end
love.update = function(dt)
  print(dt)
  x = (x + (100 * dt))
  return nil
end
love.draw = function()
  return love.graphics.rectangle("line", x, 50, 200, 150)
end
return love.draw
