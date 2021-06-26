;; -- threading macro? --------------------------------------------------------

(-> 5
    (+ 1)
    (* 2)
    (/ 4))  ;=> 3

(-> {}
    (assoc 2021 []))  ;=> {2021 []}

(-> []
    (assoc 0 "cars")
    (assoc 1 "trucks")
    (assoc 2 "planes"))  ;=> ["cars" "trucks" "planes"]
