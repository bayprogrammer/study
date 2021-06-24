(ns clojure-noob.ch5-exercises)

;; ===== chapter 5, exercise 1 =====

(def character
  {:name "Smooches McCutes"
   :attributes {:intelligence 10
                :strength 4
                :dexterity 5}})

(defn attr [attribute]
  (comp attribute :attributes))

(def c-int (attr :intelligence))
(def c-str (attr :strength))
(def c-dex (attr :dexterity))

(c-int character)
(c-str character)
(c-dex character)

;; ===== chapter 5, exercise 2 =====

;;
;; Note: I already did then once inside ch5_shippets.clj as I was reading the
;; chapter; there I relied on reduce to do the combination, so here I'll focus
;; on using a different technique.
;;
;; Probably a number of ways to implement it, but I think it will be fun to
;; implement this time building up nested lambdas to hold the pending
;; computation (no need to reverse that way).
;;
;; If only I knew how to build Clojure macros. :)
;;

(defn bind [f g]
  (fn [& args] (f (apply g args))))

(defn sq [n] (* n n))
(def sq-inc (bind sq inc))
(sq-inc 2)

(defn my-comp-binder [current-fn fns]
  (if (empty? fns)
    current-fn
    (bind current-fn (my-comp-binder (first fns) (rest fns)))))

(defn my-comp [& fns]
  (my-comp-binder (first fns) (rest fns)))

((my-comp inc *) 2 3)

(def spell-slots-my-comp (my-comp int inc #(/ % 2) c-int))
(spell-slots-my-comp character)

(defn sum-varargs [& nums]
  (loop [nums-remaining nums
         total 0]
    (if (empty? nums-remaining)
      total
      (recur (rest nums-remaining) (+ total (first nums-remaining))))))

(defn sq [n] (* n n))

(def sum-inc-sq (comp sq inc sum-varargs))
(sum-inc-sq 1 2 3 4 5)

(def my-sum-inc-sq (my-comp sq inc sum-varargs))
(my-sum-inc-sq 1 2 3 4 5)

;; ===== chapter 5, exercise 3 =====

(assoc {} :a "apples")                    ;=> {:a "apples"}
(assoc-in {} [:foo] "berries")            ;=> {:foo "berries"}
(assoc-in {} [:foo :bar :baz] "berries")  ;=> {:foo {:bar {:baz "berries"}}}

(defn my-assoc-in [m [k & ks] v]
  (if (empty? ks)
    (assoc m k v)
    (assoc m k (my-assoc-in m ks v))))

(my-assoc-in {} [:foo] "berries")
(my-assoc-in {} [:foo :bar :baz] "berries")

;; ===== chapter 5, exercise 4 =====

;; TODO(zmd): complete me!

;; ===== chapter 5, exercise 5 =====

;; TODO(zmd): complete me!

