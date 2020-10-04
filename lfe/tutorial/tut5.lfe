(defmodule tut5
  (export (convert-length 1)))

(defun convert-length
  ([(tuple 'centimetre x)] (tuple 'inch (/ x 2.54)))
  ([(tuple 'inch y)] (tuple 'centimetre (* y 2.54))))