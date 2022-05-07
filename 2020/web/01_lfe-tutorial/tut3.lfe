(defmodule tut3
  (export (fac 1) (mult 2)))

(defun fac
  ((1) 1)
  ((n) (* n (fac (- n 1)))))

(defun mult (x y)
  (* x y))