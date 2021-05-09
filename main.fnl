(if false
  (fn love.draw []
    (love.graphics.print "Hello, Love 2D world!" 100 100)
    (love.graphics.circle :fill 10 10 100 25)
    (love.graphics.rectangle :line 200 30 120 100)
    (love.graphics.rectangle :fill 100 200 50 80)))

(var x 0)

(fn love.load []
  (set x 0))

(fn love.update [dt]
  (print dt)
  (set x (+ x (* 100 dt))))

(fn love.draw []
  ;;                        mode   x  y   w   h
  (love.graphics.rectangle :line   x 50 200 150))
