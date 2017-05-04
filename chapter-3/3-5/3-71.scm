(load "3-70.scm")

(define (cube-sum x y) (+ (expt x 3) (expt y 3)))
(define (cube-sum-pair pair) (cube-sum (car pair) (cadr pair)))

(define cube-pairs
   (weighted-pairs integers integers cube-sum-pair))

(define (recur-check stream)
  (cond
   ((stream-null? stream)
    the-empty-stream)
   (else
    (let ((rest (stream-cdr stream)))
      (let ((sum1 (cube-sum-pair (stream-car stream)))
            (sum2 (cube-sum-pair (stream-car rest))))
        (if (= sum1 sum2)
            (cons-stream (cons sum1 (stream-car stream))
                         (cons-stream (cons sum2 (stream-car rest))
                                      (recur-check rest)))
            (recur-check rest)))))))

(define ramanujan-numbers (recur-check cube-pairs))
;; the first six Ramanujan numbers are 1729, 4104, 13832, 20683, 32832, 39312
