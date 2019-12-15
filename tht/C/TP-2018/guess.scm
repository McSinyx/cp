(with-input-from-file "GUESS.INP"
  (lambda ()
    (with-output-to-file "GUESS.OUT"
      (lambda ()
        (let* ((a (read))
               (b (read)))
          (display ((list-ref (list + - *) (random 3)) a b))
          (newline))))))
