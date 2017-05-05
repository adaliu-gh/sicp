(load "stream.scm")
(define (RC R C dt)
  (lambda (stream initial)
    (add-stream (scale-stream stream R)
                (integral (scale-stream stream (/ 1 C))
                          initial dt))))

(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (add-stream (scale-stream integrand dt)
                             int)))
  int)
