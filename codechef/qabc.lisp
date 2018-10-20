(defun read-list (str)
  (read-from-string (concatenate 'string "(" str ")")))

(defun qabc (seq n &optional (a1 0) (a2 0))
  (if (< n 3)
      (if (every #'zerop (mapcar #'- (list a1 a2) seq)) "TAK" "NIE")
      (let ((a0 (- (first seq) a1)))
        (if (< a0 0)
            "NIE"
            (qabc (rest seq) (1- n) (+ a2 (* a0 2)) (* a0 3))))))

(let ((tests (read)))
  (dotimes (i tests)
    (let* ((n (read))
           (a (read-list (read-line)))
           (b (read-list (read-line))))
      (princ (qabc (mapcar #'- b a) n))
      (fresh-line))))
