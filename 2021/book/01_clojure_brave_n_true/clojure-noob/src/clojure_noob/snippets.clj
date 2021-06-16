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
