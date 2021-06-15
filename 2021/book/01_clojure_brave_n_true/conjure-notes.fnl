(module user.conjure-school
  {require {school conjure.school}})

;; Welcome to Conjure school!
;; Grab yourself a nice beverage and let's get evaluating. I hope you enjoy!

;; This language is Fennel, it's quite similar to Clojure.
;; Conjure is written in Fennel, it's compiled to Lua and executed inside Neovim itself.
;; This means we can work with a Lisp without installing or running anything else.

;; Note: Some colorschemes will make the HUD unreadable, see here for more: https://git.io/JJ1Hl

;; Let's learn how to evaluate it using Conjure's assortment of mappings.
;; You can learn how to change these mappings with :help conjure-mappings

;; Let's begin by evaluating the whole buffer using <localleader>eb
;; Your <localleader> wasn't configured so I've defaulted it to comma (,) for now.
;; See :help localleader for more information. (let maplocalleader=",")
(school.lesson-1)

;; Good job!
;; You'll notice the heads up display (HUD) appeared showing the result of the evaluation.
;; All results are appended to a log buffer. If that log is not open, the HUD will appear.
;; The HUD closes automatically when you move your cursor.

;; You can open the log buffer in a few ways:
;;  * Horizontally - <localleader>ls
;;  * Vertically - <localleader>lv
;;  * New tab - <localleader>lt

;; All visible log windows (including the HUD) can be closed with <localleader>lq
;; Try opening and closing the log window to get the hang of those key mappings.
;; It's a regular window and buffer, so you can edit and close it however you want.
;; Feel free to leave the log open in a split for the next lesson to see how it behaves.

;; If you ever need to clear your log you can use the reset mappings:
;; * Soft reset (leaves windows open) - <localleader>lr
;; * Hard reset (closes windows, deletes the buffer) - <localleader>lR

;; Next, we have a form inside a comment. We want to evaluate that inner form, not the comment.
;; Place your cursor on the inner form (the one inside the comment) and use <localleader>ee to evaluate it.
(comment
  (school.lesson-2))

;; Awesome! You evaluated the inner form under your cursor.
;; If we want to evaluate the outermost form under our cursor, we can use <localleader>er instead.
;; Try that below to print some output and advance to the next lesson.
;; You can place your cursor anywhere inside the (do ...) form or it's children.
(do
  (print "Hello, World!")
  (school.lesson-3))

;; You evaluated the outermost form! Nice!
;; Notice that the print output was captured and displayed in the log too.
;; The result of every evaluation is stored in a Neovim register as well as the log.
;; Try pressing "cp to paste the contents of the register into your buffer.
;; We can also evaluate a form and replace it with the result of the evaluation with <localleader>e!
;; We'll try that in the next lesson, place your cursor inside the form below and press <localleader>e!
"Lesson [4/7] complete!"

;; Well done! Notice how the resulting string in the log also replaced the form in the buffer!
;; Next let's try evaluating a form at a mark.
;; Place your cursor on the next lesson form below and use mf to set the f mark at that location.
;; Now move your cursor elsewhere in the buffer and use <localleader>emf to evaluate it.
;; If you use a capital letter like mF you can even open a different file and evaluate that marked form without changing buffers!
(school.lesson-5)

;; Excellent!
;; This is extremely useful when you want to evaluate a specific form repeatedly as you change code elsewhere in the file or project.
;; Try inspecting the contents of the variable below by placing your cursor on it and pressing <localleader>ew
school.lesson-5-message

;; You should see the contents in the HUD or log.

;; You can evaluate visual selections with <localleader>E
;; Try evaluating the form below using a visual selection.
(school.lesson-6)

;; Wonderful!
;; Visual evaluation is great for specific sections of a form.
;; You can also evaluate a given motion with <localleader>E
;; Try <localleader>Eiw below to evaluate the word.
school.lesson-6-message

;; Use <localleader>Ea( to evaluate the lesson form.
(school.lesson-7)

;; Excellent job, you made it to the end!
;; To learn more about configuring Conjure, install the plugin and check out :help conjure
;; You can learn about specific languages with :help conjure-client- and then tab completion.
;; For example, conjure-client-fennel-aniseed or conjure-client-clojure-nrepl.

;; I hope you have a wonderful time in Conjure!

