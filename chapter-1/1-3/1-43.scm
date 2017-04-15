(define (repeated proc n)
  (define (iter i result)
    (if (= i 1) result
        (iter (sub1 i) (compose proc result))))
  (iter n proc))

(define (square x) (* x x))

((repeated square 2) 5)
;; => 625
