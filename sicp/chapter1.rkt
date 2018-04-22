#lang sicp
(define (square x) (* x x))
(define (sum-of-square x y) (+ (square x) (square y)))
(define (abs x)
  (if (> x 0) x
      (- x)))
(define (>= x y) (not (< x y)))

(define (ex-1-3 a b c)
  (cond ((and (< a b) (< a c)) (sum-of-square b c))
        ((and (< b a) (< b c)) (sum-of-square a c))
        (else (sum-of-square a b))))

(define (good-enough? guess x)
  (< (abs (* (- guess x) 1000)) x))
(define (average x y) (/ (+ x y) 2))
(define (sqrt x)
  (define (sqrt-improve guess x) (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? (square guess) x)
        guess
        (sqrt-iter (sqrt-improve guess x) x)))
  (sqrt-iter 1.0 x))

(define (cube x) (* x x x))
(define (cbrt x) ; Exercise 1.8
  (define (cbrt-iter guess x)
    (if (good-enough? (cube guess) x)
        guess
        (cbrt-iter (/ (+ (/ x (square guess)) (* 2 guess)) 3) x)))
  (cbrt-iter 1.0 x))

(define (dec x) (- x 1))
(define (inc x) (+ x 1))
(define (factorial n)
  (if (= n 1) 1 (* n (factorial (dec n)))))

; Exercise 1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (dec x) (A x (dec y))))))
(define (f n) (A 0 n)) ; return 2n
(define (g n) (A 1 n)) ; return n logical-and 2^n
(define (h n) (A 2 n)) ; return n logical-and (2 up-arrow up-arrow 2)

(define (fibonacci n)
  (define (fibonacci-iter a b m)
    (if (= m n) b (fibonacci-iter b (+ a b) (inc m))))
  (if (= n 0) 0 (fibonacci-iter 0 1 1)))

(define (count-change amount)
  (define (first-denomination kinds-of-coins)
    (cond ((= kinds-of-coins 1) 1)
          ((= kinds-of-coins 2) 5)
          ((= kinds-of-coins 3) 10)
          ((= kinds-of-coins 4) 25)
          ((= kinds-of-coins 5) 50)))
  (define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1) ; this means the coin change is valid
          ((or (< amount 0) (= kinds-of-coins 0)) 0)
          (else (+ (cc amount (dec kinds-of-coins))
                   (cc (- amount (first-denomination kinds-of-coins))
                       kinds-of-coins)))))
  (cc amount 5))

; Exercise 1.11
(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (dec n)) (* (f-recursive (- n 2)) 2)
         (* (f-recursive (- n 3)) 3))))
(define (f-iterative n)
  (define (f-iter a b c count)
    (if (= count 0) c (f-iter b c (+ c (* b 2) (* a 3)) (dec count))))
  (if (< n 3) n (f-iter 1 2 4 (- n 3))))

; Exercise 1.12
(define (combination-pascal n r)
  (if (or (= n 1) (= r 1))
      1
      (+ (combination-pascal (dec n) (dec r)) (combination-pascal (dec n) r))))
(define (combination n r) ; well, factorial is recursive :-)
  (/ (factorial n) (factorial r) (factorial (- n r))))

(define (even? n) (= (remainder n 2) 0))
(define (expt-recursive b n)
  (cond ((= n 0) 1)
        ((even? n) (square (expt-recursive b (/ n 2))))
        (else (* (expt-recursive b (dec n)) b))))
; Exercise 1.16
(define (expt-iterative b n)
  (define (expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (expt-iter (square b) (/ n 2) a))
          (else (expt-iter b (dec n) (* a b)))))
  (expt-iter b n 1))

; Exercise 1.17
(define (double n) (+ n n))
(define (halve n) (/ n 2))
(define (mul-recursive a b)
  (cond ((= b 0) 0)
        ((< b 0) (mul-recursive (- a) (- b)))
        ; halve only works on even intergers, thus even? must also be included
        ((even? b) (double (mul-recursive a (halve b))))
        (else (+ (mul-recursive a (dec b)) a))))
; Exercise 1.18
(define (mul-iterative a b)
  (define (mul-iter a b c)
    (cond ((= b 0) c)
          ((even? b) (mul-iter (double a) (halve b) c))
          (else (mul-iter a (dec b) (+ c a)))))
  (if (< b 0) (mul-iter (- a) (- b) 0) (mul-iter a b 0)))

(define (fib n)
  (define (fib-iter a b p q count)
    ; Tpq(a, b) = (bq + aq + ap, bp + aq)
    ; Tpq(Tpq(a, b)) = (..., (bp + aq)p + (bq + aq + ap)q)
    ;                = (..., b(pp + qq) + a(2pq + qq))
    ; => p' = pp + qq, q' = 2pq + qq
    (cond ((= count 0) b)
          ((even? count)
           (fib-iter a
                     b
                     (sum-of-square p q)
                     (+ (* 2 p q) (square q))
                     (/ count 2)))
          (else (fib-iter (+ (* b q) (* a q) (* a p))
                          (+ (* b p) (* a q))
                          p
                          q
                          (dec count)))))
  (fib-iter 1 0 0 1 n))

; Exercise 1.23
(define (smallest-divisor n)
  (define (find-divisor test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((= (remainder n test-divisor) 0) test-divisor)
          (else (find-divisor (+ test-divisor 2)))))
  (if (even? n) 2 (find-divisor 3)))
(define (prime? n) (and (> n 1) (= (smallest-divisor n) n)))

(define (expmod x y z)
  (cond ((= y 0) 1)
        ((even? y) (remainder (square (expmod x (/ y 2) z)) z))
        (else (remainder (* (expmod x (dec y) z) x) z))))
(define (fermat-prime-trial n a) (= (expmod a n n) a))
(define (fermat-prime? n times)
  (define (fermat-test n)
    (fermat-prime-trial (inc (random (dec n)))))
  (cond ((= times 0) true)
        ((fermat-test n) (fermat-prime? n (dec times)))
        (else false)))

; Exercise 1.22
(define (timed-prime-test n)
  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))
  (define (start-prime-test n start-time)
    (if (prime? n) (report-prime (- (runtime) start-time)) false))
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (search-for-primes start n)
  (cond ((< n 0)) ; wow this is valid
        ((even? start) (search-for-primes (inc start) n))
        ((timed-prime-test start) (search-for-primes (+ start 2) (dec n)))
        (else (search-for-primes (+ start 2) n))))

; Exercise 1.25
(define (expmod-lousy x y z) (remainder (expt-recursive x y) z))
(define (expmod-effeciency-test func x y z)
  (define (display-elapsed start-time)
    (func x y z)
    (display (- (runtime) start-time))
    (newline))
  (display-elapsed (runtime)))

; Exercise 1.27
(define (slow-fermat-prime? n)
  (define (slow-iter count)
    (cond ((= count 1) true)
          ((fermat-prime-trial n count) (slow-iter (dec count)))
          (else false)))
  (slow-iter (dec n)))

; Exercise 1.28
(define (miller-rabin n)
  (define (nontrivial-sqrt-1-mod? m)
    (let ((r (remainder (square m) n)))
      (if (or (not (= r 1)) (= m 1) (= m (dec n))) r 0)))
  (define (expmod-1 x y)
    (cond ((= y 0) 1)
          ((odd? y) (remainder (* (expmod-1 x (dec y)) x) n))
          (else (nontrivial-sqrt-1-mod? (expmod-1 x (/ y 2))))))
  (define (miller-rabin-trail a) (= (expmod-1 a (dec n)) 1))
  (define (miller-rabin-iter count)
    (cond ((= count 0))
          ((miller-rabin-trail (inc (random (dec n))))
           (miller-rabin-iter (dec count)))
          (else false)))
  (cond ((= n 2) true)
        ((or (< n 2) (even? n)) false)
        (else (miller-rabin-iter (/ (dec n) 2)))))

(define (sum term a next b)
  (if (> a b) 0 (+ (term a) (sum term (next a) next b))))
(define (identity x) x)
(define (sum-integers a b) (sum identity a inc b))
(define (sum-cubes a b) (sum cube a inc b))
(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 x (+ x 2))) a (lambda (x) (+ x 4)) b))
(define dx 0.00001)
(define (integral f a b dx)
  (* (sum f (+ a (/ dx 2.0)) (lambda (x) (+ x dx)) b) dx))

; Exercise 1.29
(define (simpson-integral f a b n)
  (define h (/ (- b a) n)) ; sorry!
  (define (fk k) (f (+ a (* k h))))
  (define (y k)
    (cond ((= (remainder k n) 0) (fk k))
          ((even? k) (* (fk k) 2))
          (else (* (fk k) 4))))
  (define (simpson-iter k)
    (if (= k 0)
        (y 0)
        (+ (y k) (simpson-iter (dec k)))))
  (* (simpson-iter n) h 1/3))

; Exercise 1.30
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

; Exercise 1.31
(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a) (product-recursive term (next a) next b))))
(define (pi-fourth precision)
  (define (john-wallis-term n)
    (* (if (even? n) (/ n (inc n)) (/ (inc n) n)) 1.0))
  (product-recursive john-wallis-term 2 inc (+ (* (abs precision) 2) 2)))
(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

; Exercise 1.32
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))
(define (sum-recursive term a next b) (accumulate + 0 term a next b))
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
    (iter a null-value))

; Exercise 1.33
(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (if (filter a) (term a) null-value)
                (filtered-accumulate filter
                                     combiner
                                     null-value
                                     term
                                     (next a)
                                     next
                                     b))))
(define (sum-square-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))
(define (product-relative-primes n)
  (filtered-accumulate (lambda (i) (= (gcd i n) 1)) * 1 identity 1 inc (dec n)))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (good-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value) (search f neg-point midpoint))
                ((negative? test-value) (search f midpoint pos-point))
                (else midpoint))))))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else (error "Values are not of opposite sign" a b)))))

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (good-enough? guess next) next (try next))))
  (try first-guess))

(define (sqrt-fixed x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

; Exercise 1.35
(define golden-ratio (fixed-point (lambda (x) (inc (/ x))) 1.0))

; Exercise 1.37
(define (cont-frac-recursive n d k)
  (define (cont-frac n d k root)
    (if (= k 0)
        root
        (cont-frac n d (dec k) (/ (n k) (+ (d k) root)))))
  (if (> k 0)
      (cont-frac n d (dec k) (/ (n k) (d k)))
      (error "You weirdo!")))
(define (cont-frac-iterative n d k)
  (define (cont-frac n d k c)
    (if (< c k)
        (/ (n c) (+ (d c) (cont-frac n d k (inc c))))
        (/ (n k) (d k)))) ; UB if k is not a positive integer
  (cont-frac n d k 1))

; Exercise 1.38
(define (e-2 precision)
  (cont-frac-iterative
   (lambda (i) 1.0)
   (lambda (i) (if (= (remainder i 3) 2) (* (inc i) 2/3) 1.0))
   precision))

; Exercise 1.39
(define (tan-cf x k)
  (cont-frac-iterative
   (lambda (i) (if (= i 1) x (square x)))
   (lambda (i) ((if (even? i) - +) (dec (* i 2))))
   k))

(define (average-damp f) (lambda (x) (average x (f x))))
(define (newton-method g guess)
  (define (deriv g)
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
  (let ((f (lambda (x) (- x (/ (g x) ((deriv g) x))))))
    (fixed-point f guess)))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

; Exercise 1.40
(define (cubic a b c)
  (lambda (x) (+ (cube x) (* (square x) a) (* x b) c)))

; Exercise 1.41
(define (duplicate f) (lambda (x) (f (f x))))

; Exercise 1.42
(define (compose f g) (lambda (x) (f (g x))))

; Exercise 1.43
(define (repeated f times)
  (cond ((< times 1) identity)
        ((= times 1) f)
        (else (compose f (repeated f (dec times))))))

; Exercise 1.44
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))
(define (repeated-smooth f times) (repeated smooth times))

; Exercise 1.45
(define (root n x)
  (fixed-point-of-transform
   (lambda (y) (/ x (expt y (dec n))))
   (repeated average-damp (log n 2))
   1.0))

; Exercise 1.46
(define (iter-improve good-enough improve)
  (lambda (x)
    (let ((xim (improve x)))
      (if (good-enough x xim)
          xim
          ((iter-improve good-enough improve) xim)))))
