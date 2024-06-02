


; L-R (+ (f 0) (f 1)) = 0
; R-L (+ (f 0) (f 1)) = 1 

(define generate-f
  (let ((val ()))
    (lambda (n)
      (cond ((null? val)
	     (set! val n)))
      val)))
       
(define (f n)
  (generate-f n))
     
     