(ns clojure-noob.ch5-exercises)

;; (def c-int (comp :intelligence :attributes))
;; (def c-str (comp :strength :attributes))
;; (def c-dex (comp :dexterity :attributes))

;; (c-int character)
;; (c-str character)
;; (c-dex character)

(get (partial :attributes character) :intelligence)
(defn attr [attribute]
  (get (partial :attributes character) attribute))

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

(defn my-comp [& fns]
  ;; TODO(zmd): implement me
  )

