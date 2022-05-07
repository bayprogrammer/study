(defmodule gardens-of-mars
  (export (start 0)))

(defun start ()
  (road))

;; NOTE: we can get a function reference (usable by funcall) using #'function/2
;;   nomenclature e.g.: (funcall #'myroom/1 '())

;; THINK: maybe each room function takes a state variable and a inventory
;;   variable; state might include things like the rooms inventory, or objects
;;   and their states; inventory will be player's inventory (which is populated
;;   by getting items from rooms' inventories)
;;
;;   so that we can re-enter the same room (when updating state without moving
;;   between rooms) we need to be able to pass in an option that controls
;;   whether to print the full description, the short description, or nothing
;;   (or even a custom message, like "got lamp")

;; TODO(zmd): we now have an infinte loop; we need a mechanism by which the
;;   user can exit
(defun road ()
  (lfe_io:format "You find yourself at the end of a long road.~n" '())
  ;; TODO(zmd) normalize and parse the read input and decide what to do based
  ;;   on that
  (read)
  (bar))

(defun bar ()
  (lfe_io:format "You enter the bar and wonder about all the patrons.~n" '())
  ;; TODO(zmd) normalize and parse the read input and decide what to do based
  ;;   on that
  (read)
  (road))

(defun read ()
  ;; TODO(zmd): splitting on " " is probably not enough, b/c we want very
  ;;   flexible whitespace delimination; we also want to strip out punctuation
  ;;   and normalize all words (lowercase, etc.) into atoms
  (string:split (string:trim (io:get_line "> ")) " " 'all))
