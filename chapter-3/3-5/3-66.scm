(load "stream.scm")
(define (interleave s t)
  (cons-stream
   (stream-car s)
   (interleave t (stream-cdr s))))

(define (pairs s t)
  (cons-stream (list (stream-car s) (stream-car t))
               (interleave (stream-map
                            (lambda (x) (list (stream-car s) x))
                            (stream-cdr t))
                           (pairs (stream-cdr s) (stream-cdr t)))))

