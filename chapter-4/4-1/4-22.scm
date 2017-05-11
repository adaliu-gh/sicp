(define (analyze-let let)
  (analyze (let->call let)))
