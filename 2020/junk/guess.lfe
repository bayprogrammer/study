#!/usr/bin/env lfescript
;; -*- mode: lfe -*-
;;! -smp enable -sname factorial -mnesia debug verbose

(defun main (_)
  (one))

(defun one ()
  (two))

(defun two ()
  (: lfe_io format "Hello, world.\n" ())
  (one))