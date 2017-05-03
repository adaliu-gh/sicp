(load "3-59.scm")
(define (mul-series s1 s2)
  (cons-stream
   (* (stream-car s1) (stream-car s2))
   (add-streams (add-streams (scale-stream (stream-cdr s1) (stream-car s2))
                             (scale-stream (stream-cdr s2) (stream-car s1)))
                (cons-stream 0 (mul-series (stream-cdr s1) (stream-cdr s2))))))

(define one-series (add-streams (mul-series sine-series sine-series) (mul-series cosine-series cosine-series)) )
