;; RECURSIVE VERSION

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2) ))
         (* 3 (f-recursive (- n 3))))))


;; ITERATIVE VERSION

(define (f-iter n)

  (define (f-iter/i a b c count)
    (if (= count n)
        a
        (f-iter/i b c (+ c (* 2 b) (* 3 a)) (+ count 1))))

  (f-iter/i 0 1 2 0))
