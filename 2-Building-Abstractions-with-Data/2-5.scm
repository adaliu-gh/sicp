(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car ab)
  (count-factors-in ab 2))

(define (cdr ab)
  (count-factors-in ab 3))

;;======================
;; Auxiliary Procedures

(define (count-factors-in product factor)

  (if (> (remainder product factor) 0)
      0
      (+ 1 (count-factors-in (/ product factor) factor))))

(define (count-factors-in/iter product factor)
  (define (iter result product)
    (if (> (remainder product factor) 0)
        result
        (iter (+ 1 result) (/ product factor))))
  (iter 0 product))

(define test1 (cons 0 0))
(define test2 (cons 0 1))
(define test3 (cons 1 0))
(define test4 (cons 12 34))

(car test1)
;; => 0
(cdr test1)
;; => 0
(car test2)
;; => 0
(cdr test2)
;; => 1
(car test3)
;; => 1
(cdr test3)
;; => 0
(car test4)
;; => 12
(cdr test4)
;; => 34
