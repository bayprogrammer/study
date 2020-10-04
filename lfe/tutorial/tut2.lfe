(defmodule tut2
  (export (fac 1)))

(defun fac
  ((1) 1)
  ((n) (* n (fac (- n 1)))))