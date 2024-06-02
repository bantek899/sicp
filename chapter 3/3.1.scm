
(define (make-accumulator num)
  (lambda (add)
    (begin (set! num (+ num add))
	   num)))

(define A (make-accumulator 5))

(A 10)

(A 10)