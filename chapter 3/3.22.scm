(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (empty-queue?) (null? front-ptr))
    (define (set-front-ptr! item) (set-cdr! rear-ptr item))
    (define (set-rear-ptr! item) (set! rear-ptr item))
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
	(cond ((empty-queue?)
	       (set! front-ptr new-pair)
	       (set! rear-ptr new-pair)
	       front-ptr)
	      (else
	       (set-front-ptr! new-pair)
	       (set-rear-ptr! new-pair)
	       front-ptr))))
    (define (delete-queue! queue)
      (cond ((empty-queue?)
	     (error "DELETE! called with an empty queue" queue))
	    (else
	     (set! front-ptr (cdr front-ptr))))
      front-ptr)
    (define (dispatch m)
      (cond ((eq? m 'insert-queue!) insert-queue!)
	    ((eq? m 'delete-queue!) delete-queue!)
	    ((eq? m 'front-ptr) front-ptr)
	    ((eq? m 'rear-ptr) rear-ptr)))
    dispatch))



(define b (make-queue))

((b 'insert-queue!) 'a)
