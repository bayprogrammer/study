(ns clojure-noob.ch3-exercises)


;; chapter 3, exercise 1

(str "Hello, " "world")

(vector 1 2 3)

(list 3 2 1)

(hash-map :a "apples" :b "blueberries" :c "cherries")

(hash-set 1 2 3 1 2 3 0 9 8 0 1 2 3)


;; chapter 3, exercise 2

(defn add100
  "Add 100 to any number n"
  [n]
  (+ n 100))

(add100 50)


;; chapter 3, exercise 3

(defn dec-maker
  "Make a decrementer function that decrements by n"
  [n]
  (fn [m] (- m n)))

(def dec9 (dec-maker 9))
(dec9 10)


;; chapter 3, exercise 4

(defn mapset
  "Map over sequence s using function f returning set of unique results"
  [f, s]
  (set (map f s)))

(mapset inc [1 1 2 2])


;; chapter 4, exercise 5

;; (/ 360 5)  ;=> 72
;; (range 0 360 72)  ;=> (0 72 144 216 288)

(def asym-alien-body-parts [{:name "head" :size 3}
                            {:name "*-eye" :size 1}
                            {:name "*-ear" :size 1}
                            {:name "mouth" :size 1}
                            {:name "nose" :size 1}
                            {:name "neck" :size 2}
                            {:name "*-shoulder" :size 3}
                            {:name "*-upper-arm" :size 3}
                            {:name "chest" :size 10}
                            {:name "back" :size 10}
                            {:name "*-forearm" :size 3}
                            {:name "abdomen" :size 6}
                            {:name "*-kidney" :size 1}
                            {:name "*-hand" :size 2}
                            {:name "*-knee" :size 2}
                            {:name "*-thigh" :size 4}
                            {:name "*-lower-leg" :size 3}
                            {:name "*-achilles" :size 1}
                            {:name "*-foot" :size 2}])

(def part-name-glob-regex #"^\*-")

(defn part-name-glob?
  "Determine if part-name is a part-name-glob"
  [part-name]
  (boolean (re-find part-name-glob-regex part-name)))

;; (part-name-glob? "*-knee")
;; (part-name-glob? "nose")

(defn part-name-glob->part-names
  "Expand a part-name-glob to a list of alien parts"
  [part-name-glob]
  (let [sides (range 1 6)]
    (map #(clojure.string/replace part-name-glob
                                  part-name-glob-regex
                                  (str % "-"))
         sides)))

;; (part-name-glob->part-names "*-knee")

(defn expand-part
  "Expand a part into a list of parts"
  [{:keys [name size] :as part}]
  (if (part-name-glob? name)
    (map #(hash-map :name % :size size)
         (part-name-glob->part-names name))
    (list part)))

;; (expand-part {:name "*-knee" :size 2})
;; (expand-part {:name "nose" :size 2})

(defn symmetrize-body-parts
  "Symmetrize a 5-sized alien's body parts"
  [parts]
  ;; TODO(zmd): should we convert to vector?
  (mapcat expand-part parts))

;; (symmetrize-body-parts asym-alien-body-parts)


;; chapter 3, exercise 6

;; TODO(zmd): do this exercise

