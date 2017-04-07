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
