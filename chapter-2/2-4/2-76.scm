;;=========================
;; explicit dispatch
;; the manager has to add a new clause to every generic operator for every new data type, and every new data type has to guarantee that their procedure names are different from each other

;;===========================
;; data-directed dispatch
;; every new data-type has to put their interface procedures onto the dispatch table, and the procedure names could be the same. If there is a new generic procedure, the table should be extended

;;============================
;; message passing
;; every new data-type only has to provide a dispatch function, that's all.
