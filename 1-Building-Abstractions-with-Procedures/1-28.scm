;; I haven't got this solution right


(define (miller-test? n)

  (define (non-trivial? x)
    (local ((define square-x (expt x 2)))
      (and (not (= x 1))
           (not (= x (sub1 n)))
           (= 1 (remainder square-x n)))))

  (define (expmod base exp)
    (cond
     [(zero? exp) 1]
     [(even? exp)
      (local ((define new-base (expmod base (/ exp 2))))
        (if (non-trivial? new-base)
            2
            (remainder (expt new-base 2) n)))]
     [else
      (remainder (* base (expmod base (sub1 exp))) n)]))

  (define (try-it times)
    (cond
     [(zero? times) #t]
     [(= 1 (expmod (add1 (random (- n 2))) (sub1 n)))
      (try-it (sub1 times))]
     [else #f]))

  (try-it 3))

;; miller-test is a little bit slower than Fermat-test ???

;;========================================

(define (search-for-primes n)

  (define (search-for-primes/i num count)
    (if (= count 0)
        (display "DONE!")
        (search-helper num count)))

  (define (search-helper num count)
    (timed-prime-test num)
    (cond
     [(miller-test? num)
      (search-for-primes/i (add1 num) (sub1 count))]
     [else (search-for-primes/i (add1 num) count)]))

  (search-for-primes/i n 3))

;; RACKET implementation of run-time of MIT
(define (runtime) (current-inexact-milliseconds))


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (miller-test? n)
      (report-prime (- (runtime) start-time))
      (display " no prime"))
  (display "\n"))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
