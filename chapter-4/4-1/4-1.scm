;; from left to right
(define (list-of-values lov)
  (if (null? lov)
      '()
      (let ((first-value (eval (first lov))))
        (cons first-value (list-of-values (rest lov))))))

;; from right to left
(define (list-of-values lov)
  (if (null? lov)
      '()
      (let ((rest-values (eval (rest lov))))
        (cons (eval (first lov)) rest-values))))
