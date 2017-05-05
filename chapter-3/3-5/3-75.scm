(load "stream.scm")

(define (make-zero-crosssings input-stream last-value last-avpt)
  (let ((avpt (/ (+ (stream-car input-stream) last-value) 2)))
    (cons-stream (sign-change-detector avpt last-avpt)
                 (make-zero-crosssings
                  (stream-cdr input-stream) (stream-car input-stream) avpt))))
