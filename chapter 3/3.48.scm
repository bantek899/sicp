

; deadlock avoidance method
;1. accounts numbered
;2. each process attempts to acquire the smaller-numbered account first

(define (serialized-exchange account1 account2)
  (let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer)))
    ((serializer1 (serializer2 exchange))
     account1
     account2)))


(define (exchange account1 account2)
  (let ((difference (- (account1 'balance)
                       (account2 'balance))))
    ((account1 'withdraw) difference)
    ((account2 'deposit) difference)))

(define (make-serializer)
  (let ((mutex (make-mutex)))
    (lambda (p)
      (define (serialized-p . args)
        (mutex 'acquire)
        (let ((val (apply p args)))
          (mutex 'release)
          val))
      serialized-p)))


(define (make-mutex)
  (let ((cell (list false)))            
    (define (the-mutex m)
      (cond ((eq? m 'acquire)
             (if (test-and-set! cell)
                 (the-mutex 'acquire))) ; retry
            ((eq? m 'release) (clear! cell))))
    the-mutex))
(define (clear! cell)
  (set-car! cell false))


(define (test-and-set! cell)
  (if (car cell)
      true
      (begin (set-car! cell true)
             false)))





this deadlock-avoidance method works because by numbering the accounts and each process attempting to acquire the smaller-numbered account first all subsequent procecsses are forced to wait for the smaller-numbered serializer to be released, creating a queue of processes waiting for the first procedure to finish.


(define (serialized-exchange account1 account2)
  (let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer))
	(acount1-id (account1 'id))
	(account2-id (account2 'id)))
    (if (< account1-id account2-id)
	((serializer2 (serializer1 exchange))
	 account1
	 account2)
	((serliazer1 (serializer2 exchange))
	 account1
	 account2))))


(define (make-account-and-serializer id balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((balance-serializer (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'balance) balance)
	    ((eq? m 'id) id)
            ((eq? m 'serializer) balance-serializer)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                         m))))
    dispatch))
