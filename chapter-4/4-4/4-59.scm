;; a
(meeting ?any (Friday ?time))

;; b
(rule (meeting-time ?person ?day-and-time)
      (and (meeting whole-company ?day-and-time)
           (meeting ?division ?day-and-time)
           (job ?person (?division . ?rest))))

;; c
(meeting-time (Hacker Alyssa P) (Wednesday ?any))
