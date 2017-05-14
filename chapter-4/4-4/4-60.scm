(rule (lives-near-no-repetition ?a ?b)
      (and (lives-near ?a ?b)
           (over-ranked ?a ?b))) ;; just add a sorting rule
