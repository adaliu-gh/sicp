(load "2-19.scm")

(define (same-parity . l)
  (let ((first-element-remain (remainder (car l) 2)))
    (my-filter (lambda (item)
              (= (remainder item 2)
                 first-element-remain))
            l)))

(same-parity 1 2 3 4 5 6 7)
;; => (1 3 5 7)
(same-parity 2 3 4 5 6 7)
;; => (2 4 6)
(same-parity 0)
;; => (0)

;;========================

(define (my-filter proc list)
  (if (null? list)
      list
      (if (proc (car list))
          (cons (car list) (my-filter proc (cdr list)))
          (my-filter proc (cdr list)))))

