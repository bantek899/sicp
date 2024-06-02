
(define (make-account balance password)
  (let ((access 0))
    (define (withdraw amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
        "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define call-the-cops
      (lambda ()
	(error "Calling the cops")))
    (define (dispatch p m)
	  (cond ((> access 2) (call-the-cops))
		((not (eq? p password)) (begin (set! access (+ access 1))
					       (display access)
					       (error "Incorrect password"))) 
		((eq? m 'withdraw) withdraw)
		((eq? m 'deposit) deposit)
		(else (error "Unknown request -- MAKE-ACCOUNT"
			     m))))
    dispatch))


(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)


((acc 'some-other-password 'deposit) 50)
