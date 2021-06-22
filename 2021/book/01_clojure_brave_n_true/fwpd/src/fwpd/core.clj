(ns fwpd.core)

(def filename "suspects.csv")

(def vamp-keys [:name :glitter-index])

(defn str->int [str]
  (Integer. str))

(def conversions {:name identity
                  :glitter-index str->int})

(defn convert [vamp-key value]
  ((get conversions vamp-key) value))

;; (convert :glitter-index "3")
;; (convert :name "Bob Smith")

(defn parse
  "Convert a CSV into rows of columns"
  [string]
  (map #(clojure.string/split % #",")
       (clojure.string/split string #"\n")))

;; ===== some notes =====

;; (seq {:name "Bob Smith" :glitter "10"})  ;=> ([:name "Bob Smith"] [:glitter "10"])
;; ((fn [row-map [vamp-key value]] {:row-map row-map :vamp-key vamp-key :value value}) {} [:name "Bob Smith"])
;;   ;=> {:row-map {}, :vamp-key :name, :value "Bob Smith"}
;; ((fn [row-map [vamp-key value]] {:row-map row-map :vamp-key vamp-key :value value}) {} [:glitter "10"])
;;   ;=> {:row-map {}, :vamp-key :glitter, :value "10"}

;; (map vector vamp-keys ["Bob Smith" "10"])  ;=> ([:name "Bob Smith"] [:glitter-index "10"])
;; (map vector [:a :b :c :d :e] ["apple" "blueberry" "cherry" "durian" "elderberry"])
;;   ;=> ([:a "apple"] [:b "blueberry"] [:c "cherry"] [:d "durian"] [:e "elderberry"])
;; (into {} (map vector [:a :b :c :d :e] ["apple" "blueberry" "cherry" "durian" "elderberry"]))
;;   ;=> {:a "apple", :b "blueberry", :c "cherry", :d "durian", :e "elderberry"}

;; ===== /some notes =====

(defn mapify
  "Return a seq of maps like {:name \"Edward Cullen\" :glitter-index 10}"
  [rows]
  (map (fn [unmapped-row]
         (reduce (fn [row-map [vamp-key value]]
                   (assoc row-map vamp-key (convert vamp-key value)))
                 {}
                 (map vector vamp-keys unmapped-row)))
       rows))

;; (first (mapify (parse (slurp filename))))

(defn glitter-filter [minimum-glitter records]
  (filter #(>= (:glitter-index %) minimum-glitter) records))

(glitter-filter 3 (mapify (parse (slurp filename))))


;; ===== chapter 4, exercise 1 =====

(map #(:name %) (glitter-filter 3 (mapify (parse (slurp filename)))))


;; ===== chapter 4, exercise 2 =====

;; hmmm, appending to a list is not efficient; but a list is what we have...?
(defn append [suspects suspect]
  (reverse (cons suspect (reverse suspects))))

;;(let [suspects (mapify (parse (slurp filename)))]
;;  (append suspects {:name "Bob MacBig" :glitter-index 2}))


;; ===== chapter 4, exercise 3 =====

(defn name-valid? [name]
  (and
    (string? name)
    (not (clojure.string/blank? name))))

;;(name-valid? "Bob MacBig")
;;(name-valid? "")
;;(name-valid? :foo)
;;(name-valid? 1337)
;;(name-valid? nil)

(defn glitter-valid? [glitter-index]
  (and
    (integer? glitter-index)
    (>= glitter-index 0)))

;;(glitter-valid? 0)
;;(glitter-valid? 2)
;;(glitter-valid? "2")
;;(glitter-valid? "")
;;(glitter-valid? nil)

(def validations {:name name-valid?
                  :glitter-index glitter-valid?})

(let [suspect {:name "Bob MacBig" :glitter-index 2}]
  (map (fn [[field validator]]
         (validator (field suspect)))
       validations))

(def none (complement some))

(defn validate [validations suspect]
  (none #(false? %)
        (map (fn [[field validator]]
               (validator (field suspect)))
             validations))))

(validate validations {:name "Bob MacBig" :glitter-index 2})
(validate validations {:name "" :glitter-index 2})
(validate validations {:name "Bob MacBig" :glitter-index "2"})
(validate validations {:name "Bob MacBig"})
(validate validations {:glitter-index 2})


;; ===== chapter 4, exercise 4 =====

(defn suspect->csv [{:keys [name glitter-index]}]
  (clojure.string/join "," [name glitter-index]))

(suspect->csv {:name "Bob MacBig" :glitter-index 2})

(defn suspects->csv [suspects]
  (clojure.string/join "\n"
                       (map suspect->csv suspects)))

;;(let [suspects (mapify (parse (slurp filename)))
;;      new-suspect {:name "Bob MacBig" :glitter-index 2}]
;;  (if (validate validations new-suspect)
;;    (suspects->csv (append suspects new-suspect))))

