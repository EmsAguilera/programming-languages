#|
Scramble Project


Emilio Aguilera 
Emmanuel Bautista
|#

#lang racket

(require (planet dsheap/color-utils:1:3))
(require 2htdp/image)

(provide main do_scramble do_unscramble scramble-red scramble-blue scramble-green 
   unscramble-green unscramble-red unscramble-blue mult-mod obscure-intensity)

; This main function receives the name of the image and a name in which it will be saved. 
(define (main in-filename out-filename flag)
  (define my-image (bitmap/file in-filename))
    (if (eq? flag #t)
      (save-image (do_scramble my-image) out-filename)
      (save-image (do_unscramble my-image) out-filename)))


; Function that does all the scramble
(define (do_scramble img)
  (scramble-green (scramble-red (scramble-blue img))))

; Function that does all the unscramble
(define (do_unscramble img)
  (unscramble-green (unscramble-blue (unscramble-red img))))

; Scramble of reds
(define (scramble-red img)
  (for/image([old img])
    (red+color (obscure-intensity (color-red old) 31)old)))

; Scramble of blues
(define (scramble-blue img)
  (for/image([old img])
    (blue+color (obscure-intensity (color-blue old) 31)old)))

; Scramble of greens
(define (scramble-green img)
  (for/image([old img])
    (green+color (obscure-intensity (color-green old) 31)old)))

; Unscramble of blues
(define (unscramble-blue img)
  (for/image([old img])
    (blue+color (obscure-intensity (color-blue old) 199)old)))

; Unscramble of reds
(define (unscramble-red img)
  (for/image([old img])
    (red+color (obscure-intensity (color-red old) 199)old)))

; Unscramble of greens
(define (unscramble-green img)
  (for/image([old img])
    (green+color (obscure-intensity (color-green old) 199)old)))

; Operation functions 
(define (mult-mod x y z)
  (remainder (* x y) z))

(define (obscure-intensity n c)
 (sub1 (mult-mod(add1 n) c 257))) 
