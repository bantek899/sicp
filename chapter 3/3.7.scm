
(define (make-joint account acc-password joint-password)
    ((account acc-password 'joint-account) account acc-password joint-password))
      

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (if (eq? p password)
	(cond ((eq? m 'withdraw) withdraw)
	      ((eq? m 'deposit) deposit)
	      ((eq? m 'joint-account) joint-account-helper)
	      (else (error "Unknown request -- MAKE-ACCOUNT"
			   m)))
	(error "Incorrect password")))
  dispatch)


(define (joint-account-helper acc acc-password joint-password)
  (lambda (pw m)
    (if (eq? pw joint-password)
	(acc acc-password m)
	(error "Incorrect joint account password"))))




