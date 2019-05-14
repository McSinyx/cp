(define (match big smol ari)
  (let ((mod (modulo big smol)))
    (if (or (= mod 0) (> (quotient big smol) 1))
        ari
        (match smol mod (not ari)))))

(let loop ((i (read)))
  (when (> i 0)
    (let ((n (read)) (m (read)))
        (display (if (match (max n m) (min n m) #t)
                     "Ari\n"
                     "Rich\n")))
    (loop (1- i))))
