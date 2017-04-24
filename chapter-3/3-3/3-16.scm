(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define z1 (cons 1 (cons 2 (cons 3 '()))))
;; => 3

(define a1 (cons 3 '()))
(define a2 (cons 2 a1))
(define z2 (cons a2 a1))
;; => 4

(define a3 (cons a1 a1))
(define z3 (cons a3 a3))
;; => 7

