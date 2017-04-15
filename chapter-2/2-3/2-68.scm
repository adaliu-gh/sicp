(load "2-67.scm")

;; [Symbol] Tree -> [Bit]
;; encode the message into bits according to the code-tree
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

;; Symbol Tree -> [Bit]
(define (encode-symbol symbol tree)
  (cond
   ((boolean? (memq symbol (symbols tree)))
    (error "the symbol is not in the tree: " symbol))
   ((leaf? tree) '())
   (else
    (let ((left (left-branch tree))
          (right (right-branch tree)))
      (if (pair? (memq symbol (symbols left)))
          (cons 0 (encode-symbol symbol left))
          (cons 1 (encode-symbol symbol right)))))))


(encode '(A D A B B C A) sample-tree)
;; => (0 1 1 0 0 1 0 1 0 1 1 1 0)
