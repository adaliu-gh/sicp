;; a
(controller
 (assign continue (label expt-done )) ; set up final return address

 expt-loop
 (test (op =) (reg n) (const 1))
 (branch (label base-case))
 (save n)
 (save continue)
 (assign n (op -) (reg n) (const 1))
 (assign continue (label after-expt))
 (goto (label expt-loop))

 after-expt
 (restore continue)
 (restore n)
 (assign val (op *) (reg b) (reg val)) ; val now contains x * (expt x (-1 n))
 (goto (reg continue)) ;return to caller


 base-case
 (assign val (const 1)) ; base-case: x^0 = 1
 (goto (reg continue))  ; return to caller

 expt-done)

;; b
(controller

 iter-loop
 (test (op =) (reg counter) (const 0))
 (branch (label base-case))
 (assign counter (op -) (reg counter) (const 1))
 (assign product (op *) (reg counter) (reg product))
 (goto iter-loop)

 iter-done)
