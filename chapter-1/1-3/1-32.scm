(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b) null-value
      (combiner (term a)
                (accumulate-recursive combiner null-value term (next a) next b))))

(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))
