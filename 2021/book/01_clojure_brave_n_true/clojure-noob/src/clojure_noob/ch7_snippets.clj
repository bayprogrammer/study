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

