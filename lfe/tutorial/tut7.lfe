(defmodule tut7
  (export (new 4) (blend 2)))

(defmacro channel? (val)
  `(andalso (is_float ,val) (>= ,val 0.0) (=< ,val 1.0)))

(defmacro all-channels? (r g b a)
  `(andalso (channel? ,r)
            (channel? ,g)
            (channel? ,b)
            (channel? ,a)))

(defun new
  ((r g b a) (when (all-channels? r g b a))
   (map 'red r 'green b 'blue b 'alpha a)))

(defun blend (src dst)
  (blend src dst (alpha src dst)))

(defun blend
  ((src dst alpha) (when (> alpha 0.0))
   (map-update dst
               'red (/ (red src dst) alpha)
               'green (/ (green src dst) alpha)
               'blue (/ (blue src dst) alpha)
               'alpha alpha))
  ((_ dst _)
   (map-update dst 'red 0 'green 0 'blue 0 'alpha 0)))

(defun alpha
  (((map 'alpha src-alpha) (map 'alpha dst-alpha))
   (+ src-alpha (* dst-alpha (- 1.0 src-alpha)))))

(defun red
  (((map 'red src-val 'alpha src-alpha)
    (map 'red dst-val 'alpha dst-alpha))
   (+ (* src-val src-alpha)
      (* dst-val dst-alpha (- 1.0 src-alpha)))))

(defun green
  (((map 'green src-val 'alpha src-alpha)
    (map 'green dst-val 'alpha dst-alpha))
   (+ (* src-val src-alpha)
      (* dst-val dst-alpha (- 1.0 src-alpha)))))

(defun blue
  (((map 'blue src-val 'alpha src-alpha)
    (map 'blue dst-val 'alpha dst-alpha))
   (+ (* src-val src-alpha)
      (* dst-val dst-alpha (- 1.0 src-alpha)))))