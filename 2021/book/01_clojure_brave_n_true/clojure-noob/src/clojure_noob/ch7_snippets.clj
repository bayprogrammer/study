(ns clojure-noob.ch7-snippets)

(defmacro backwards [form]
  (reverse form))

(backwards (" backwards" " am" "I" str))
(macroexpand-1 '(backwards (" backwards" " am" "I" str)))
(eval (macroexpand-1 '(backwards (" backwards" " am" "I" str))))

(def addition-list (list + 1 2))
(eval addition-list)
(eval (concat addition-list [10]))
(eval (list 'def 'lucky-number (concat addition-list [10])))
lucky-number

(read-string "(+ 1 2)")
(list? (read-string "(+ 1 2)"))
(conj (read-string "(+ 1 2)") :zagglewag)

(eval (read-string "(+ 1 2)"))

(read-string "()")
(read-string "str")
(read-string "[1 2]")
(read-string "{:sound \"hoot\"}")
(eval (read-string "()"))
(eval (read-string "str"))
(eval (read-string "[1 2]"))
(eval (read-string "{:sound \"hoot\"}"))

(read-string "#(+ 1 %)")  ;=> (fn* [p1__6713#] (+ 1 p1__6713#))
(read-string "'(a b c)")
(read-string "@var")
(read-string "; ignore!\n(+ 1 2)")

true
false
{}
:huzzah
()

(if true :a :b)

(let [x 5]
  (+ x 3))

(def x 15)
(+ x 3)

(let [x 5]
  (+ x 3))

(let [x 5]
  (let [x 6]
    (+ x 3)))

(defn exclaim [exclamation]
  (str exclamation "!"))

(exclaim "Hadoken")

(map inc [1 2 3])

(read-string "+")
(type (read-string "+"))
(list (read-string "+") 1 2)
(eval (list (read-string "+") 1 2))

(eval (read-string "()"))

(+ 1 2)
(+ 1 (+ 2 3))

(if true 1 2)

'(a b c)
(quote (a b c))

(read-string "'(a b c)")
(read-string "(quote (a b c))")


(read-string "(1 + 1)")

(let [infix (read-string "(1 + 1)")]
  (list (second infix) (first infix) (last infix)))

(eval (let [infix (read-string "(1 + 1)")]
        (list (second infix) (first infix) (last infix))))

