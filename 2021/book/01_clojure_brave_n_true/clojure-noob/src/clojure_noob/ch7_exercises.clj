(ns clojure-noob.ch7-exercises)

;; ===== chapter 7, exercise 1 =====

;; I know how to use `list`, `quote`, `read-string`, `println`, and `eval`...
;; but I do not really understand what this exercise is asking me to
;; accomplish.

(eval (list (read-string "println") "Zeb" "Star Trek"))

;; ===== chapter 7, exercise 2 =====

(def op-score {'+ 0
                + 0
               '- 0
                - 0
               '* 1
                * 1
               '/ 1
                / 1})

(defn op>= [op1 op2]
  (if (nil? op2)
    true
    (>= (get op-score op1) (get op-score op2))))

;; (op>= '+ '+)
;; (op>= '+ '-)
;; (op>= '- '+)
;; (op>= '* '+)
;; (op>= '+ '*)
;; (op>= '* '/)
;; (op>= '/ '*)
;; (op>= '- '*)
;; (op>= '* '-)
;; (op>= '+ nil)

(def op-sym-map
  { + '+
   '+ '+
    - '-
   '- '-
    * '*
   '* '*
    / '/
   '/ '/})

(defn normalize-op [op]
  (get op-sym-map op))

;; (normalize-op +)
;; (normalize-op '+)

(defn infix-right [[x op1 y op2 z & exprs]]
  (let [op1 (normalize-op op1)
        op2 (normalize-op op2)]
    (cons (list op1 x (list op2 y z)) exprs)))

;; (infix-right '(1 + 2 - 3 + 4 - 5))
;; (infix-right '(1 / 2 * 3 * 4 / 5))
;; (infix-right '(1 + 2 * 3 + 4 / 5))

(defn infix-left [[x op y & exprs]]
  (let [op (normalize-op op)]
    (cons (list op x y) exprs)))

;; (infix-left '(1 + 2 - 3 + 4 - 5))
;; (infix-left '(1 / 2 * 3 * 4 / 5))
;; (infix-left '(1 + 2 * 3 + 4 / 5))

(defn infix-current [[_ op1 _ op2 :as exprs]]
  (if (op>= op1 op2)
    (infix-left exprs)
    (infix-right exprs)))

;; (infix-current '(1 + 2 - 3 + 4 - 5))
;; (infix-current '(1 / 2 * 3 * 4 / 5))
;; (infix-current '(1 + 2 * 3 + 4 / 5))

(defn infix->prefix [[expr op :as exprs]]
  (if (nil? op)
    expr
    (recur (infix-current exprs))))

;; (infix->prefix ())
;; (infix->prefix '(1))
;; (infix->prefix '(1 + 2 - 3 + 4 - 5))
;; (infix->prefix '(1 / 2 * 3 * 4 / 5))
;; (infix->prefix '(1 + 2 * 3 + 4 / 5))

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

