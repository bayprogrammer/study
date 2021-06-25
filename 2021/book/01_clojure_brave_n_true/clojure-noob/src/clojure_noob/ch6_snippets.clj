(ns clojure-noob.ch6-snippets)

(ns-name *ns*)

inc
'inc
(map inc [1 2])
'(map inc [1 2])

(def great-books ["East of Eden" "The Glass Bead Game"])
great-books

(type *ns*)

(ns-interns *ns*)
(type (ns-interns *ns*))

(get (ns-interns *ns*) 'great-books)
('great-books (ns-interns *ns*))
(type ('great-books (ns-interns *ns*)))

(type great-books)
(type 'great-books)
(type #'clojure-noob.ch6-snippets/great-books)

(ns-map *ns*)

(deref #'clojure-noob.ch6-snippets/great-books)
great-books

(def great-books ["The Power of Bees" "Journey to Upstairs"])
great-books

;; IN REPL:

;; > (create-ns 'cheese.taxonomy)
;; > (ns-name (create-ns 'cheese.taxonomy))
;; > (in-ns 'cheese.analysis)
;;
;; > (in-ns 'cheese.taxonomy)
;; > (def cheddars ["mild" "medium" "strong" "sharp" "extra sharp"])
;; > cheddars
;; > (in-ns 'cheese.analysis)
;; > cheddars
;; > cheese.taxonomy/cheddars
;;
;; *** RESTART REPL ***
;;
;; > (in-ns 'cheese.taxonomy)
;; > (def cheddars ["mild" "medium" "strong" "sharp" "extra sharp"])
;; > (def bries ["Wisconsin" "Somerset" "Brie de Meaux" "Brie de Melun"])
;; > (in-ns 'cheese.analysis)
;; > (clojure.core/refer 'cheese.taxonomy)
;; > bries
;; > cheddars
;;
;; > (clojure.core/get (clojure.core/ns-map clojure.core/*ns*) 'bries)
;; > (clojure.core/get (clojure.core/ns-map clojure.core/*ns*) 'cheddars)

;; private function, only visible to current namespace:
(defn- private-function
  "Just an example function that does nothing"
  [])

(private-function)

;; > (clojure.core/alias 'taxonomy 'cheese.taxonomy)

(zipmap [:a :b] [1 2])  ;=> {:a 1, :b 2}

(let [nums [1 2 3]]
  (zipmap [:a :b :c] (map inc nums)))

(let [nums [1 2 3]]
  (zipmap nums (map inc nums)))

(let [comparison-fn clojure.core/min
      ks [:lat :lng]
      maps [{:lat 1 :lng 3} {:lat 5 :lng 0}]
      lats (map :lat maps)
      lats-min (apply comparison-fn lats)
      lngs (map :lng maps)
      lngs-min (apply comparison-fn lngs)
      cmpr (fn [k] (apply comparison-fn (map k maps)))
      cmpr-result (map cmpr ks)
      result (zipmap ks cmpr-result)]
  {:lats lats
   :lats-min lats-min
   :lngs lngs
   :lngs-min lngs-min
   :cmpr-result cmpr-result
   :result result})  ;=> {:lats (1 5) :lats-min 1
                     ;    :lngs (3 0) :lngs-min 0
                     ;    :cmpr-result (1 0) :result {:lat 1, :lng 0}}

(merge-with - {:foo 10 :bar 20} {:foo 5 :bar 10})
(merge-with + {:foo 10 :bar 20} {:foo 5 :bar 10})
(merge-with * {:foo 10 :bar 20} {:foo 5 :bar 10})
(merge-with / {:foo 10 :bar 20} {:foo 5 :bar 10})

(merge-with (fn [n m] (println [n m]) (list n m))
            {:foo 10 :bar 20}
            {:foo 5 :bar 10}
            {:foo 1 :bar 0}
            {:foo 100 :bar 50})  ;=> {:foo (((10 5) 1) 100)
                                 ;    :bar (((20 10) 0) 50)}

(merge-with - {:lat 50 :lng 10}
              {:lat 5 :lng 5})  ;=> {:lat 45 :lng 5}
