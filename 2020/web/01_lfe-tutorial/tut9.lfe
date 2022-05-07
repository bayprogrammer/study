(defmodule tut9
  (export
   (list-max-alt 1)
   (list-max 1)
   (list-min 1)))

(defun list-max
  (((cons head tail))
   (list-max tail head)))

(defun list-min
  (((cons head tail))
   (list-min tail head)))

(defun list-max
  (('() results)
   results)
  (((cons head tail) result-so-far) (when (> head result-so-far))
   (list-max tail head))
  (((cons head tail) result-so-far)
   (list-max tail result-so-far)))

(defun list-min
  (('() results)
   results)
  (((cons head tail) result-so-far) (when (< head result-so-far))
   (list-min tail head))
  (((cons head tail) result-so-far)
   (list-min tail result-so-far)))

;; example of using let binding
(defun list-max-alt
  (((cons head tail))
   (list-max-alt tail head)))

(defun list-max-alt
  (('() results)
   results)
  (((cons head tail) result-so-far) (when (> head result-so-far))
   (let ((new-result-so-far head))
     (list-max tail new-result-so-far)))
  (((cons head tail) result-so-far)
   (list-max tail result-so-far)))
