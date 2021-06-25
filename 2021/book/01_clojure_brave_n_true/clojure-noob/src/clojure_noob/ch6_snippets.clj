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

