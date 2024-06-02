


(define (estimate-integral p x1 x2 y1 y2 trials)
  (define (experiment)
    (p (random-in-range x1 x2)
       (random-in-range y1 y2)))
  (* (- x2 x1)
     (- y2 y1)
     (monte-carlo trials experiment)))

			   
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))


; area = pi * r^2
; area = pi * 1^2
; area = pi

; 1 = x^2 + y^2

(define (unit-circle-test x y)
    (<= (+ (square x)
	   (square y))
	1.0))


(define (estimate-pi trials)
  (estimate-integral unit-circle-test -1.0 1.0 -1.0 1.0 trials))

