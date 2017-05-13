(define (analyze-amb exp)
  (define (unambed items index)
    (define (recursive items count result)
      (cond ((null? items) result)
            ((= count index) (recursive (cdr items) (+ count 1) result))
            (else (cons (car items) (recursive (cdr items) (+ count 1) result)))))
    (recursive items 0 '()))
  (let ((cprocs (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
            fail
            (let ((index (random (length choices))))
              ((list-ref choices index)
               env
               succeed
               (lambda () (try-next (unambed choices index)))))))
      (try-next cprocs))))
