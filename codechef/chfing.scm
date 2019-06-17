(define (chfing n k)
  (let ((p (quotient k n)))
    (remainder (- (* k (1+ p)) (/ (* n p (1+ p)) 2)) 1000000007)))

(let loop ((t (read)))
  (when (> t 0)
    (display (chfing (1- (read)) (1- (read))))
    (newline)
    (loop (1- t))))
