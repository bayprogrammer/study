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

;

