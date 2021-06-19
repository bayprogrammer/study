(ns clojure-noob.snippets)

1
"a string"
["a" "vector" "of" "strings"]

(+ 1 2 3)

(str "It was the panda " "in the library " "with a dust buster")

(if true
  "By Zeus' hammer!"
  "By Acquaman's trident!")

(if false
  "By Zeus' hammer!"
  "By Acquaman's trident!")

(if false
  "By Odin's elbow!")

(if true
  (do (println "Success!")
      "By Zeus' hammer!")
  (do (println "Failure!")
      "By Acquaman's trident!"))

(when true
  (println "Success!")
  "abra cadabra")

(nil? 1)
(nil? nil)

(if "bear eats beets"
  "bears beet Battlestar Galactica")

(if nil
  "This won't be the result because nil is falsey"
  "nil is falsey")

(= 1 1)
(= nil nil)
(= 1 2)

(or false :large_I_mean_venti :why_cant_I_just_say_large)
(or (= 0 1) (= "yes" "no"))

(or nil)

(and :free_wifi :hot_coffee)
(and :feelin_super_cool nil false)

(def failed-protagonist-names
  ["Larry Potter" "Doreen the Explorer" "The Incredible Bulk"])

failed-protagonist-names

(defn error-message
  [severity]
  (str "DEAR ME! IT'S A DISASTER! WE'RE "
       (if (= severity :mild)
         "MILDLY INCONVENIENCED!"
         "DOOOOOOOMED!")))

(error-message :mild)
(error-message :severe)

93
1.2
1/5

"Lord Voldemort"
"\"He who must not be named\""
"\"Great cow of moscow\" - Hermes Conrad"

(def name "Chewbacca")

(str "\"Uggllglglglglglglglll\" - " name)

{}
{:first-name "Charlie"
 :last-name "McFishwich"}

{"string-key" +}

{:name
  {:first "John"
   :middle "Jacob"
   :last "Jingleheimerschmidt"}}

(hash-map :a 1 :b 2)

(get {:a 0 :b 1} :b)
(get {:a 0 :b {:c "ho hum"}} :b)
(get {:a 0 :b 1} :c)
(get {:a 0 :b 1} :c "unicorns?")

(get-in {:a 0 :b {:c "ho hum"}} [:b :c])

({:name "The Human Coffeepot"} :name)
(:name {:name "The Human Coffeepot"})

:a
:rumplestiltsken
:34
:_?

(:a {:a 1 :b 2 :c 3})

;; equivalent to:
(get {:a 1 :b 2 :c 3} :a)

(:d {:a 1 :b 2 :c 3})
(:d {:a 1 :b 2 :c 3} "No gnome knows homes like Noah knows")

[3 2 1]
(get [3 2 1] 0)

(get ["a" {:name "Pugsley Winterbottom"} "c"] 1)
(get-in ["a" {:name "Pugsley Winterbottom"} "c"] [1 :name])

(vector "creepy" "full" "moon")
(conj [1 2 3] 4)

'(1 2 3 4)

(nth '(:a :b :c) 0)
(nth '(:a :b :c) 2)

(list 1 "two" {3 4})
(conj '(1 2 3) 4)

#{"kurt vonnegut" 20 :icicle}
(hash-set 1 1 2 2)
(conj #{:a :b} :b)
(conj #{:a :b} :c)

(set [3 3 3 4 4])
(set '(3 3 3 4 4))

(contains? #{:a :b} :a)
(contains? #{:a :b} 3)
(contains? #{nil} nil)

(:a #{:a :b})
(:x #{:a :b})
(get #{:a :b} :a)
(get #{:a nil} nil)
(get #{:a :b} "kurt vonnegut")

(+ 1 2 3 4)
(* 1 2 3 4)
(first [1 2 3 4])

;; don't write code this way kids
(or + -)
((or + -) 1 2 3)
((and (= 1 1) +) 1 2 3)
((first [+ 0]) 1 2 3)
;; ------------------------------

(inc 1.1)
(map inc [0 1 2 3])
(map inc '(0 1 2 3))

(defn too-enthusiastic
  "Return a cheer that might be a little too enthusiastic"
  [name]
  (str "Oh. Look. It's " name ". *yawn*"))
(too-enthusiastic "Zelda")

(defn no-params []
  "I take no parameters!")
(defn one-param [x]
  (str "I take one parameter: " x))
(defn two-params [x y]
  (str "Two parameters! That's nothing! Pah! I will smoosh them "
       "together to spite you! " x y))

(no-params)
(one-param "blueberries")
(two-params :foo :bar)

;; arity overloading is a thing
(defn x-params
  ([]
    "I take no parameters!")
  ([x]
    (str "I take one parameter: " x))
  ([x y]
    (str "Two parameters! That's nothing! Pah! I will smoosh them "
         "together to spite you! " x y)))

(x-params)
(x-params "blueberries")
(x-params :foo :bar)

(defn x-chop
  "Describe the kind of chop you're inflicting on someone"
  ([name chop-type]
    (str "I " chop-type " chop " name "! Take that!"))
  ([name]
    (x-chop name "karate")))

(x-chop "Kanye West" "slap")
(x-chop "Kanye East")

(defn weird-arity
  ([]
    "Destiny dressed you this morning, my friend, and now Fear is
    trying to pull off your pants. If you give up, if you give in,
    you're gonna end up naked with Fear just standing there laughing
    at your dangling unmentionables! - the Tick")
  ([number]
    (inc number)))

(weird-arity)
(weird-arity 41)

(defn codger-communication [whippersnapper]
  (str "Get off my lawn, " whippersnapper "!!!"))

(defn codger [& whippersnappers]
  (map codger-communication whippersnappers))

(codger "Billy" "Anne-Marie" "The Incredible Bulk")

(defn favorite-things [name & things]
  (str "Hi, " name ", here are my favoriate things: "
       (clojure.string/join ", " things)))

(favorite-things "Doreen" "gum" "shoes" "kara-te")

(defn my-first [[first-thing]] first-thing)

(my-first ["oven" "bike" "war-axe"])

(defn chooser
  [[first-choice second-choice & unimportant-choices]]
  (println (str "Your first choice is: " first-choice))
  (println (str "Your second choice is: " second-choice))
  (println (str "We're ignoring the rest of your choices. "
                "Here they are in case you need to cry over them: "
                (clojure.string/join ", " unimportant-choices))))

(chooser ["Marmalade", "Handsome Jack", "Pigpen", "Aquaman"])

(defn announce-treasure-location
  [{:keys [lat lng]}]  ; [{lat :lat lng :lng}]
  (println (str "Treasure lat: " lat))
  (println (str "Treasure lng: " lng)))

(announce-treasure-location {:lat 28.22 :lng 81.33})

(defn steer-ship! [{:keys [lat lng]}]
  (println (str "Aye aye capt'n! Changing heading to " lat " x " lng "!")))

(defn receive-treasure-location [{:keys [lat lng] :as treasure-location}]
  (println (str "Treasure lat: " lat))
  (println (str "Treasure lng: " lng))

  ;; One would assume that this would put in new coordinates for your ship
  (steer-ship! treasure-location))

(receive-treasure-location {:lat 28.22 :lng 81.33})

(defn illustrative-function []
  (+ 1 304)
  30
  "joe")

(illustrative-function)

(defn number-comment [x]
  (if (> x 6)
    "Oh my gosh! What a big number!"
    "That number's OK, I guess"))

(number-comment 5)
(number-comment 7)

(map (fn [name] (str "Hi, " name))
     ["Darth Vader" "Mr. Magoo"])

((fn [x] (* x 3)) 8)

(def my-special-multiplier (fn [x] (* x 3)))
(my-special-multiplier 12)

(#(* % 3) 8)

(map #(str "Hi, " %)
     ["Darth Vader" "Mr. Magoo"])

(#(str %1 " and " %2) "cornbread" "butter beans")

(#(identity %&) 1 "blarg" :yip)

(defn inc-maker
  "Create a customer incrementor"
  [inc-by]
  #(+ % inc-by))

(def inc3 (inc-maker 3))

(inc3 7)

(def asym-hobbit-body-parts [{:name "head" :size 3}
                             {:name "left-eye" :size 1}
                             {:name "left-ear" :size 1}
                             {:name "mouth" :size 1}
                             {:name "nose" :size 1}
                             {:name "neck" :size 2}
                             {:name "left-shoulder" :size 3}
                             {:name "left-upper-arm" :size 3}
                             {:name "chest" :size 10}
                             {:name "back" :size 10}
                             {:name "left-forearm" :size 3}
                             {:name "abdomen" :size 6}
                             {:name "left-kidney" :size 1}
                             {:name "left-hand" :size 2}
                             {:name "left-knee" :size 2}
                             {:name "left-thigh" :size 4}
                             {:name "left-lower-leg" :size 3}
                             {:name "left-achilles" :size 1}
                             {:name "left-foot" :size 2}])

(defn matching-part
  [part]
  {:name (clojure.string/replace (:name part) #"^left-" "right-")
  :size (:size part)})

(matching-part {:name "left-foot" :size 3})
(matching-part {:name "left-parenthesis" :size 3})

(matching-part {:name "left-eye" :size 1})
(matching-part {:name "head" :size 3})

(defn symmetrize-body-parts
  "Expects a seq of maps that have a :name and :size"
  [asym-body-parts]
  (loop [remaining-asym-parts asym-body-parts
         final-body-parts []]
    (if (empty? remaining-asym-parts)
      final-body-parts
      (let [[part & remaining] remaining-asym-parts]
        (recur remaining
               (into final-body-parts
                     (set [part (matching-part part)])))))))

(symmetrize-body-parts asym-hobbit-body-parts)

(let [x 3]
  x)

(def dalmation-list
  ["Pongo" "Perdita" "Puppy 1" "Puppy 2"])
(let [dalmations (take 2 dalmation-list)]
  dalmations)

(def x 0)
(let [x 1] x)
(let [x (inc x)] x)

(let [[pongo & dalmations] dalmation-list]
  [pongo dalmations])

(into [] (set [:a :a])) ;; yielding new value
(into () (set [:a :a])) ;; not mutating

(def lisps [:common-lisp
            :scheme
            :clojure
            :lfe
            :hy
            :fennel
            :pico-lisp])
(into lisps [:carp])
lisps

(loop [iteration 0]
  (println (str "Iteration " iteration))
  (if (> iteration 3)
    (println "Goodbye!")
    (recur (inc iteration))))

(defn recursive-printer
  ([]
    (recursive-printer 0))
  ([iteration]
    (println iteration)
    (if (> iteration 3)
      (println "Goodbye!")
      (recursive-printer (inc iteration)))))
(recursive-printer)

(re-find #"^left-" "left-eye")
(re-find #"^left-" "cleft-chin")
(re-find #"^left-" "wongleblart")

;; (+ (+ (+ 1 2) 3) 4)
(reduce + [1 2 3 4])

;; (+ (+ (+ (+ 15 1) 2) 3) 4)
(reduce + 15 [1 2 3 4])

(defn my-reduce
  ([f initial coll]
    (loop [result initial
           remaining coll]
      (if (empty? remaining)
        result
        (recur (f result (first remaining)) (rest remaining)))))
  ([f [head & tail]]
    (my-reduce f head tail)))

(my-reduce + [1 2 3 4])
(my-reduce + 15 [1 2 3 4])

(defn better-symmetrize-body-parts
  "Expects a seq of maps that have a :name and :size"
  [asym-body-parts]
  (reduce (fn [final-body-parts part]
            (into final-body-parts (set [part (matching-part part)])))
          []
          asym-body-parts))

(better-symmetrize-body-parts asym-hobbit-body-parts)


(map :size asym-hobbit-body-parts)
(reduce + (map :size asym-hobbit-body-parts))
(let [body-part-size-sum (reduce + (map :size asym-hobbit-body-parts))]
  (rand body-part-size-sum))

(defn hit [asym-body-parts]
  (let [sym-parts (better-symmetrize-body-parts asym-body-parts)
        body-part-size-sum (reduce + (map :size sym-parts))
        target (rand body-part-size-sum)]
    (loop [[part & remaining] sym-parts
           accumulated-size (:size part)]
      (if (> accumulated-size target)
        part
        (recur remaining (+ accumulated-size (:size (first remaining))))))))

(hit asym-hobbit-body-parts)
