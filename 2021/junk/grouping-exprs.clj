;;
;; NOTE(zmd): doesn't try to handle sub expression groupings being defined in
;;   the input list, yet
;;

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

(op>= '+ '+)
(op>= '+ '-)
(op>= '- '+)
(op>= '* '+)
(op>= '+ '*)
(op>= '* '/)
(op>= '/ '*)
(op>= '- '*)
(op>= '* '-)
(op>= '+ nil)

(defn group-right [[x op1 y op2 z & exprs]]
  (cons (list x op1 (list y op2 z)) exprs))

(group-right '(1 + 2 - 3 + 4 - 5))
(group-right '(1 / 2 * 3 * 4 / 5))
(group-right '(1 + 2 * 3 + 4 / 5))

(defn group-left [[x op y & exprs]]
  (cons (list x op y) exprs))

(group-left '(1 + 2 - 3 + 4 - 5))
(group-left '(1 / 2 * 3 * 4 / 5))
(group-left '(1 + 2 * 3 + 4 / 5))

(defn group-current [[_ op1 _ op2 :as exprs]]
  (if (op>= op1 op2)
    (group-left exprs)
    (group-right exprs)))

(group-current '(1 + 2 - 3 + 4 - 5))
(group-current '(1 / 2 * 3 * 4 / 5))
(group-current '(1 + 2 * 3 + 4 / 5))

(defn group [[expr op :as exprs]]
  (if (nil? op)
    expr
    (group (group-current exprs))))

(group ())
(group '(1))
(group '(1 + 2 - 3 + 4 - 5))
(group '(1 / 2 * 3 * 4 / 5))
(group '(1 + 2 * 3 + 4 / 5))

;; -----

(defn print-group-input-output [input]
  (let [output (group input)]
    (println (str input " -> " output))))

(print-group-input-output ())
(print-group-input-output '(1))
(print-group-input-output '(1 + 2 - 3 + 4 - 5))
(print-group-input-output '(1 / 2 * 3 * 4 / 5))
(print-group-input-output '(1 + 2 * 3 + 4 / 5))
