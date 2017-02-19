(display ((lambda (str from to)
            (let ((i (string-index str (string->char-set from))))
              (string-replace str to i (+ i (string-length from)))))
          (number->string (let* ((a (read)) (b (read)) (c (read)) (d (read)))
                            (+ (/ a b) (/ c d))))
          "/"
          " "))
(newline)
