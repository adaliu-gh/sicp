(define (attach-tag type z)
  (if (eq? type 'scheme-number)
      z
      (cons type z)))

(define (type-tag z)
  (if (number? z)
      'scheme-number
      (car z)))

(define (contents z)
  (if (number? z)
      z
      (cadr z)))
