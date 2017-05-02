;; a
(define (integral-series input)
  (define (recur coeffs count)
    (cons-stream
     (* (/ 1 count) (stream-car coeffs))
     (recur (stream-cdr coeffs) (+ count 1))))
  (recur input 1))

;; b
(define exp-series
  (cons-stream 1 (integral-series exp-series)))
;; 1 1 1/2 1/6 1/24 1/120 1/720 1/5040 1/40320 1/362880

(define cosine-series
  (cons-stream 1 (scale-stream (integral-series sine-series) -1)))
;; 1 0 -1/2 0 1/24 0 -1/720 0 1/40320 0

(define sine-series
  (cons-stream 0 (integral-series cosine-series)))
;; 0 1 0 -1/6 0 1/120 0 -1/5040 0 1/362880
