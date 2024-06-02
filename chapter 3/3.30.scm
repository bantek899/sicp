
(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
        (c1 (make-wire))
        (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))




(define (ripple-carry-adder list-a list-b list-s c-out)
  (if (null? list-a)
      list-s
      (let ((c-in (make-wire))) 
	(begin (full-adder (car list-a) (car list-b) c-in (car list-s) c-out)
	       (ripple-carry-adder (cdr list-a) (cdr list-b) (cdr list-s) c-in)))))



delay = n * full-adder
      = n * (half-adder + half-adder + or-gate-delay)
      = n * ((2 * (or-gate-delay and-gate-delay inverter-delay and-gate-delay)) + or-gate-delay)



(define (ripple-carry-adder As Bs Ss C)
  (let ((c-in (make-wire)))
    (if ((null? (cdr As)))
        (set-signal! c-in 0)
        (ripple-carry-adder (cdr As) (cdr Bs) (cdr Ss) c-in))
    (full-adder (car As) (car Bs) c-in (car Ss) C)))


