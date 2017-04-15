;; A

;; File Name -> Record
(define (get-record file name)
  ((get 'get-record (type-tag file))
   (content file) name))

;; File = (cons 'division-type file-content)
;; every division must provide an interface:
;; (put 'get-record 'division-type
;;     {File Name -> Record})

;;==================================
;; B

;; Version 1
;; File -> Salary
(define (get-salary file name)
  ((get 'get-salary (type-tag file))
   (get-record file name)))

;; Record = (cons 'division-type record-content)
;; every division must provide an interface:
;; (put 'get-salary 'division-type
;;    {Record -> Salary})

;; Version 2
;; File Name -> Salary
(define (get-salary file name)
  ((get 'get-salary (type-tag file))
   (content file) name))

;; every division must provide an interface:
;; (put 'get-salary 'division-type
;;    {File Name -> Salary})
;; !!!!!!!
;; one downside of not tagging records is that individual records will become ghosts and float about, because no one will know what divisions they belong to. And there might exist records which have the same name but belong to different divisions. What if the headquarter wants to see an individual record (which happens often I believe)?

;;================================
;; C

;; [File] Name -> Record
(define (find-employee-record list-files name)
  (cond
   ((null? list-files) (error "no record for this employee" name))
   ((record? (get-record (car list-files) name))
    (get-record (car list-files) name))
   (else (find-employee-record (cdr list-files) name))))

;;=============================
;; D

;; the new company should tag its records and personnel files,
;; and provides interface procedures, including get-record and get-salary
