(defmodule tut8
  (export (format-temps 1)))

;; Only this function is exported
(defun format-temps
  ((())
   ;; No output for an empty list
   'ok)
  (((cons city rest))
   (print-temp (f->c city))
   (format-temps rest)))

(defun f->c
  (((tuple name (tuple 'C temp)))
   ;; No conversion needed
   (tuple name (tuple 'C temp)))
  (((tuple name (tuple 'F temp)))
   ;; Do the conversion
   (tuple name (tuple 'C (/ (* (- temp 32) 5) 9)))))

(defun print-temp
  (((tuple name (tuple 'C temp)))
   (lfe_io:format "~-15w ~w C~n" (list name temp))))
