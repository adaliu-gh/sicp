(load "2-18.scm")

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount (except-first-denomination coin-values))
            (cc (- amount (first-denomination coin-values))
                coin-values)))))

(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? coin-values)
  (null? coin-values))


(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(cc 100 us-coins)
;; => 292
(cc 100 uk-coins)
;; => 104561
(define us-coins.v2 (list 1 5 10 25 50))
(cc 100 us-coins.v2)
;; => 292
;; the order of the list coin-values does not affect the answer produced by cc
