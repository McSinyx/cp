; Because case doesn't like quotes
(defconstant yes 'yes)
(defconstant no 'no)
(defconstant it 'it)

(defun random-elt (list)
  "Choose a random element from the given list."
  (if (null list)
      nil
      (elt list (random (length list)))))

(defun query-if (question &optional (pred (lambda (answer) t)))
  "Ask until receive a proper answer."
  (princ question)
  (let ((answer (read)))
    (if (funcall pred answer)
        answer
        (query-if question pred))))

(defun twenty-questions (db n)
  "Guess what's in the user's mind and return the updated database."
  (if (or (null db) (= n 0))
      (let ((answer (query-if "What is it? ")))
        (if (assoc answer db)
            db
            (cons (list answer) db)))
      (let* ((guess (random-elt db))
             (word (first guess))
             (remain (remove guess db)))
        (case (query-if (format nil "Is it a kind of ~a? " word)
                        (lambda (answer) (member answer (list yes no it))))
          (yes (cons (cons word (twenty-questions (rest guess) (1- n))) remain))
          (no (cons guess (twenty-questions remain (1- n))))
          (it db)))))

(defun play (&optional (db nil))
  "Play again and again."
  (let ((n (query-if "How many questions can be asked? " #'integerp)))
    (if (>= n 0)
        (play (twenty-questions db n))
        (print db))))

(play)
