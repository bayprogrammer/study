(defun add2 (n)
  (+ n 2))

(defun onep (n)
  (equal n 1))

;; exercise 1.4
(defun sub2 (n)
  (- n 2))

;; exercise 1.5
(defun twop (n)
  (zerop (sub2 n)))

;; exercise 1.6a
;;(defun half (n)
;;  (/ n 2))

;; exercise 1.6b
(defun half (n)
  (/ n 2.0))

;; exercise 1.7
(defun multi-digit-p (n)
  (> n 9))

;; exercise 1.9
(defun twomorep (n m)
  (equal n (add2 m)))

;; exercise 1.10
;;(defun twomorep (n m)
;;  (equal (sub2 n) m))

;; exercise 1.11
(defun average (n m)
  (/ (+ n m) 2.0))

;; exercise 1.15
(defun not-onep (n)
  (not (onep n)))

;; exercise 1.16
(defun not-plusp (n)
  (not (> n 0)))

;; exercise 1.17
(defun my-evenp (n)
  (not (oddp n)))

;; exercise 1.20
(defun xor (n m)
  (equal (not n)
         (not (not m))))
