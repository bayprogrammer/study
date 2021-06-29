;; -- destructuring list and vector -------------------------------------------

(def seven-letters-vec '[a b c d e f g])
(def seven-letters-lst '(a b c d e f g))

(let [[fst & rst] seven-letters-vec]
  [fst rst])                          ;=> [a (b c d e f g)]

(let [[fst & rst] seven-letters-lst]
  (list fst rst))                     ;=> (a (b c d e f g))

;; -- -> threading macro? -----------------------------------------------------

(-> 5
    (+ 1)
    (* 2)
    (/ 4))  ;=> 3

(-> {}
    (assoc 2021 []))  ;=> {2021 []}

(-> []
    (assoc 0 "cars")
    (assoc 1 "trucks")
    (assoc 2 "planes"))  ;=> ["cars" "trucks" "planes"]

;; -- cond --------------------------------------------------------------------

;; https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/cond
;; https://clojuredocs.org/clojure.core/cond

(cond
  (= 0 1) :a
  (= 1 0) :b
  (= 1 1) :c
  (= 0 0) :d)

(cond
  (= 0 1) :a
  (= 1 0) :b
  (= 'foo 'bar) :c
  (= 'baz 'quux) :d
  :else 'frobnicate)

;; -- case --------------------------------------------------------------------

;; https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/case
;; https://clojuredocs.org/clojure.core/case

(defn del [arg]
  [arg "deleted"])

(defn add [arg]
  [arg "added"])

(let [action [:add "delicious sharp cheese"]]
  (let [[cmd arg] action]
    (case cmd
      :del (del arg)
      :add (add arg))))

(defn dispatch-action [[cmd arg]]
  (case cmd
    :del (del arg)
    :add (add arg)))

(let [action [:add "super awesome robots!"]]
  (dispatch-action action))

(let [action [:del "super woke employer!"]]
  (dispatch-action action))

;; can we match directly on regex?
;; option flags: https://practical.li/clojure/reference/standard-library/regular-expressions/#option-flags

(let [statement "Hello, world."]
  (cond
    (re-find #"(?i)^hello" statement) :hi
    (re-find #"(?i)^goodbye" statement) :bye
    :else :???))

(let [statement "Goodbye, cruel world."]
  (cond
    (re-find #"(?i)^hello" statement) :hi
    (re-find #"(?i)^goodbye" statement) :bye
    :else :???))

(let [statement "Hot dang, peanut butter is better on Tuesday!"]
  (cond
    (re-find #"(?i)^hello" statement) :hi
    (re-find #"(?i)^goodbye" statement) :bye
    :else :???))

;; condp

(let [statement "Hello, world."]
  (condp re-find statement
    #"(?i)^hello" :hi
    #"(?i)^goodbye" :bye
    :???))

(let [statement "Goodbye, cruel world."]
  (condp re-find statement
    #"(?i)^hello" :hi
    #"(?i)^goodbye" :bye
    :???))

(let [statement "Hot dang, peanut butter is better on Tuesday!"]
  (condp re-find statement
    #"(?i)^hello" :hi
    #"(?i)^goodbye" :bye
    :???))

;; -- reduce ------------------------------------------------------------------

;; reduce to summarize a collection
;;
;;   (but note here that + is n-ary, and can accept a single arg, which our
;;   lambdas here do not support)

(reduce + [1 2 3])
(reduce (fn [n m] (+ n m)) [1 2 3])

(reduce + 0 [1 2 3])
(reduce (fn [n m] (+ n m)) 0 [1 2 3])

;; reduce to build up collection

(reduce (fn [coll n] (conj coll n (inc n))) [] [1 2 3])

(reduce (fn [coll n] (conj coll n (* n n))) [] [1 2 3])

(into {}
  (reduce
    (fn [coll n] (conj coll [n (* n n)]))  ;; reducing function; args: initial, current
    []                                     ;; initial value
    (range 1 10)))                         ;; collection to reduce

;; -- recursive grouping experiments ------------------------------------------

;; does not care about operator precedence
(defn group-left [[expr1 op expr2 & exprs]]
  (cond
    (nil? op) expr1
    :else (group-left (cons (list expr1 op expr2) exprs))))

;; does not care about operator precedence
(defn group-right [[expr op & exprs]]
  (cond
    (nil? op) expr
    :else (list expr op (group-right exprs))))

(group-left '(1 + 2 - 3 + 4 - 5))
(group-right '(1 + 2 * 3 + 4 / 5))
