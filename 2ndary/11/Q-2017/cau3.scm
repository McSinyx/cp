(with-input-from-file "CAU3.INP" (lambda ()
  (with-output-to-file "CAU3.OUT" (lambda ()
    (define l (sort (let read-list ((n (read)))
                      (if (= n 0) '() (cons (read) (read-list (- n 1))))) <))
    (format #t "~a\n"
      (max (* (list-ref l (- (length l) 1)) (list-ref l (- (length l) 2)))
           (* (list-ref l 1) (list-ref l 0))))))))
