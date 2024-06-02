

(define (is-cycle? x)
  (let ((visited '()))
    (define (iter index)
      (cond ((null? (list-tail x index)) #f)
	    ((eq? (list-tail x index) x) #t)
	    (else (iter (+ index 1)))))
    (iter 1)))
