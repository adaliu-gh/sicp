(load "stream.scm")

(define (log2-stream n)
  (cons-stream (/ 1.0 n)
               (stream-map - (log2-stream (+ n 1)))))


(define (partial-sums stream)
  (cons-stream (stream-car stream)
               (add-streams (stream-cdr stream)
                            (partial-sums stream))))

(define natural-log-2
  (partial-sums (log2-stream 1)))
