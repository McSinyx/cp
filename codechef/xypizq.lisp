(defun xypizq (N q x y z)
  (cond ((= q 1) (if (= x z) (/ x (1+ (* N 2))) (- 1 (xypizq N 1 z y z))))
        ((= q 3) (xypizq N 1 z y x))
        (t (- 1 (/ (* y 2) (1+ (* N 2)))))))

(dotimes (tests (read))
  (let ((result (xypizq (read) (read) (read) (read) (read))))
    (format t "~a ~a~&" (numerator result) (denominator result))))
