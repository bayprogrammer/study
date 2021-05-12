local rect = {dx = 200, dy = 100, h = 150, w = 200, x = 0, y = 0}
rect["update!"] = function(self, dt)
  if self["invert-dx?"](self) then
    self["invert-dx!"](self)
  end
  if self["invert-dy?"](self) then
    self["invert-dy!"](self)
  end
  self.x = (self.x + (self.dx * dt))
  self.y = (self.y + (self.dy * dt))
  return nil
end
rect["draw!"] = function(self)
  return love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end
rect["invert-dx?"] = function(self)
  return ((self.x < 0) or (self.x > (love.graphics.getWidth() - self.w)))
end
rect["invert-dy?"] = function(self)
  return ((self.y < 0) or (self.y > (love.graphics.getHeight() - self.h)))
end
rect["invert-dx!"] = function(self)
  self.dx = (-1 * self.dx)
  return nil
end
rect["invert-dy!"] = function(self)
  self.dy = (-1 * self.dy)
  return nil
end
love.load = function()
end
love.update = function(dt)
  return rect["update!"](rect, dt)
end
love.draw = function()
  return rect["draw!"](rect)
end
return love.draw
