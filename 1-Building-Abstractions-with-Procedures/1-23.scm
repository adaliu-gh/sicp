
(define (next test-divisor)
  (cond
   [(= test-divisor 2) 3]
   [else (+ test-divisor 2)]))

;;===============================


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

;; RESULTS: ORIGINAL -> REFINED (around 1/2 ORIGINAL)

;; 1000:
;; 1009 -> 0.010009765625 -> 0.001953125
;; 1013 -> 0.010986328125 -> 0.0009765625
;; 1019 -> 0.010986328125 -> 0.002197265625

;; 10,000:
;; 10007 -> 0.015869140625 -> 0.009033203125
;; 10009 -> 0.01611328125 -> 0.0078125
;; 10037 -> 0.01708984375 -> 0.0029296875

;; 100,000:
;; 100003 -> 0.070068359375 ->0.025146484375
;; 100019 -> 0.06591796875 ->0.024169921875
;; 100043 -> 0.06591796875 -> 0.025146484375

;; 1000,000:
;; 1000003 -> 0.1259765625 -> 0.06982421875
;; 1000033 -> 0.134033203125 -> 0.06689453125
;; 1000037 -> 0.1259765625 -> 0.06689453125

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
     (else (find-divisor n (next test-divisor)))))

  (define (divides? a b)
    (= (remainder b a ) 0))
  (= n (smallest-divisor n)))
