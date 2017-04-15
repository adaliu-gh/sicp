(define (last-pair elements)
  (if (null? (cdr elements))
      (car elements)
      (last-pair (cdr elements))))

(last-pair (list 23 72 149 34))
;; => 34

;;================================
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(list-ref (list 23 72) 1)
;; => 72

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
(length (list 23 43 54))
;; => 3
