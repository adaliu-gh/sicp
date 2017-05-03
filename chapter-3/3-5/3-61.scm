(load "3-60.scm")

(define (invert-unit-series s)
  (cons-stream 1
               (stream-map (lambda (x) (- 0 x))
                           (mul-series (stream-cdr s)
                                       (invert-unit-series s)))))


;;???
;; or
;; (define (invert-unit-series s)
;;         (define inverted-series ...)
;;         inverted-series)
