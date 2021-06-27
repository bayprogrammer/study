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
