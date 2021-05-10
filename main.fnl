(if false
  (fn love.draw []
    (love.graphics.print "Hello, Love 2D world!" 100 100)
    (love.graphics.circle :fill 10 10 100 25)
    (love.graphics.rectangle :line 200 30 120 100)
    (love.graphics.rectangle :fill 100 200 50 80)))

(var x 0)
(var y 0)
(var dx 200)
(var dy 100)

(local W 600)
(local H 450)

(fn love.load []
  (set x 0))

(fn love.update [dt]
  (if
    (> x W)
      (set dx -200)
    (< x 0)
      (set dx 200))
  (if
    (> y H)
      (set dy -100)
    (< y 0)
      (set dy 100))
  (set x (+ x (* dx dt)))
  (set y (+ y (* dy dt))))

(fn love.draw []
  ;;                        mode   x  y   w   h
  (love.graphics.rectangle :line   x  y 200 150))
