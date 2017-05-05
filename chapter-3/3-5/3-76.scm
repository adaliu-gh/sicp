(load "stream.scm")

(define (smooth singals)
  (define (average a b)
    (/ (+ a b) 2))
  (define (recursive input-stream last-value)
    (cons-stream (average (stream-car input-stream) last-value)
                 (recursive (stream-cdr input-stream) (stream-car input-stream))))
  (recursive singals 0))

(define (smooth.v2 singals)
  (define (average a b)
    (/ (+ a b) 2))
  (stream-map average singals (cons-stream 0 singals)))
