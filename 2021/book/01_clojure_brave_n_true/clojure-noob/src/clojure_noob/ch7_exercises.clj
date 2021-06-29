(ns clojure-noob.ch7-exercises)

;; ===== chapter 7, exercise 1 =====

;; I know how to use `list`, `quote`, `read-string`, `println`, and `eval`...
;; but I do not really understand what this exercise is asking me to
;; accomplish.

(eval (list (read-string "println") "Zeb" "Star Trek"))

;; ===== chapter 7, exercise 2 =====

(def op-sym-map
  { + '+
   '+ '+
    - '-
   '- '-
    * '*
   '* '*
    / '/
   '/ '/})

(def op-precedence
  { + :weak
   '+ :weak
    - :weak
   '- :weak
    * :strong
   '* :strong
    / :strong
   '/ :strong})





;; TODO(zmd): grouping not working correctly yet for higher precedence
;;   operators; we're grouping left too eagerly (we need to check the next op
;;   first?)
(defn group [[expr op :as exprs]]
  (cond
    (nil? op)
      expr
    :else
      (let [precedence (get op-precedence op)]
        (case precedence
          :weak   (group-left exprs)
          :strong (group-right exprs)))))

;;
;; TODO(zmd): normalize ops to syms
;;

(defn group-left [[expr1 op expr2 & exprs]]
  (cond
    (nil? op) expr1
    :else (group (cons (list expr1 op expr2) exprs))))

(defn group-right [[expr op & exprs]]
  (cond
    (nil? op) expr
    :else (list expr op (group exprs))))

;; (group '(1 + 2 - 3 + 4 - 5))
;; (group '(1 + 2 * 3 + 4 / 5))
;; (group '(1 / 2 * 3 * 4 / 5))





(defn infix->prefix []
  ;; TODO(zmd): implement me
  )

;; (infix->prefix '(1 + 3 * 4 - 5))
;; (eval (infix->prefix '(1 + 3 * 4 - 5)))
;; (infix->prefix (list 1 + 3 * 4 - 5))
;; (eval (infix->prefix (list 1 + 3 * 4 - 5)))

;; (infix->prefix '(1 + 24 / 2 - 5))
;; (eval (infix->prefix '(1 + 24 / 2 - 5)))
;; (infix->prefix (list 1 + 24 / 2 - 5))
;; (eval (infix->prefix (list 1 + 24 / 2 - 5)))

;; (infix->prefix '(2 * 3 + 8 / 2))
;; (eval (infix->prefix '(2 * 3 + 8 / 2)))
;; (infix->prefix (list 2 * 3 + 8 / 2))
;; (eval (infix->prefix (list 2 * 3 + 8 / 2)))

