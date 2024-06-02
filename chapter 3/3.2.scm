

(define (sqr x)
  (* x x))

(define (make-monitored f)
  (let ((counter 0))
    (define (mf c)
      (if (eq? c 'how-many-calls?)
	  counter
	  (begin (set! counter (+ counter 1))
		 (f c))))
    mf))

(define s (make-monitored sqr))

(s 100)

(s 25)

(s 2)

(s 'how-many-calls?)