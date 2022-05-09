#!/usr/bin/env gosh

;; USAGE: ./convert.scm <actors.txt <input.txt >output.html

(define *entry-class* "root")
(define *entry-open* #f)

(define *body-buffer* "")
(define *body-class* "prelude")

(define (main args)
  (initialize)
  (for-each-input-line
    (lambda (line)
      (case (line-type line)
        ('header (render-header (make-header line)))
        ('actor (render-actor (make-actor line)))
        ('entry (render-entry (make-entry 'parent line)))
        ('reply (render-reply (make-entry 'child line)))
        ('body (render-body line)))))
  (finalize)
  0)

(define (initialize)
  (print (string-join (list "<!DOCTYPE html>"
                            "<html lang='en'>"
                            "<head>"
                            "<meta charset='UTF-8'>"
                            ;; TODO(zmd): set title? to what?
                            "<meta name='viewport' content='width=device-width, initial-scale=1'>"
                            "<link rel='stylesheet' href='style.css' type='text/css' charset='utf-8'>"
                            "</head>"
                            "<body>"
                            "<div class='content'>")
                      "\n")))

(define (finalize)
  (finalize-body)
  (finalize-entry)
  (print (string-join (list "</div>"
                            "</body>"
                            "</html>")
                      "\n")))

(define (finalize-body)
  (if (not (string=? "" *body-buffer*))
      (render-body "")))

(define (finalize-entry)
  (if *entry-open* (print (string-join (list "</div>"
                                             "</div>")
                                       ""))))

(define (for-each-input-line fn)
  (with-input-from-port (current-input-port)
    (lambda ()
      (port-for-each fn read-line))))

(define (render-header header)
  (print
    (string-join (list "<h1>"
                       (header->name header)
                       " ("
                       (header->id header)
                       ")"
                       "</h1>")
                 "")))

(define (render-actor actor)
  ;; TODO(zmd): emit nothing, but instead add actor to actors alist
  ;;(print
  ;;  (string-join (list "  ACTOR:" (actor->string actor))))
  )

(define (render-entry entry)
  (set! *entry-class* "root")
  (set! *body-class* "body")
  (render-entry-common entry))

(define (render-reply entry)
  (set! *entry-class* "reply")
  (set! *body-class* "reply")
  (render-entry-common entry))

(define (render-entry-common entry)
  (finalize-entry)
  (set! *entry-open* #t)
  ;; TODO(zmd): wrap individual metadata members in spans with classes for
  ;;   more fine grained styling control
  (print (string-join (list "<div class='entry-container entry-container-"
                            *entry-class*
                            "'>\n"
                            "<div class='entry-meta-container'>"
                            "\n"
                            "<span class='entry-meta entry-meta-name'>"
                            (entry->name entry)
                            "</span>"
                            "<br>\n"
                            "<span class='entry-meta entry-meta-date'>"
                            (entry->date entry)
                            "</span>"
                            " "
                            "<span class='entry-meta entry-meta-time'>"
                            (entry->time entry)
                            "</span>"
                            "<br>\n"
                            ;; TODO(zmd): better presentation for DM
                            ;;   (#{name}); look up name from actors list
                            "<span class='entry-meta entry-meta-channel'>"
                            (entry-channel->string (entry->channel entry))
                            "</span>"
                            "<br>\n"
                            "<span class='entry-meta entry-meta-image'>"
                            (entry->image entry)
                            "</span>"
                            "\n"
                            "</div>"
                            "<div class='body-wrapper'>")
                      "")))

(define (render-body body)
  (let ([open-p-tag (string-join (list "<p class='" *body-class* "'>") "")])
    (if (and (string=? "" body) (not (string=? "" *body-buffer*)))
        (begin
          (print (string-join (list open-p-tag
                                    (render-body-styles *body-buffer*)
                                    "</p>")
                              ""))
          (set! *body-buffer* ""))
        (begin
          (set! *body-buffer* (string-join
                                (list *body-buffer*
                                      (if (string=? *body-buffer* "") "" " ")
                                      body)
                                ""))))))

(define (render-body-styles body)
  ;; threading macro sure would be nice here!
  (render-body-emphasis
    (render-body-strong
      body)))

(define (render-body-emphasis body)
  (let ([asterisks-rendered (regexp-replace-all #/\*(.*?)\*/ body "<em>\\1</em>")])
    (regexp-replace-all #/_(.*?)_/ asterisks-rendered "<em>\\1</em>")))

(define (render-body-strong body)
  (regexp-replace-all #/\*\*(.*?)\*\*/ body "<strong>\\1</strong>"))

(define (make-header line)
  (let ([parsed (string-split line #\space)])
    (let ([parsed-id (car (string-split (cadr parsed) ":"))]
          [parsed-name (cddr parsed)])
      (list parsed-id (string-join parsed-name)))))

(define (make-actor line)
  (cdr (string-split line #\space)))

(define (make-entry entry-type line)
  (cdr (string-split line #\space)))

(define (header->string header)
  (string-join (list (string-join (list "id:" (header->id header)))
                     (string-join (list "name:" (header->name header))))
               ", "))

;; TODO(zmd): this is placeholder, implement!
(define (actor->string actor)
  (x->string actor))

;; TODO(zmd): this is placeholder, implement!
(define (entry->string entry)
  (x->string entry))

(define (header->id header)
  (car header))

(define (header->name header)
  (cadr header))

;; TODO(zmd): if we cared about performance, we would switch to a more
;;   appropriate data structure or otherwise recursively unpack the entry
;;   metadata object, rather than just cadddr our way to victory; but we
;;   don't care about performance, so we'll leave this ugiliness for a future
;;   study

(define (entry->name entry)
  ;; TODO(zmd): look up name from actors list
  (car entry))

(define (entry->date entry)
  (cadr entry))

(define (entry->time entry)
  (caddr entry))

(define (entry->channel entry)
  (cadddr entry))

(define (entry-channel->string entry-channel)
  (let ([match (rxmatch #/(#{)([a-zA-Z]*)(})/ entry-channel)])
    (if match
        ;; TODO(zmd): accomodate private chat with multiple users
        (string-join (list "private chat: " (rxmatch-substring match 2)) "")
        entry-channel)))

(define (entry->image entry)
  (car (cddddr entry)))

;; Note, we check 'reply before 'entry intentionally
(define (line-type line)
  (cond ((header-line? line) 'header)
        ((actor-line? line) 'actor)
        ((reply-line? line) 'reply)
        ((entry-line? line) 'entry)
        (else 'body)))

(define (header-line? line)
  (and
    (> (string-length line) 1)
    (char=? #\% (string-ref line 0))
    (char=? #\% (string-ref line 1))))

(define (actor-line? line)
  (and
    (> (string-length line) 1)
    (char=? #\% (string-ref line 0))
    (char=? #\@ (string-ref line 1))))

(define (reply-line? line)
  (and
    (> (string-length line) 1)
    (char=? #\. (string-ref line 0))
    (char=? #\. (string-ref line 1))))

(define (entry-line? line)
  (and
    (> (string-length line) 0)
    (char=? #\. (string-ref line 0))))
