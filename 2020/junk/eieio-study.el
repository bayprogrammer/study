(defclass my-contact ()
  ((name
    :initarg :name
    :initform ""
    :type string
    :custom string
    :documentation "The name of a person.")
   (birthday
    :initarg :birthday
    :initform "Jan 1, 1970"
    :custom string
    :type string
    :documentation "The person's birthday")
   (phone
    :initarg :phone
    :initform ""
    :documentation "Phone number."))
  "A single record for tracking people I know.")

;;(shell-command (concat (or scriptname "dialphone.sh")
;;                       " "
;;                       (oref rec phone)))
(cl-defmethod call-my-contact ((rec my-contact) &optional scriptname)
  "Dial the phone for the contact REC.
Execute the program SCRIPTNAME to dial the phone."
  (message "Dialing the %s for %s" (oref rec phone) (oref rec name)))

(setq zeb (my-contact :name "Zeb DeOs"
                      :birthday "02-Sept 1976"
                      :phone "555-555-5555"))

(call-my-contact zeb)
;;(setq foo #s(foo bar))
