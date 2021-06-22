(ns clojure-noob.ch5-snippets)

(+ 1 2)

;; referentially transparent
(defn wisdom [words]
  (str words ", Daniel-san"))

(wisdom "Always bathe on Fridays")

;; not referentially transparent
(defn year-end-evaluation []
  (if (> (rand) 0.5)
    "You get a raise!"
    "Better luck next year!"))

(year-end-evaluation)


;; referentially transparent
(defn analysis [text]
  (str "Character count: " (count text)))

;; not referentially transparent
(defn analyze-file [filename]
  (analysis (slurp filename)))


(def great-baby-name "Rosanthony")
great-baby-name

(let [great-baby-name "Bloodthunder"]
  great-baby-name)

great-baby-name


(defn sum-no-recur
  ([vals] (sum vals 0))
  ([vals accumulating-total]
    (if (empty? vals)
      accumulating-total
      (sum (rest vals) (+ (first vals) accumulating-total)))))

(sum-no-recur [1 2 3])

(defn sum
  ([vals]
    (sum vals 0))
  ([vals accumulating-total]
    (if (empty? vals)
      accumulating-total
      (recur (rest vals) (+ (first vals) accumulating-total)))))

(sum [1 2 3])


(require '[clojure.string :as s])
(defn clean [text]
  (s/replace (s/trim text) #"lol" "LOL"))

(clean "My boa constrictor is so sassy lol!  ")

((comp inc *) 2 3)


(def character
  {:name "Smooches McCutes"
   :attributes {:intelligence 10
                :strength 4
                :dexterity 5}})
(def c-int (comp :intelligence :attributes))
;; vvv equiv (def c-str (fn [c] (:strength (:attributes c))))
(def c-str (comp :strength :attributes))
(def c-dex (comp :dexterity :attributes))

(c-int character)
(c-str character)
(c-dex character)

(defn spell-slots [char]
  (int (inc (/ (c-int char) 2))))
(spell-slots character)

(def spell-slots-comp (comp int inc #(/ % 2) c-int))
(spell-slots-comp character)

(defn two-comp [f g]
  (fn [& args]
    (f (apply g args))))

(def trim-upper (two-comp s/trim s/upper-case))
(trim-upper "  Why, hello there!!     ")

;; ============================================================================
;; Exercise: try reimplementing Clojure's comp function (for composing n
;; functions)
(defn my-comp [& fns]
  (let [fns-reversed (reverse fns)]
    (fn [& args]
      (reduce (fn [value current-fn]
                (current-fn value))
              (apply (first fns-reversed) args)
              (rest fns-reversed)))))

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
(sum-inc-sq 1 2 3 4 5)  ; (sq (inc (sum-varargs 1 2 3 4 5)))

(def my-sum-inc-sq (my-comp sq inc sum-varargs))
(my-sum-inc-sq 1 2 3 4 5)  ; (sq (inc (sum-varargs 1 2 3 4 5)))
;; ============================================================================



