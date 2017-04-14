(load "2-68.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;; [<Leaf] -> Tree
(define (successive-merge leafs)
  (cond
   ((null? leafs) '())
   ((null? (cdr leafs)) (car leafs))
   (else
    (let ((first (car leafs)) (second (cadr leafs)) (remain (cddr leafs)))
      (if (leaf? first)
          (successive-merge
           (adjoin-set (make-code-tree first second) remain))
          (successive-merge
           (adjoin-set (make-code-tree second first) remain)))))))

(define sample-pairs
  '((A 8) (B 3) (C 1) (D 1) (E 1) (F 1) (G 1) (H 1)))

(generate-huffman-tree sample-pairs)
;; => ((leaf A 8) (((leaf B 3) ((leaf D 1) (leaf C 1) (D C) 2) (B D C) 5) (((leaf F 1) (leaf E 1) (F E) 2) ((leaf H 1) (leaf G 1) (H G) 2) (F E H G) 4) (B D C F E H G) 9) (A B D C F E H G) 17)
