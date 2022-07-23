#|
First advance of project

It encripts an image calling each function
We still have to put all together 

Emilio Aguilera 
Emmanuel Bautista
|#


#lang racket


(provide mult-mod obscure-intensity)

(define (mult-mod x y z)
  (remainder (* x y) z))

(define (obscure-intensity n c)
 (sub1 (mult-mod(add1 n) c 257))) 
