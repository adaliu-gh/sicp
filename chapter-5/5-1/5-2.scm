(data-paths
 (registers
  ((name counter)
   (buttons ((name count<-add1) (source (operation +1)))))
  ((name product)
   (buttons ((name product<-mul) (source (operation *))))))
 (operations
  ((name +1) (inputs (register counter)))
  ((name *) (inputs (register counter) (register product)))
  ((name >) (inputs (register counter) (constant N)))))

(controller
 (assign product (const 1))
 (assign counter (const 1))
 test-counter
 (test (op >) (reg counter) (const N))
 (branch (lable fact-done))
 (assign product (op *) (reg counter) (reg product))
 (assign counter (op +1) (reg counter))
 (goto (lable test-counter))
 fact-done)
