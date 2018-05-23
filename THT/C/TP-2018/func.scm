(define (func k r p q m)
  (define (func-iter a b c d count)
    (display (cons a b))
    (newline)
    (cond ((= count 0) (cons (remainder b m)
                             (remainder a m)))
          ((even? count) (func-iter (remainder a m)
                                    (remainder b m)
                                    (remainder (+ (* c c) (* d d)) m)
                                    (remainder (+ (* 2 c d) (* d d r)) m)
                                    (/ count 2)))
          (else (func-iter (remainder (+ (* b d) (* a d r) (* a c)) m)
                           (remainder (+ (* b c) (* a d)) m)
                           (remainder c m)
                           (remainder d m)
                           (- count 1)))))
  (let ((g (gcd p q)))
    (func-iter (/ q g) (/ p g) 0 1 (- k 1))))

(define (iter)
  (let* ((k (read))
         (r (read))
         (p (read))
         (q (read))
         (m (read)))
    (if (not (eof-object? m))
        (let ((c (func k r p q m)))
          (display (car c))
          (display " ")
          (display (cdr c))
          (newline)
          (iter)))))

(with-input-from-file "FUNC.INP"
  (lambda () (with-output-to-file "FUNC.OUT" iter)))
