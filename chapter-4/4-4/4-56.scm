;; a
(and (supervisor ?name (Bitdiddle Ben))
     (address ?name ?address))

;; b
(and (salary (Bitdiddle Ben) ?ben)
     (salary ?name ?amount)
     (list-value < ?amount ?ben))

;; c
(and (supervisor ?name ?supervisor)
     (job ?supervisor ?job)
     (not (job ?supervisor (computer . ?type))))
