(define (cycle? x)
  (define passed '())
  (define (walk list)
    (cond
     ((null? list) #false)
     ((pair? (memq list passed)) #t)
     (else (begin
             (set! passed (cons list passed) )
             (walk (cdr list))))))
  (walk x))

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)


(define x (list 1 2 3))
;; (cycle? x)
;; => #f
(define cycle-x (make-cycle x))
;; (cycle? cycle-x)
;; => #t
