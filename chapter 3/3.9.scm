(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))
      
      
(factorial 6)
      
GLOBAL ENVIRONMENT

factorial:
parameters: n
body: (if (= n 1)
      1
      (* n (factorial (- n 1)))
      
      
E1:

n:6

(if (= n 1)
      1
      (* n (factorial (- n 1)))
      
E2:

n:5

(if (= n 1)
      1
      (* n (factorial (- n 1)))
      
      
E3:

n:4

(if (= n 1)
      1
      (* n (factorial (- n 1)))
      
E4:

n:3

(if (= n 1)
      1
      (* n (factorial (- n 1)))


E5:

n:2

(if (= n 1)
      1
      (* n (factorial (- n 1)))
      
      
E6:

n:1

(if (= n 1)
      1
      (* n (factorial (- n 1)))






(define (factorial n)
  (fact-iter 1 1 n))
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

GLOBAL ENVIRONMENT

factorial: 
parameters: n
body: (fact-iter 1 1 n)

fact-iter:
parameters: product, counter, max-count
body: (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count))
                 
                 
E1:

n:6

(fact-iter 1 1 n)


E2:

product: 1
counter: 1
max-count: 6

(if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count))
                 
                 
E3:

product: 1
counter: 2
max-count: 6

(if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count))
                 
                 
E4:

product: 2
counter: 3
max-count: 6

(if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count))

E5:

product: 6
counter: 4
max-count: 6

(if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count))
                                  
E6:

product: 24
counter: 5
max-count: 6

(if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count))     
                 
E7:

product: 120
counter: 6
max-count: 6

(if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count))                                 
               
E8:

product: 720
counter: 7
max-count: 6

(if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count))                                 

