(load "1-23.scm")

(define (filtered-accumulate combiner null-value term a next b filter?)
  (define (iter a result)
    (cond
     [(> a b) result]
     [(filter? a) (iter (next a) (combiner result (term a)) )]
     [else (iter (next a) result)]))
  (iter a null-value))

;;========================
;; a

(define (sum-square-prime a b)
  (define square (lambda (x) (* x x)))
  (filtered-accumulate + 0 square a add1 b prime?))

(sum-square-prime 1 6)
;; => 39

;;============================
;; b

(define (product-relative-prime n)
  (define identity (lambda (x) x))
  (define relative-prime? (lambda (x) (= 1 (gcd n x))))
  (filtered-accumulate * 1 identity 1 add1 (sub1 n) relative-prime?))

(define (gcd a b)
  (if (zero? b) a
      (gcd b (remainder a b))))

(product-relative-prime 6)
;; => 5


