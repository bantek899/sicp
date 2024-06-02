(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)
(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal" s))))


(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
           (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)






a1 -- | inverter -- c1 
0                   1
                             and --- c2 ---- inveret ---- c3
                                     0                     1

a2 ----------------- 
1


1 and 1 = 1
0 and 1 = 0
1 and 0 = 0
0 and 1 = 0


1 or 1 = 1 y
0 or 0 = 0 x 
1 or 0 = 1 y
0 or 1 = 1 y




a1 -- inverter -- c1 
0                 1
                             and --- c3 ---- inveret ---- output
                                     0                  1

a2 -- inverter -- c2
1                 0


1 or 1 = 1 y
0 or 0 = 0 y
1 or 0 = 1 y
0 or 1 = 1 y



(define (or-gate a1 a2 output)
  (let ((c1 (make-wire))
	(c2 (make-wire))
	(c3 (make-wire)))
    (inverter a1 c1)
    (inverter a2 c2)
    (and-gate c1 c2 c3)
    (inverter c3 output)
    'ok))



the delay time of or-gate will be and-gate-delay and three inverter-delays