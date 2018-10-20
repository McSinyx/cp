(defun next (m result)
  (if (> m 0)
      (next (1- m) (+ (read) result))
      result))

(defun spread2 (n sum &optional (result 1))
  (if (< sum n)
      (spread2 (- n sum) (next sum sum) (1+ result))
      (dotimes (i n result) (read))))

(let ((tests (read)))
  (dotimes (i tests)
    (format t "~a~&" (spread2 (1- (read)) (read)))))

