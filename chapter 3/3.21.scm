(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue? queue) (null? (front-ptr queue)))

(define (make-queue) (cons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
	   ;last item in list rear-ptr - append to last item empty list 
           (set-cdr! (rear-ptr queue) new-pair)
	   ;pointer to last item - new item is now the last item
           (set-rear-ptr! queue new-pair)
           queue)))) 


(define (print-queue queue)
  (display (front-ptr queue)))


the Lisp printer prints the representation of the queue as the front pointer and rear pointer pair. The rear pointer will always point to the last item that was added to the queue.