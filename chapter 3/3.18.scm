
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)



(define (is-cycle? x)
  (define (is-cycle-helper x next)
    (cond ((not (pair? x)) #f)
	  ((eq? x next) #t)
	  (else (or (is-cycle-helper x (cdr next))
		    (is-cycle-helper x (car next))))))
  (is-cycle-helper x (cdr x)))

(define z (make-cycle (list 'a 'b 'c)))


