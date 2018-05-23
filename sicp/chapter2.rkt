#lang sicp
; Exercise 2.1
(define (make-rat n d)
  (if (< d 0)
      (make-rat (- n) (- d))
      (let ((g (gcd n d)))
        (cons (/ n g) (/ d g)))))
(define numer car)
(define denom cdr)
(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))
(define (add-rat x y)
  (let ((dx (denom x))
        (dy (denom y)))
    (make-rat (+ (* (numer x) dy)
                 (* (numer y) dx))
              (* dx dy))))
(define (sub-rat x y)
  (add-rat x (make-rat (- (numer y)) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

; Exercise 2.2
(define make-point cons)
(define x-point car)
(define y-point cdr)
(define make-segment cons)
(define start-segment car)
(define end-segment cdr)
(define (average x y) (/ (+ x y) 2))
(define (midpoint-segment d)
  (let ((A (start-segment d))
        (B (end-segment d)))
    (make-point (average (x-point A) (x-point B))
                (average (y-point A) (y-point B)))))
(define (print-point P)
  (display "(")
  (display (x-point P))
  (display ", ")
  (display (y-point P))
  (display ")")
  (newline))

; Exercise 2.3
(define (square x) (* x x))
(define mk-vec cons) ; Same x-point and y-point
(define (add-vec u v)
  (mk-vec (+ (x-point u) (x-point v))
          (+ (y-point u) (y-point v))))
(define (mul-vec u k)
  (mk-vec (* (x-point u) k) (* (y-point u) k)))
(define (sub-vec u v)
  (add-vec u (mul-vec v -1)))
(define (len-vec u)
  (sqrt (+ (square (x-point u)) (square (y-point u)))))
(define (seg2vec d)
  (sub-vec (end-segment d) (start-segment d)))
(define (length-segment d) (len-vec (seg2vec d)))
(define (mk-rect-segs segment height)
  ; Let's call the rectangle ABCD and AB is the first segment.
  ; Then height is signed and is negative when the angle BAD is negative.
  (let* ((vector (seg2vec segment))
         (len (len-vec vector))
         (x (x-point vector))
         (y (y-point vector))
         (AD (mul-vec (mk-vec (- y) x) (/ height len)))
         (A (start-segment segment))
         (D (add-vec A AD))
         (segAD (make-segment A D)))
    (lambda (m)
      (cond ((= m 0) len)
            ((= m 1) (abs height))
            ((= m 2) segment)
            ((= m 3) segAD)
            (else (error "Unexpected value of argument: rect-segs" m))))))
(define (mk-rect-points A B height)
  (let* ((vector (sub-vec B A))
         (len (len-vec vector))
         (x (x-point vector))
         (y (y-point vector))
         (AD (mul-vec (mk-vec (- y) x) (/ height len)))
         (D (add-vec A AD)))
    (lambda (m)
      (cond ((= m 0) len)
            ((= m 1) (abs height))
            ((= m 2) B)
            ((= m 3) A)
            ((= m 4) D)
            (else (error "Unexpected value of argument: rect-points" m))))))
(define (width-rect rect) (rect 0))
(define (height-rect rect) (rect 1))
(define (p-rect-segs rect)
  (* (+ (width-rect rect) (height-rect rect)) 2))
(define (s-rect-segs rect)
  (* (width-rect rect) (height-rect rect)))

; Exercise 2.4
(define (cons-procedural x y) (lambda (m) (m x y)))
(define (car-procedural z) (z (lambda (x y) x)))
(define (cdr-procedural z) (z (lambda (x y) y)))

; Exercise 2.5
(define (cons-arithmetic a b) (* (expt 2 a) (expt 3 b)))
(define (car-arithmetic c)
  (if (= (remainder c 2) 0)
      (inc (car-arithmetic (/ c 2)))
      0))
(define (cdr-arithmetic c)
  (if (= (remainder c 3) 0)
      (inc (car-arithmetic (/ c 3)))
      0))

; Exercise 2.6
(define zero (lambda (f) identity))
(define (add-one n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define (add m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

; Exercise 2.7
(define make-interval cons)
(define upper-bound cdr)
(define lower-bound car)
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
; Exercise 2.8
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
(define (mul-interval x y)
  (let ((xl (lower-bound x))
        (xu (upper-bound x))
        (yl (lower-bound y))
        (yu (upper-bound y)))
    (let ((p1 (* xl yl))
          (p2 (* xl yu))
          (p3 (* xu yl))
          (p4 (* xu yu)))
      (make-interval (min p1 p2 p3 p4)
                     (max p1 p2 p3 p4)))))
; Exercise 2.10
(define (div-interval x y)
  (let ((upper (upper-bound y))
        (lower (lower-bound y)))
    (if (<= (* upper lower) 0)
        (error "Cannot divide by an interval that spans 0")
        (mul-interval x (make-interval (/ 1.0 upper)
                                       (/ 1.0 lower))))))
; Exercise 2.12
(define (make-center-percent c p)
  (let ((b1 (* c (- 100 p) 0.01))
        (b2 (* c (+ 100 p) 0.01)))
    (make-interval (min b1 b2) (max b1 b2))))
(define (center-interval i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (percent-interval i)
  (let ((u (upper-bound i))
        (l (lower-bound i)))
    (/ (- u l) (+ u l) 0.01)))
(define (width-interval i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
; Exercise 2.13
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

; Exercise 2.17
(define (last-pair items)
  (let ((coulder (cdr items)))
    (if (null? coulder)
        items
        (last-pair coulder))))

; Exercise 2.18
(define (reverse l)
  (define (reverse-iter l r)
    (if (null? l)
        r
        (reverse-iter (cdr l) (cons (car l) r))))
  (reverse-iter l nil))

; Exercise 2.19
(define (cc amount coin-values)
  (define first-denomination car)
  (define except-first-denomination cdr)
  (define no-more? null?)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else (+ (cc amount
                     (except-first-denomination coin-values))
                 (cc (- amount (first-denomination coin-values))
                     coin-values)))))

; Exercise 2.20
(define (same-parity first . remain)
  (define (same-parity-iter checker l)
    (if (null? l)
        nil
        (let ((carl (car l))
              (coulder (same-parity-iter checker (cdr l))))
          (if (checker carl)
              (cons carl coulder)
              coulder))))
  (cons first (same-parity-iter (if (even? first) even? odd?) remain)))

; Exercise 2.21
(define (square-list-by-hand items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list-by-hand (cdr items)))))
(define (square-list items) (map square items))

; Exercise 2.23
(define (phor-each f l)
  (if (not (null? l))
      (begin (f (car l))
             (phor-each f (cdr l)))))

; Exercise 2.25
(define (last-of-nest l)
  (cond ((not (pair? l)) l)
        ((or (null? (cdr l)) (pair? (car l))) (last-of-nest (car l)))
        (else (last-of-nest (cdr l)))))

; Exercise 2.27
(define (deep-reverse l)
  (define (deep-iter l r)
    (cond ((null? l) r)
          ((pair? l) (deep-iter (cdr l)
                                (cons (deep-reverse (car l)) r)))
          (else l)))
  (deep-iter l nil))

; Exercise 2.28
(define (fringe l)
  (cond ((null? l) nil)
        ((pair? l) (append (fringe (car l))
                           (fringe (cdr l))))
        (else (list l))))

; Exercise 2.29
(define (make-mobile left right) (list left right))
(define (make-branch len struct) (cons len struct))
(define left-branch car)
(define right-branch cadr)
(define branch-length car)
(define branch-structure cdr)
(define (total-weight mobile)
  (if (pair? mobile)
      (+ (total-weight (branch-structure (left-branch mobile)))
         (total-weight (branch-structure (right-branch mobile))))
      mobile))
(define (balanced-mobile? mobile)
  (if (pair? mobile)
      (let ((left (left-branch mobile))
            (right (right-branch mobile)))
        (let ((left-struct (branch-structure left))
              (right-struct (branch-structure right)))
          (and (= (* (total-weight left-struct)
                     (branch-length left))
                  (* (total-weight right-struct)
                     (branch-length right)))
               (balanced-mobile? left-struct)
               (balanced-mobile? right-struct))))
      true))

; Exercise 2.30
(define (square-tree-by-hand tree)
  (cond ((null? tree) nil)
        ((pair? tree) (cons (square-tree-by-hand (car tree))
                            (square-tree-by-hand (cdr tree))))
        (else (square tree))))
(define (square-tree tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (square-tree subtree)
             (square subtree)))
       tree))

; Exercise 2.31
(define (tree-map mapping tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (tree-map mapping subtree)
             (mapping subtree)))
       tree))

; Exercise 2.32
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s)))
            (first (car s)))
        (append rest
                (map (lambda (subset) (cons first subset))
                     rest)))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence)) (cons (car sequence)
                                          (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
(define (accumulate op last sequence)
  (if (null? sequence)
      last
      (op (car sequence)
          (accumulate op last (cdr sequence)))))
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (inc low) high))))
(define enumerate-tree fringe)

; Exercise 2.33
(define (map-accum p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              nil
              sequence))
(define (append-accum seq1 seq2)
  (accumulate cons seq2 seq1))
(define (length-accum sequence)
  (accumulate (lambda (current rest) (inc rest)) 0 sequence))

; Exercise 2.34
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

; Exercise 2.35
(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) (if (pair? x) (count-leaves x) 1)) t)))

; Exercise 2.36
(define (accumulate-n op last seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op last (map car seqs))
            (accumulate-n op last (map cdr seqs)))))

; Exercise 2.37
(define (dot-product v w) (accumulate + 0 (map * v w)))
(define (matrix-*-vector m v)
  (map (lambda (vector) (dot-product vector v)) m))
(define (transpose m)
  (accumulate-n cons nil m))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (vec) (matrix-*-vector cols vec)) m)))

; Exercise 2.38
(define fold-right accumulate)
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

; Exercise 2.39
(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))
(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (smallest-divisor n)
  (define (find-divisor test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((= (remainder n test-divisor) 0) test-divisor)
          (else (find-divisor (+ test-divisor 2)))))
  (if (even? n) 2 (find-divisor 3)))
(define (prime? n) (and (> n 1) (= (smallest-divisor n) n)))
(define (prime-sum? pair) (prime? (+ (car pair) (cdr pair))))

(define (flatmap proc seq) (accumulate append nil (map proc seq)))
(define (make-pair-sum pair)
  (let ((a (car pair))
        (d (cdr pair)))
    (list a d (+ a d))))
; Exercise 2.40
(define (unique-pairs low high)
  (flatmap (lambda (i)
             (map (lambda (j) (cons i j))
                  (enumerate-interval low (dec i))))
           (enumerate-interval (inc low) high)))
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs 1 n))))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))
(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

; Exercise 2.41
(define (triples-of-sum s n)
  (define (unique-triples low high)
    (flatmap (lambda (i)
               (map (lambda (pair) (list i (car pair) (cdr pair)))
                    (unique-pairs low (dec i))))
             (enumerate-interval (+ low 2) high)))
  (filter (lambda (triple) (= (accumulate + 0 triple) s))
          (unique-triples 1 n)))

; Exercise 2.42
(define (queens board-size)
  (define empty-board nil)
  (define (adjoin-position row col lst)
    (cons (cons row col) lst))
  (define (safe? k positions)
    (if (= k 1)
        true
        (let ((row (car (car positions)))
              (rest (cdr positions)))
          (accumulate (lambda (x y) (and x y))
                      true
                      (map (lambda (v)
                             (let ((x (car v))
                                   (y (cdr v)))
                               (not (or (= x row)
                                        (= (abs (/ (- x row) (- y k))) 1)))))
                           rest)))))
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions) (safe? k positions))
                (flatmap (lambda (rest-of-queens)
                           (map (lambda (new-row)
                                  (adjoin-position new-row
                                                   k
                                                   rest-of-queens))
                                (enumerate-interval 1 board-size)))
                         (queen-cols (- k 1))))))
  (queen-cols board-size))

; Exercise 2.54
(define (equal?? a b)
  (let ((pa (pair? a))
        (pb (pair? b)))
    (cond ((and pa pb) (and (equal?? (car a) (car b))
                            (equal?? (cdr a) (cdr b))))
          ((not (or pa pb)) (eq? a b))
          (else false))))

(define variable? symbol?)
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? poly num)
  (and (number? poly) (= poly num)))

; Exercise 2.57
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define addend cadr)
(define (augend x)
  (let ((dd (cddr x)))
    (if (null? (cdr dd)) (car dd) (cons '* dd))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define multiplier cadr)
(define (multiplicand x)
  (let ((dd (cddr x)))
    (if (null? (cdr dd)) (car dd) (cons '* dd))))

; Exercise 2.56
(define (make-exponentiation u n)
  (cond ((=number? n 0) 1)
        ((=number? n 1) u)
        ((and (number? u) (number? n)) (expt u n))
        (else (list '** u n))))
(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))
(define base cadr)
(define exponent caddr)

(define (deriv poly var)
  (cond ((number? poly) 0)
        ((variable? poly) (if (same-variable? poly var) 1 0))
        ((sum? poly) (make-sum (deriv (addend poly) var)
                               (deriv (augend poly) var)))
        ((product? poly) (let ((u (multiplier poly))
                               (v (multiplicand poly)))
                           (make-sum (make-product u (deriv v var))
                                     (make-product (deriv u var) v))))
        ((exponentiation? poly)
         (let ((u (base poly))
               (n (exponent poly)))
           (make-product (make-product n (make-exponentiation u (make-sum n -1)))
                         (deriv u var))))
        (else (error "unknown expression type: DERIV" poly))))

; Exercise 2.58
(define (memq item x)
  (cond ((null? x) false)
        ((eq? (car x) item) x)
        (else (memq item (cdr x)))))
(define (make-infix-sum a b)
  (cond ((=number? a 0) b)
        ((=number? b 0) a)
        ((and (number? a) (number? b)) (+ a b))
        (else (list a '+ b))))
(define (sum-infix? x) (memq '+ x))
(define (addend-infix x)
  (define (iter a b)
    (if (eq? (car b) '+)
        a
        (iter (append a (list (car b))) (cdr b))))
  (if (eq? (cadr x) '+)
      (car x)
      (iter '() x)))
(define (augend-infix x)
  (let ((b (cdr (memq '+ x))))
    (if (null? (cdr b)) (car b) b)))

(define (make-infix-product a b)
  (cond ((or (=number? a 0) (=number? b 0)) 0)
        ((=number? a 1) b)
        ((=number? b 1) a)
        ((and (number? a) (number? b)) (* a b))
        (else (list a '* b))))
(define (product-infix? x)
  (and (not (sum-infix? x))
           (memq '* x)))
(define multiplier-infix car)
(define (multiplicand-infix x)
  (let ((b (cddr x)))
    (if (null? (cdr b)) (car b) b)))

(define (deriv-infix poly var)
  (cond ((number? poly) 0)
        ((variable? poly) (if (same-variable? poly var) 1 0))
        ((sum-infix? poly)
         (make-infix-sum (deriv-infix (addend-infix poly) var)
                         (deriv-infix (augend-infix poly) var)))
        ((product-infix? poly)
         (let ((u (multiplier-infix poly))
               (v (multiplicand-infix poly)))
           (make-infix-sum (make-infix-product u (deriv-infix v var))
                           (make-infix-product (deriv-infix u var) v))))
        (else (error "unknown expression type: DERIV" poly))))

(define (element-of-uset? x uset)
  (cond ((null? uset) false)
        ((equal? x (car uset)) true)
        (else (element-of-uset? x (cdr uset)))))
(define (adjoin-uset x uset)
  (if (element-of-uset? x uset)
      uset
      (cons x uset)))
(define (intersection-uset uset1 uset2)
  (cond ((or (null? uset1) (null? uset2)) '())
        ((element-of-uset? (car uset1) uset2)
         (cons (car uset1) (intersection-uset (cdr uset1) uset2)))
        (else (intersection-uset (cdr uset1) uset2))))
; Exercise 2.59
(define (union-uset uset1 uset2)
  (if (null? uset1)
      uset2
      (union-uset (cdr uset1) (adjoin-uset (car uset1) uset2))))

; Exercise 2.60
(define element-of-dset? element-of-uset?)
(define adjoin-dset cons)
(define intersection-dset intersection-uset)
(define union-dset append)

(define (element-of-oset? x oset)
  (cond ((null? oset) false)
        ((= x (car oset)) true)
        ((< x (car oset)) false)
        (else (element-of-oset? x (cdr oset)))))
(define (intersection-oset oset1 oset2)
  (if (or (null? oset1) (null? oset2))
      '()
      (let ((x1 (car oset1))
            (x2 (car oset2)))
        (cond ((= x1 x2) (cons x1 (intersection-oset (cdr oset1) (cdr oset2))))
              ((< x1 x2) (intersection-oset (cdr oset1) oset2))
              ((> x1 x2) (intersection-oset oset1 (cdr oset2)))))))
; Exercise 2.61
(define (adjoin-oset x oset)
  (if (null? oset)
      (cons x '())
      (let ((a (car oset)))
        (cond ((< x a) (cons x oset))
              ((= x a) oset)
              (else (cons a (adjoin-oset x (cdr oset))))))))
; Exercise 2.62
(define (union-oset oset1 oset2)
  (if (or (null? oset1) (null? oset2))
      '()
      (let ((x1 (car oset1))
            (x2 (car oset2)))
        (cond ((= x1 x2) (cons x1 (union-oset (cdr oset1) (cdr oset2))))
              ((< x1 x2) (cons x1 (union-oset (cdr oset1) oset2)))
              (else (cons x2 (union-oset oset1 (cdr oset2))))))))

(define (make-tree entry left right)
  (list entry left right))
(define tree-entry car)
(define tree-left cadr)
(define tree-right caddr)
(define (element-of-tset? x tset)
  (if (null? tset)
      false
      (let ((entry (tree-entry tset)))
        (cond ((< x entry) (element-of-tset? x (tree-left tset)))
              ((> x entry) (element-of-tset? x (tree-right tset)))
              (else true)))))
(define (adjoin-tset x tset)
  (if (null? tset)
      (make-tree x '() '())
      (let ((entry (tree-entry tset))
            (left (tree-left tset))
            (right (tree-right tset)))
        (cond ((< x entry) (make-tree entry (adjoin-tset x left) right))
              ((> x entry) (make-tree entry left (adjoin-tset x right)))
              (else tset)))))

; Exercise 2.63
(define (tree->list tree)
  (define (iter rest result)
    (if (null? rest)
        result
        (iter (tree-left rest)
              (cons (tree-entry rest)
                    (iter (tree-right rest) result)))))
  (iter tree '()))

; Exercise 2.64
(define (list->tree elements)
  (define (partial-tree elts size)
    (if (= size 0)
        (cons '() elts)
        (let* ((left-size (quotient (dec size) 2))
               (right-size (- size left-size 1))
               (left-result (partial-tree elts left-size))
               (left-tree (car left-result))
               (non-left-elts (cdr left-result))
               (right-result (partial-tree (cdr non-left-elts) right-size))
               (right-tree (car right-result))
               (this-entry (car non-left-elts))
               (remaining-elts (cdr right-result)))
          (cons (make-tree this-entry left-tree right-tree)
                remaining-elts))))
  (car (partial-tree elements (length elements))))

; Exercise 2.65
(define (union-tset tset1 tset2)
  (list->tree (union-oset (tree->list tset1)
                          (tree->list tset2))))
(define (intersection-tset tset1 tset2)
  (list->tree (intersection-oset (tree->list tset1)
                                 (tree->list tset2))))

; Exercise 2.66
(define (lookup-tset given-key tset-of-records)
  (define key identity)
  (if (null? tset-of-records)
      false
      (let ((current-key (key (tree-entry tset-of-records))))
        (cond ((< given-key current-key)
               (lookup-tset given-key (tree-left tset-of-records)))
              ((> given-key current-key)
               (lookup-tset given-key (tree-right tset-of-records)))
              (else (tree-entry tset-of-records))))))

(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (decode bits tree)
  (define (choose-branch bit branch)
    (cond ((= bit 0) (left-branch branch))
          ((= bit 1) (right-branch branch))
          (else (error "bad bit: CHOOSE-BRANCH" bit))))
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))
(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair) (cadr pair))
                    (make-leaf-set (cdr pairs))))))

; Exercise 2.68
(define (encode message tree)
  (define (encode-symbol symbol tree)
    (if (leaf? tree)
        '()
        (let ((left (left-branch tree))
              (right (right-branch tree)))
          (cond ((element-of-uset? symbol (symbols left))
                 (cons 0 (encode-symbol symbol left)))
                ((element-of-uset? symbol (symbols right))
                 (cons 1 (encode-symbol symbol right)))
                (else (error "symbol is not in tree: ENCODE-SYMBOL" symbol))))))
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

; Exercise 2.69
(define (generate-huffman-tree pairs)
  (define (successive-merge pairs)
    (if (< (length pairs) 2)
        (car pairs)
        (successive-merge (adjoin-set (make-code-tree (car pairs) (cadr pairs))
                                      (cddr pairs)))))
  (successive-merge (make-leaf-set pairs)))

; Exercise 2.70
(define lyrics
  (encode '(Get a job
            Sha na na na na na na na na
            Get a job
            Sha na na na na na na na na
            Wah yip yip yip yip yip yip yip yip yip
            Sha boom)
          (generate-huffman-tree '((a 2) (Get 2) (Sha 3) (Wah 1)
                                   (boom 1) (job 2) (na 16) (yip 9)))))

; Exercise 2.71
(define (encoded-size n)
  (let* ((alphabet (enumerate-interval 0 (dec n)))
         (tree (generate-huffman-tree (map (lambda (k) (list k (expt 2 k)))
                                           alphabet))))
    (map (lambda (k) (length (encode (list k) tree))) alphabet)))

(define attach-tag cons)
(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum: TYPE-TAG" datum)))
(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum: CONTENTS" datum)))

(define (rectangular? z) (eq? (type-tag z) 'rectangular))
(define (polar? z) (eq? (type-tag z) 'polar))

(define (real-part-rectangular z) (car z))
(define (imag-part-rectangular z) (cdr z))
(define (magnitude-rectangular z)
  (sqrt (+ (square (real-part-rectangular z))
           (square (imag-part-rectangular z)))))
(define (angle-rectangular z)
  (atan (imag-part-rectangular z)
        (real-part-rectangular z)))
(define (make-from-real-imag-rectangular x y)
  (attach-tag 'rectangular (cons x y)))
(define (make-from-mag-ang-rectangular r a)
  (attach-tag 'rectangular
              (cons (* r (cos a)) (* r (sin a)))))

(define (real-part-polar z)
  (* (magnitude-polar z) (cos (angle-polar z))))
(define (imag-part-polar z)
  (* (magnitude-polar z) (sin (angle-polar z))))
(define (magnitude-polar z) (car z))
(define (angle-polar z) (cdr z))
(define (make-from-real-imag-polar x y)
  (attach-tag 'polar
              (cons (sqrt (+ (square x) (square y)))
                    (atan y x))))
(define (make-from-mag-ang-polar r a)
  (attach-tag 'polar (cons r a)))

(define (real-part z)
  (cond ((rectangular? z) (real-part-rectangular (contents z)))
        ((polar? z) (real-part-polar (contents z)))
        (else (error "Unknown type: REAL-PART" z))))
(define (imag-part z)
  (cond ((rectangular? z) (imag-part-rectangular (contents z)))
        ((polar? z) (imag-part-polar (contents z)))
        (else (error "Unknown type: IMAG-PART" z))))
(define (magnitude z)
  (cond ((rectangular? z) (magnitude-rectangular (contents z)))
        ((polar? z) (magnitude-polar (contents z)))
        (else (error "Unknown type: MAGNITUDE" z))))
(define (angle z)
  (cond ((rectangular? z) (angle-rectangular (contents z)))
        ((polar? z) (angle-polar (contents z)))
        (else (error "Unknown type: ANGLE" z))))

(define make-from-real-imag make-from-real-imag-rectangular)
(define make-from-mag-ang make-from-mag-ang-polar)
(define (add-complex z1 z2)
  (make-from-real-imag (+ (real-part z1) (real-part z2))
                       (+ (imag-part z1) (imag-part z2))))
(define (sub-complex z1 z2)
  (make-from-real-imag (- (real-part z1) (real-part z2))
                       (- (imag-part z1) (imag-part z2))))
(define (mul-complex z1 z2)
  (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                     (+ (angle z1) (angle z2))))
(define (div-complex z1 z2)
  (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                     (- (angle z1) (angle z2))))