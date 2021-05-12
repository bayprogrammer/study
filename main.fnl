(var rect { :x 0 :y 0 :w 200 :h 150 :dx 200 :dy 100 })

(fn rect.update! [self dt]
  (if (self:invert-dx?) (self:invert-dx!))
  (if (self:invert-dy?) (self:invert-dy!))
  (set self.x (+ self.x (* self.dx dt)))
  (set self.y (+ self.y (* self.dy dt))))

(fn rect.draw! [self]
  (love.graphics.rectangle :line self.x self.y self.w self.h))

(fn rect.invert-dx? [self]
  (or (< self.x 0)
      (> self.x (- (love.graphics.getWidth) self.w))))

(fn rect.invert-dy? [self]
  (or (< self.y 0)
      (> self.y (- (love.graphics.getHeight) self.h))))

(fn rect.invert-dx! [self] (set self.dx (* -1 self.dx)))

(fn rect.invert-dy! [self] (set self.dy (* -1 self.dy)))

(fn love.load [])

(fn love.update [dt]
  (rect:update! dt))

(fn love.draw []
  (rect:draw!))
