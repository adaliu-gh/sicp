(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (term n)
    (define x (+ a (* n h)))
    (cond
     [(zero? n) (f x)]
     [(even? n) (* 2 (f x))]
     [else (* 4 (f x))]))

  (* h 1/3 (sum term 0 add1 n)))

(exact->inexact (integral-simpson cube 0 1 100) )
;; => 0.25333333333333335
(exact->inexact (integral-simpson cube 0 1 1000) )
;; => 0.25033333333333335
;; less precise compared to the procedure integral ???

;;=========================

(define cube
  (lambda (x) (* x x x)))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (sum term start next end)
  (cond
   [(> start end) 0]
   [else (+ (term start)
            (sum term (next start) next end))]))
