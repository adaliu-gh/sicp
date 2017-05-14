(rule (grandfather ?g ?s)
      (and (father ?g ?f)
           (father ?f ?s)))
(rule (father ?m ?s)
      (and (wife ?m ?w)
           (father ?w ?s)))

;;
(grandson Cain ?x)

(father Lamech ?x)

(grandson Methushael ?x)
