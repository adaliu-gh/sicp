(define (make-table same-key?)
  (let ((local-table (list '*table*)))

    (define (assoc key records)
      (cond ((null? records) #false)
            ((same-key? key (caar records))
             (car records))
            (else (assoc key (cdr records)))))

    (define (lookup keys)
      (define (iter remain-keys records)
        (cond
         ((null? remain-keys) records)
         ((not (pair? records)) #false)
         (else (let ((record (assoc (car remain-keys) records)))
                 (if record
                     (iter (cdr remain-keys) (cdr record))
                     #false)))))
      (iter keys (cdr local-table)))

    (define (insert! keys value)
      (define (iter ks records)
        (cond
         ((null? ks) (set-cdr! records value))
         ((or (null? (cdr records)) (not (pair? (cdr records))))
          (set-cdr! records (list (cons (car ks) '()) ))
          (iter (cdr ks) (cadr records)))
         (else
          (let ((record (assoc (car ks) (cdr records))))
            (if record
                (iter (cdr ks) record)
                (begin (set-cdr! records
                                 (cons (list (car ks))
                                       (cdr records)))
                       (iter (cdr ks) (cadr records))))))))
      (iter keys local-table))

    (define (dispatch m)
      (cond
       ((eq? m 'lookup) lookup)
       ((eq? m 'insert!) insert!)))
    dispatch))

(define (lookup keys table)
  ((table 'lookup) keys))
(define (insert! keys value table)
  ((table 'insert!) keys value))
