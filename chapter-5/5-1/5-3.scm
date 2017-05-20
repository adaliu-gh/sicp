(controller          ;; of sqrt
 (assign guess (const 1.0))
 test-guess
 (test (op good-enough?) (reg guess))
 (branch (lable done))
 (assign guess (op improve) (reg guess))
 (goto test-guess)
 done
 (perform (op print) (reg guess)))

(controller          ;; of good-enough?
 (assign after-square (op *) (reg guess) (reg guess))
 (assign after-diff (op -) (reg x) (reg after-square))
 (assign after-abs (op abs) (reg after-diff))
 (assign result (op <) (reg after-abs) (const 0.001)) ;; output the result to the main function
 (perform (op output) (reg result)))

(controller          ;; improve
 (assign after-/ (op /) (reg x) (reg guess))
 (assign result (op average) (reg guess) (reg after-/)) ;; output the result
 (perform (op output) (reg result)))

(controller          ;; average
 (assign x/2 (op /) (reg guess) (const 2.0))
 (assign y/2 (op /) (reg after-/) (const 2.0))
 (assign result (op +) (reg x/2) (reg y/2))
 (perform (op output) (reg result)))
