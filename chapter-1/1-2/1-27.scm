
(define (carmichael-test? n)

  (define (expmod base exp m)
    (cond
     [(zero? exp) 1]
     [(even? exp)
      (remainder (expt (expmod base (/ exp 2) m) 2) m)]
     [else
      (remainder (* base (expmod base (- exp 1) m)) m)]))

  (define (mod-congruent? a)
    (cond
     [(= a n) #t]
     [ (= (expmod a n n) a)
       (mod-congruent? (add1 a))]
     [else #f]))

  (mod-congruent? 2))


(carmichael-test? 561) ; #t
(carmichael-test? 1105) ; #t
(carmichael-test? 1729) ; #t
(carmichael-test? 2465) ; #t
(carmichael-test? 2821) ; #t
(carmichael-test? 6601) ; #t
