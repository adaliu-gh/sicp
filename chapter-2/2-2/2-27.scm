(define (deep-reverse list)
  (define (iter items result)
      (cond
       ((null? items) result)
       ((pair? (car items))
        (iter (cdr items) (cons (deep-reverse (car items)) result)))
       (else (iter (cdr items) (cons (car items) result)))))
  (iter list '()))

(define x (list (list 1 2) (list 3 4)))
x
(deep-reverse x)
;; => ((4 3) (2 1))
