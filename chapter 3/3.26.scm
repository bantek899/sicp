
(define (lookup key table)
  (let ((record (assoc key (cdr table))))
    (if record
	(entry-value record)
	false)))

(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
	(set-cdr! record value)
	(adjoin-record (cons key value) table))))


(define (adjoin-record entry tree)
  (cond ((null? tree) (set! tree (make-tree  entry '() '())))
	((< (entry-key entry) (entry-key (entry tree)))
	 (adjoin-record entry
			(left-branch tree)))
	(else (adjoin-record entry
			     (right-branch tree)))))


(define (assoc key records)
  (cond ((null? records) false)
	((equal? key (entry-key (entry records))) (entry records))
	((< key (entry-key (entry records)))
	 (assoc key (left-branch records)))
	(else (assoc key (right-branch records)))))



(define (entry tree)
  (car tree))

(define (entry-key entry)
  (car entry))

(define (entry-value entry)
  (cdr entry))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree record left right)
  (list record left right))

