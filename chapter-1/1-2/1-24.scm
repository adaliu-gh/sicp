
(define (search-for-primes n)


  (define (search-for-primes/i num count)
    (if (= count 0)
        (display "DONE!")
        (search-helper num count)))

  (define (search-helper num count)
    (timed-prime-test num)
    (cond
     [(fast-prime? num)
      (search-for-primes/i (add1 num) (sub1 count))]
     [else (search-for-primes/i (add1 num) count)]))

  (search-for-primes/i n 3))

;; RESULTS: 1.23 -> 1.24

;; 1000:
;; 1009 -> 0.001953125 -> 0.013916015625
;; 1013 -> 0.0009765625 -> 0.01220703125
;; 1019 -> 0.002197265625 -> 0.011962890625

;; 10,000:
;; 10007 -> 0.00903320312 -> 0.017822265625
;; 10009-> 0.0078125 ->0.01708984375
;; 10037-> 0.0029296875 -> 0.007080078125

;; 100,000:
;; 100003 ->0.025146484373 ->0.02294921875    *from here, Fermat test is faster*
;; 100019 ->0.0241699218759 ->0.01904296875
;; 100043 -> 0.025146484373 ->0.02197265625

;; 1000,000:
;; 10000 -> 0.0698242187503 ->0.0068359375
;; 1000025 -> 0.06689453133 ->0.005859375
;; 1000037 -> 0.0668945312537 ->0.006103515625

;;==================================

;; RACKET implementation of run-time of MIT
(define (runtime) (current-inexact-milliseconds))


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n)
      (report-prime (- (runtime) start-time))
      (display " no prime"))
  (display "\n"))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (fast-prime? n)

  (define (expmod base exp m)
    (cond
     [(zero? exp) 1]
     [(even? exp)
      (remainder (expt (expmod base (/ exp 2) m) 2) m)]
     [else
      (remainder (* base (expmod base (- exp 1) m)) m)]))

  (define (fermat-test n)
    (define (try-it a)
      (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

  (define (fast-prime-times? n times)
    (cond
     [(zero? times) #true]
     [(fermat-test  n) (fast-prime-times? n (- times 1))]
     [else #false]))

  (fast-prime-times? n 3))
