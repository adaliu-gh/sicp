(define (search-for-primes n)


  (define (search-for-primes/i num count)
    (if (= count 0)
        (display "DONE!")
        (search-helper num count)))

  (define (search-helper num count)
    (timed-prime-test num)
    (cond
     [(prime? num)
      (search-for-primes/i (add1 num) (sub1 count))]
     [else (search-for-primes/i (add1 num) count)]))

  (search-for-primes/i n 3))

;; RESULTS:

;; 1000:
;; 1009 -> 0.010009765625
;; 1013 -> 0.010986328125
;; 1019 -> 0.010986328125

;; 10,000:
;; 10007 -> 0.015869140625
;; 10009 -> 0.01611328125
;; 10037 -> 0.01708984375

;; 100,000:
;; 100003 -> 0.070068359375
;; 100019 -> 0.06591796875
;; 100043 -> 0.06591796875

;; 1000,000:
;; 1000003 -> 0.1259765625
;; 1000033 -> 0.134033203125
;; 1000037 -> 0.1259765625

;; this result does not correspond to the theoretical order of growth - sqrt(10)

;;==================================

;; RACKET implementation of run-time of MIT
(define (runtime) (current-inexact-milliseconds))


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      (display " no prime"))
  (display "\n"))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)

  (define (smallest-divisor n)
    (find-divisor n 2))

  (define (find-divisor n test-divisor)
    (cond
     ((> (expt test-divisor 2) n) n)
     ((divides? test-divisor n) test-divisor)
     (else (find-divisor n (+ 1 test-divisor)))))

  (define (divides? a b)
    (= (remainder b a ) 0))
  (= n (smallest-divisor n)))
