(define Fibonacci
  (lambda (k)
    ((lambda (init) (init init k))
       (lambda (self n)
         (if (or (= n 0) (= n 1))
             n
             (+ (self self (- n 1)) (self self (- n 2))))))))

;; (Fibonacci 7)
;; Value: 13

(define (f x)
  ((lambda (even? odd?) (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0) true (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0) false (ev? ev? od? (- n 1))))))

(f 1)
;; => #f
(f 14)
;; => #t
