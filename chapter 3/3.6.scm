


(define (rand symbol)
  (let ((x random-init))
    (cond ((eq? symbol 'generate)
	   (begin (set! x (rand-update x))
		  x))
	  ((eq? symbol 'reset)
	   (lambda (new-val)
	     (set! x new-val))))))

      
