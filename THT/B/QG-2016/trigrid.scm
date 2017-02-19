(with-output-to-file "TRIGRID.TXT" (lambda () (for-each
  (lambda (a)
    (display (remainder (quotient (* a (+ a 2) (+ (* a 2) 1)) 8) 2016))
    (newline))
  '(4 3 5 6 111 222 3333 4444 55555 666666 7777777 88888888 999999999
    123456789123456789 1000000000000000000))))
