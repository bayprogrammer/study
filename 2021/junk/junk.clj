
(defn infix->prefix
  ([[n & rst]]
    (if (empty? rst)
      n
      (let [[op & rst] rst
            precedence (get op-precedence op)
            op-fn (get op-fn-map op)]
        ;;(list op n (infix->prefix rst))
        (case precedence
          :weak   (list op n (infix->prefix rst))
          :strong ???
        )))))

;;  (condp = op
;;    '+ [op n [m rst]]
;;    '- [op n [m rst]]
;;    '* [op n m rst]
;;    '/ [op n m rst]))

(let [[a b & r] (list)] [a b r])
(let [[a b & r] (list :foo)] [a b r])
(let [[a b & r] (list :foo :bar)] [a b r])
(let [[a b & r] (list :foo :bar :baz)] [a b r])
(let [[a b & r] (list :foo :bar :baz :quux)] [a b r])
