(define (make-table same-key?)
  (let ((table (list '*table* )))

    (define (assoc key records)
      (cond ((null? records) #false)
            ((same-key? key (caar records))
             (car records))
            (else (assoc key (cdr records)))))

    (define (lookup key)
      (let ((record (assoc key (cdr table))))
        (if record
            (cdr record)
            #false)))

    (define (insert! key value)
      (let ((record (assoc key (cdr table))))
        (if record
            (set-cdr! record value)
            (set-cdr! table (cons (cons key value) (cdr table))))))

    (define (dispatch m)
      (cond
       ((eq? m 'lookup) lookup)
       ((eq? m 'insert!) insert!)))
    dispatch))

(define (lookup key table)
  ((table 'lookup) key))
(define (insert! key value table)
  ((table 'insert!) key value))
