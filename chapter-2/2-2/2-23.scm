(define (for-each proc items)
  (define (operate items)
    (proc (car items))
    (for-each proc (cdr items)))
  (if (null? items)
      "done"
      (operate items)))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 1 2 3 4))

(define (for-each.v2 proc items)
  (if (null? items)
      "done"
      ((lambda ()
         (proc (car items))
         (for-each.v2 proc (cdr items))))))

(for-each.v2 (lambda (x)
               (newline)
               (display x))
             (list 1 2 3 4))
