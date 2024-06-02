(define (make-deque)
  (cons '() '()))

(define (empty-deque? q)
  (and (null? (front-deque q))
       (null? (rear-deque q))))

(define (front-deque q)
  (car q))

(define (rear-deque q)
  (cdr q))

(define (front-insert-deque! q item)
  (if (empty-deque? q)
      (let ((new-pair (cons item '())))
	(set-car! q new-pair)
	(set-cdr! q new-pair))
      (set-car! q (cons item (car q)))))

(define (rear-insert-deque! q item)
    (cond ((empty-deque? q)
	   (let ((new-pair (cons item '())))
	     (set-car! q new-pair)
	     (set-cdr! q new-pair)))
	  (else
	   (let ((new-pair (cons item (rear-deque q))))
	     (set-cdr! (rear-deque q) new-pair)
	     (set-cdr! q new-pair))))
    q)


(define (front-delete-deque! q)
  (set-car! q (car (cdr q))))
			     

(define (rear-delete-deque! q)
  (set-cdr! q (cdr (rear-deque q))))

(define y (make-deque))

(rear-insert-deque! y 'f)
