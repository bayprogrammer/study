(ns clojure-noob.ch5-snippets)

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

(defn clean-via-comp [text]
  ((comp #(s/replace % #"lol" "LOL") s/trim) text))
(clean-via-comp "My boa constrictor is so sassy lol!  ")

(defn clean-via-reduce [text]
  (reduce (fn [string string-fn] (string-fn string))
          text
          [s/trim #(s/replace % #"lol" "LOL")]))
(clean-via-reduce "My boa constrictor is so sassy lol!  ")


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
(sum-inc-sq 1 2 3 4 5)  ; (sq (inc (sum-varargs 1 2 3 4 5)))

(def my-sum-inc-sq (my-comp sq inc sum-varargs))
(my-sum-inc-sq 1 2 3 4 5)  ; (sq (inc (sum-varargs 1 2 3 4 5)))
;; ============================================================================

(defn sleepy-identity
  "Returns the given value after 1 second"
  [x]
  (Thread/sleep 1000)
  x)

(sleepy-identity "Mr. Fantastico")

(def memo-sleepy-identity (memoize sleepy-identity))

(memo-sleepy-identity "Mr. Fantastico")

;; ----------------------------------------------------------------------------

;; trying to understand a lazy-seq construction as used in pegthing

(range 10)
(range 1 10)
(range 1 10 2)
(take 10 (range 6 100000))
(last (range 1000000000))
(range 1 (inc 15))

(defn my-range
  ([upper]
    (my-range 0 upper))
  ([lower upper]
    (my-range lower upper 1))
  ([current upper step]
    (if (>= current upper)
      nil
      (cons current (lazy-seq (my-range (+ current step)
                                        upper
                                        step))))))

(my-range 10)
(my-range 1 10)
(my-range 1 10 2)
(take 10 (my-range 6 100000))
(last (my-range 1000000000))
(my-range 1 (inc 15))

;; "Elapsed time: 67943.430915 msecs"
(time (last (range 1000000000)))

;; "Elapsed time: 196770.194994 msecs"
(time (last (my-range 1000000000)))

;;
;; Yikes! My implementation of range is far slower than the built in one; I
;; wonder why that is?
;;
;; But, I've at least learned enough here, especially how lazy-seq works, to
;; continue reading through the pegthing game code.
;;

;; ----------------------------------------------------------------------------

(assoc-in {} [:cookie :monster :vocals] "Finntroll")
(get-in {:cookie {:monster {:vocals "Finntroll"}}} [:cookie :monster])
(get-in {:cookie {:monster {:vocals "Finntroll"}}} [:cookie :monster :vocals])
(get-in (assoc-in {} [:cookie :monster :vocals] "Finntroll") [:cookie :monster :vocals])

;; oooooh, partial is neat!
(sum-varargs 2 2)
(def add-two (partial sum-varargs 2))
(add-two 2)
(add-two 40)


;; huh, take seems to take the ceiling of the fraction, rather than truncate...
(let [pos-chars 3
      row-num 2
      rows 5]
  (let [pad-length (/ (* (- rows row-num) pos-chars) 2)]
    [pad-length
     (int pad-length)
     (float pad-length)
     (take pad-length (repeat "."))]))

;; doseq is like Ruby's .each, I think? (really only useful for side-effects,
;; like printing to the screen, eh?)
(let [fav-langs ["scheme"
                 "clojure"
                 "common lisp"
                 "lfe"
                 "c/c++"
                 "javascript"
                 "java"
                 "erlang"]]
  (doseq [lang fav-langs]
    (println lang)))


(first "f")
(int (first "f"))

(let [alpha-start 97]
  [{:f (inc (- (int (first "f")) alpha-start))}
   {:a (inc (- (int (first "a")) alpha-start))}])

