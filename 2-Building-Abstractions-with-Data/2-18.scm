(load "2-17.scm")

(define (reverse list)
  (define len (length list))
  (define (iter count result)
    (if (= count len)
        result
        (iter (+ 1 count) (cons (list-ref list count) result) )))
  (iter 0 '()))

(reverse (list 1 4 6 16 25))
;; => (25 16 6 4 1)

(define (reverse.v2 list)
  (define (iter items result)
    (if (null? items) result
        (iter (cdr items) (cons (car items) result))))
  (iter list '()))

(reverse.v2 (list 1 4 9 16 25))
;; => (25 16 9 4 1)
