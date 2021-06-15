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
