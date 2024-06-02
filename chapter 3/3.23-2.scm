(define (make-deque)
  (cons '() (cons '() '())))

(define (front-deque q)
  (car q))

(define (rear-deque q)
  (cddr q))

(define (empty-deque? q)
  (null? (front-deque q)))

(define (front-insert-deque! q item)
  (let ((old-q q)
	(new-q (cons item (cons '() '()))))
    (set-car! (cdr new-q) old-q)
    (set-cdr! (cdr new-q) (cddr old-q))
    (display new-q)
    (set-car! q (car new-q))
    (set-cdr! q (cdr new-q))))

(define (rear-insert-deque! q item)
  (cond ((empty-deque? q)
	 (set-car! q item)
	 (set-cdr! (cdr q) q))
	(else
	 (let ((new-item (cons item (cons '() (cddr q)))))
	   (set-car! (cdr (cddr q)) new-item)
	   (set-cdr! (cdr q) new-item))))
    q)


(define (front-delete-deque! q) q)
			     

(define (rear-delete-deque! q)
  (set-car! (cdr (cddr (cddr q))) '())
  (set-cdr! (cdr q) (cddr (cddr q))))

(define y (make-deque))

(rear-insert-deque! y 'f)

