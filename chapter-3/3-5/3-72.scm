(load "3-70.scm")

(define (square-sum x y) (+ (expt x 2) (expt y 2)))
(define (square-sum-pair pair) (square-sum (car pair) (cadr pair)))

(define square-pairs
  (weighted-pairs integers integers square-sum-pair))

(define (recur-check stream)
  (cond
   ((stream-null? stream)
    the-empty-stream)
   (else
    (let ((rest (stream-cdr stream)))
      (let ((sum1 (square-sum-pair (stream-car stream)))
            (sum2 (square-sum-pair (stream-car rest)))
            (sum3 (square-sum-pair (stream-car (stream-cdr rest)))))
        (if (= sum1 sum2 sum3)
            (cons-stream (list sum1 (stream-car stream)
                               (stream-car rest)
                               (stream-car (stream-cdr rest)))
                         (recur-check rest))
            (recur-check rest)))))))

(define square-numbers (recur-check square-pairs))

;;(325 (1 18) (6 17) (10 15))
;;(425 (5 20) (8 19) (13 16))
;;(650 (5 25) (11 23) (17 19))
;;(725 (7 26) (10 25) (14 23))
;;(845 (2 29) (13 26) (19 22))
