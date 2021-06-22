(ns clojure-noob.ch4-snippets)

(defn titleize [topic]
  (str topic " for the Brave and True"))

(map titleize ["Hamsters" "Ragnarock"])
(map titleize '("Empathy" "Decorating"))
(map titleize #{"Elbows" "Soap Carving"})
(map #(titleize (second %)) {:uncomfortable-thing "Winking"})

(map #(println %) {:a "apples" :b "blueberries" :c "cherries"})

(seq '(1 2 3))
(seq [1 2 3])
(seq #{1 2 3})
(seq {:name "Bill Compton" :occupation "Dead mopey guy"})

(seq {:a 1 :b 2 :c 3})
(into {} (seq {:a 1 :b 2 :c 3}))
(into [] (seq {:a 1 :b 2 :c 3}))
(into () (seq {:a 1 :b 2 :c 3}))
(into #{} (seq {:a 1 :b 2 :c 3}))

(map inc [1 2 3])

(map str ["a" "b" "c"] ["A" "B" "C"])


(def human-consumption   [8.1 7.3 6.6 5.0])
(def critter-consumption [0.0 0.2 0.3 1.1])
(defn unify-diet-data [human critter]
  {:human human
   :critter critter})

(map unify-diet-data human-consumption critter-consumption)


(def sum #(reduce + %))
(def avg #(/ (sum %) (count %)))

(defn stats [numbers]
  (map #(% numbers) [sum count avg]))

(stats [3 4 10])
(stats [80 1 44 13 6])


(def identities
  [{:alias "Batman" :real "Bruce Wayne"}
   {:alias "Spider-Man" :real "Peter Parker"}
   {:alias "Santa" :real "Your mom"}
   {:alias "Easter Bunny" :real "Your dad"}])

(map :real identities)


(def num->word
  {0 "zero"
   1 "one"
   2 "two"
   3 "three"
   4 "four"
   5 "five"
   6 "six"
   7 "seven"
   8 "eight"
   9 "nine"
   10 "ten"
   11 "eleven"
   12 "twelve"})

(num->word 0)
;; (0 num->word)  ; no go!


(reduce (fn [new-map [key val]]
          (assoc new-map key (inc val)))
        {}
        {:max 30 :min 10})

(reduce (fn [new-map [key val]]
          (if (> val 4)
            (assoc new-map key val)
            new-map))
        {}
        {:human 4.1
         :critter 3.9})

(take 3 [1 2 3 4 5 6 7 8 9 10])

(drop 3 [1 2 3 4 5 6 7 8 9 10])

(def food-journal
  [{:month 1 :day 1 :human 5.3 :critter 2.3}
   {:month 1 :day 2 :human 5.1 :critter 2.1}
   {:month 2 :day 1 :human 4.9 :critter 2.1}
   {:month 2 :day 2 :human 5.0 :critter 2.5}
   {:month 3 :day 1 :human 4.2 :critter 3.3}
   {:month 3 :day 2 :human 4.0 :critter 3.8}
   {:month 4 :day 1 :human 3.7 :critter 3.9}
   {:month 4 :day 2 :human 3.7 :critter 3.6}])

(take-while #(< (:month %) 3) food-journal)
(drop-while #(< (:month %) 3) food-journal)

;; wish I knew about the threading macro... could it be used here to un-nest
;; the function calls?
(take-while #(< (:month %) 4)
            (drop-while #(< (:month %) 2) food-journal))

(filter #(< (:human %) 5) food-journal)

;; depending on the shape of the data, filter may have to visit more elements
;; than a combination of take-while and drop-while (no doubt this is dependent
;; on things such as the sorting of the data and the nature of the
;; datastructure being processing)
(filter #(< (:month %) 3) food-journal)

(some #(> (:critter %) 5) food-journal)
(some #(> (:critter %) 3) food-journal)
(#(do [%1 %2 %3]) 1 2 3)
(some #(and (> (:critter %) 3) %) food-journal)
(some #(and (> (:critter %) 5) %) food-journal)

;; complement of some is not all, but rather none:
((complement some) #(not (nil? %)) '(true true false true))
((complement some) #(not (nil? %)) '(true true false true))
(and true true false true)

(sort [3 2 1])
(sort [3 6 2 4 1 5 8 9 2 3 7])
(sort (set [3 6 2 4 1 5 8 9 2 3 7]))
(reverse (sort (set [3 6 2 4 1 5 8 9 2 3 7])))
(sort ["aaa" "c" "bb"])
(sort-by count ["aaa" "c" "bb"])
(reverse (sort-by count ["aaa" "c" "bb"]))
(sort-by count [[1 56 2] [1 2 3 4 5] [0]])
(reverse (sort-by count [[1 56 2] [1 2 3 4 5] [0]]))

(def reverse-sort-by-count #(reverse (sort-by count %)))
(reverse-sort-by-count [[1 56 2] [1 2 3 4 5] [0]])

(concat [1 2] [3 4])
(concat '(1 2) [3 4])
(sort (concat '(1 2) #{3 4}))


(def vampire-database
  { 0 {:makes-blood-puns? false :has-pulse? true  :name "McFishwich"}
    1 {:makes-blood-puns? false :has-pulse? true  :name "McMackson"}
    2 {:makes-blood-puns? true  :has-pulse? false :name "Damon Salvatore"}
    3 {:makes-blood-puns? true  :has-pulse? true  :name "Mickey Mouse"}})

(defn vampire-related-details [social-security-number]
  (Thread/sleep 1000)
  (get vampire-database social-security-number))

(defn vampire? [record]
  (and (:makes-blood-puns? record)
       (not (:has-pulse? record))
       record))

(defn identify-vampire [social-security-numbers]
  (first (filter vampire?
                 (map vampire-related-details social-security-numbers))))

(time (vampire-related-details 0))

(time (def mapped-details (map vampire-related-details (range 0 1000000))))

(time (first mapped-details))

(time (identify-vampire (range 0 1000000)))

(concat (take 8 (repeat "na")) ["Batman!"])

(take 3 (repeatedly (fn [] (rand-int 10))))
(take 3 (repeatedly #(rand-int 10)))

;; huh, does this consume stack space? I assume not; I assume lazy-seq wraps up
;; the call in an implicit lambda which just calls the even-numbers function
;; with the incrementor incrementing... but, hmmm...
(defn even-numbers
  ([] (even-numbers 0))
  ([n] (cons n (lazy-seq (even-numbers (+ n 2))))))

(take 10 (even-numbers))
(take 1000000 (even-numbers))
(take 1000000000 (even-numbers))
(take 1000000000000 (even-numbers))  ; so absurb, but very cool!

(cons 0 '(2 4 6))

(empty? [])
(empty? ["no!"])

(map identity {:sunlight-reaction "Glitter!"})
(into {} (map identity {:sunlight-reaction "Glitter!"}))
(into {} (list [:a "apples"]
               [:b "blueberries"]
               [:c "cherries"]
               [:d "durians"]
               [:e "elderberries"]))

;;(into {} (list '(:a "apples")             ; NOPE!
;;               '(:b "blueberries")
;;               '(:c "cherries")
;;               '(:d "durians")
;;               '(:e "elderberries")))

(map identity [:garlic :sesame-oil :fried-eggs])
(into [] (map identity [:garlic :sesame-oil :fried-eggs]))

(map identity [:garlic-clove :garlic-clove])
(into #{} (map identity [:garlic-clove :garlic-clove]))

(into {:favorite-emotion "gloomy"} [[:sunlight-reaction "Glitter!"]])
(into ["cherry"] '("pine" "spruce"))

(into {:favorite-animal "kitty"} {:least-favorite-smell "dog"
                                  :relationship-with-teenager "creepy"})

(conj [0] [1])
(into [0] [1])
(conj [0] 1)

(conj [0] 1 2 3 4)
(conj [] :apple :blueberry :cherry :durian :elderberry)
(conj {:time "midnight"} [:place "ye olde cemetarium"])

(defn my-conj [target & additions]
  (into target additions))

(my-conj [0] 1 2 3 4)
(my-conj [] :apple :blueberry :cherry :durian :elderberry)
(my-conj {:time "midnight"} [:place "ye olde cemetarium"])

(max 0 1 2)
(max [0 1 2])
(apply max [0 1 2])

(defn my-into [target additions]
  (apply conj target additions))

(my-into [0] [1 2 3])

(def add10 (partial + 10))
(def my-add10 #(+ 10 %))
(def my-my-add10 (fn [n] (+ 10 n)))

(add10 3)
(add10 5)
(my-add10 3)
(my-add10 5)
(my-my-add10 3)
(my-my-add10 5)

(def add-missing-elements
  (partial conj ["water" "earth" "air"]))

(add-missing-elements "unobtainium" "adamantium")
(add-missing-elements "handwavium")
(add-missing-elements "fire")

(defn my-partial [partialized-fn & args]
  (fn [& more-args]
    (apply partialized-fn (into args more-args))))

(def add20 (my-partial + 20))
(add20 3)

(defn lousy-logger [log-level message]
  (condp = log-level
    :warn (clojure.string/lower-case message)
    :emergency (clojure.string/upper-case message)))

(def warn (partial lousy-logger :warn))
(def emergency (partial lousy-logger :emergency))

(warn "Red light ahead")
(lousy-logger :warn "Red light ahead")
(emergency "Cultural revolutionaries ahead")
(lousy-logger :emergency "Cultural revolutionaries ahead")

;;(defn identify-humans [social-security-numbers]
;;  (filter #(not (vampire? %))
;;          (map vampire-related-details social-security-numbers)))
(def not-vampire? (complement vampire?))
(defn identify-humans [social-security-numbers]
  (filter not-vampire?
          (map vampire-related-details social-security-numbers)))

(def my-neg? (complement pos?))
(my-neg? 1)
(my-neg? -1)

(defn my-complement [fun]
  (fn [& args]
    (not (apply fun args))))

(def my-pos? (my-complement neg?))
(my-pos? 1)
(my-pos? -1)

