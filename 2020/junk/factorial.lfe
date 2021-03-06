#!/usr/bin/env lfescript
;; -*- mode: lfe -*-
;;! -smp enable -sname factorial -mnesia debug verbose

(defun main
  ([(list string)]
   (try
       (let* ((n (list_to_integer string))
	      (f (fac n)))
	 (lfe_io:format "factorial ~w = ~w\n" (list n f)))
     (catch
       ((tuple _ _ _) (usage)))))
  ([_] (usage)))

(defun fac
  ([0] 1)
  ([n] (* n (fac (- n 1)))))

(defun usage ()
  ;;(lfe_io:format "usage: factorial integer\n" ())
  (: lfe_io format "usage: factorial integer\n" ())
  (: lfe_io read "Hello? "))