(defmodule tut4
  (export (convert 2)))

(defun convert
  ((m 'inch) (/ m 2.54))
  ((n 'centimetre) (* n 2.54)))