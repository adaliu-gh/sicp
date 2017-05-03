(load "stream.scm")
(define (triple s t u)
  (let ((pairs-tu (pairs t u)))
    (cons-stream (list (stream-car s) (stream-car t) (stream-car u))
                 (interleave
                  (stream-map
                   (lambda (x) (cons (stream-car s) x))
                   (stream-cdr pairs-tu))
                  (triple (stream-cdr s) (stream-cdr t) (stream-cdr u))))))

(define pythogorean-triples
  (stream-filter
   (lambda (x) (= (+ (square (car x))
                     (square (cadr x)))
                  (square (caddr x))))
   (triple integers integers integers)))
