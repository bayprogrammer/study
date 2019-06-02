(import kivy)
(.require kivy "1.10.1")

(import [kivy.app [App]])
(import [kivy.uix.label [Label]])

(defclass my-app [App]
  (defn build [self]
    (Label :text "Hello world")))

(if (= __name__ "__main__"
  (.run (my-app))))