
(rule (can-replace ?person-1 ?person-2)
      (and (not (same ?person-1 ?person-2))
           (job ?person-1 ?job-1)
           (job ?person-2 ?job-2)
           (or (same ?job-1 ?job-2)
               (can-do-job ?job-1 ?job-2))))


;; a
(can-replace ?x (Fect Cy D))
;; b
(and (can-replace ?x ?y)
     (salary ?x ?x-salary)
     (salary ?y ?y-salary)
     (list-value > ?y-salary ?x-salary))

(rule (same ?x ?x))
;; (rule (in ?x ?y)
      ;; (or (same ?y (?x . ?any))
          ;; (in (?y-1 ?x) (?y-1 . ?y-rest))))
