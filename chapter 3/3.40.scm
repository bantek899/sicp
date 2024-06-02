(define x 10)

(parallel-execute (lambda () (set! x (* x x)))
                  (lambda () (set! x (* x x x))))


100 * 100 * 100 =  1,000,000: P1 sets x to 100 then P2 sets x to 1000000
1000 * 1000 =  1000000: P2 sets x to 1000 then P1 sets x to x times x
10 * 1000 = 10,000: P2 changes x from 10 to 1000 between the 2 times that P1 accesses the value of x during the evaluation of (* x x)
10 * 10 * 100 = 10000 = P1 changes x from 10 to 100 between the 2 and third time P2 accesses the value of x during (* x x x)
10 * 100 * 100 = 100000 = P1 changes x from 10 to 100 between the 1st and 2nd time P2 access the value of x during (* x x x)
100 = P1 accesses x (twice) then P2 sets it to 100000 then P1 sets x to 100
1000 = P2 accesses x (thrice) then P1 sets x to 100 then P2 sets x




(define x 10)

(define s (make-serializer))

(parallel-execute (s (lambda () (set! x (* x x))))
                  (s (lambda () (set! x (* x x x)))))


100 * 100 * 100 =  1,000,000: P1 sets x to 100 then P2 sets x to 1000000
1000 * 1000 =  1000000: P2 sets x to 1000 then P1 sets x to x times x






