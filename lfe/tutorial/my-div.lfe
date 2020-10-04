(defmodule my-div
  (export (div 2)
          (div 3)))

(defun div (a b)
  (div a b '()))

(defun div (a b opts)
  (let ((debug (proplists:get_value 'debug opts 'false))
        (ratio? (proplists:get_value 'ratio opts 'false)))
    (if (and debug ratio?)
      (io:format "Returning as ratio ...~n"))
    (if ratio?
      (++ (integer_to_list 1) "/" (integer_to_list 2))
      (/ a b))))