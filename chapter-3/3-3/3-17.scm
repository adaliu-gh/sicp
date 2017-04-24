(define (count-pairs x)
  (define container '())
  (define (recur pairs)
    (cond
     ((not (pair? pairs)) 0)
     ((pair? (memq pairs container))
      (+ (recur (car pairs))
         (recur (cdr pairs))))
     (else
      (begin
        (set! container (cons pairs container))
        (+ (recur (car pairs))
           (recur (cdr pairs))
           1)))))
  (recur x))

(define z1 (cons 1 (cons 2 (cons 3 '()))))
;; => 3

(define a1 (cons 3 '()))
(define a2 (cons 2 a1))
(define z2 (cons a2 a1))
;; => 3

(define a3 (cons a1 a1))
(define z3 (cons a3 a3))
(count-pairs z3)
;; => 3
