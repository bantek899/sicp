


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


;; a

(define (make-semaphore n)
  (let ((mutex (make-mutex))
	(acquired 0))
    (define (acquire)
      (mutex 'acquire)
      (if (= acquired n)
	  (begin (mutex 'release)
		 (acquire))
	  (begin (set! acquired (+ acquired 1))
		 (mutex 'release))))
    (define (release)
      (set! acquired (- acquired 1))
      (mutex 'release))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire) (acquire))
	    ((eq? m 'release) (release))))
    the-semaphore))



;; b

(define (make-semaphore n)
  (let ((cell (list false))
	(processes 0))
    (define (acquire)
      (if (test-and-set! cell)
	  (acquire))
      (if (= processes n)
	  (begin (clear! cell)
		 (acquire))
	  (begin (set! processes (+ processes 1))
		 (clear! cell))))
    (define (release)  
      (set! processes (- processes 1))
      (clear! cell))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
	     (acquire))
	    ((eq? m 'release)
	     (release))))
    the-semaphore))