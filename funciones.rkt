#lang racket


(provide mult-mod obscure-intensity)

(define (mult-mod x y z)
  (remainder (* x y) z))

(define (obscure-intensity n c)
 (sub1 (mult-mod(add1 n) c 257))) 
