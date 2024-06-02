GLOBAL ENV: 

cons
parameters: x, y
body: ...
(dispatch m)


(define x (cons 1 2))

GLOBAL ENV: 

x:
paremeters: m

E1: 
x: 1
y: 2
parameters: m



(define z (cons x x))

GLOBAL ENV: 

z: 
paremeters: m


E2:
x: x
y: x
parameters: m

(set-car! (cdr z) 17)

GLOBAL ENV: 
parameters: z, new-value

E3:
z: (cdr z)
new-value: 17

((x 'set-car!) 17)



E4:
m: cdr


E4:
set! x 17

E2: 
x:7



(car x)
E5: 
m: 'car
x: 17

17
GLOBAL ENV: 

symbol: 17


