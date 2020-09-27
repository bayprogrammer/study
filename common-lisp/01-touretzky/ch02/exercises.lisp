(defun my-second (lst)
  (first (rest lst)))

;; exercise 2.8
;;(defun my-third (lst)
;;  (first (rest (rest lst))))

;; exercise 2.9
(defun my-third (lst)
  (my-second (rest lst)))

;; exercise 2.18
(defun my-list (x y)
  (cons x (cons y nil)))

(defun blurt (noun abjective)
  (list noun 'is 'a abjective))

(defun say-what (lst)
  (cons 'what (rest lst)))

;; exercise 2.21
(defun pairs (w x y z)
  (list (list w x) (list y z)))

;; exercise 2.22
(defun duo-cons (x y lst)
  (cons x (cons y lst)))

;; exercise 2.23a
(defun two-deeper (x)
  (list (list x)))

;; exercise 2.23b
;;(defun two-deeper (x)
;;  (cons (cons x nil) nil))
