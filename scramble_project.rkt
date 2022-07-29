#|
Scramble Project


Emilio Aguilera 
Emmanuel Bautista
|#

#lang racket

(require (planet dsheap/color-utils:1:3))
(require 2htdp/image)

(provide main do_scramble do_unscramble scramble-red scramble-blue 
  scramble-green unscramble-green unscramble-red unscramble-blue test-pixels)

; This main function receives the route with name of the image and
; a route in which it will be saved. 
(define (main in-filename out-filename flag)
  (define my-image (bitmap/file in-filename))
    (if (eq? flag #t)
      (save-image (do_scramble my-image) out-filename)
      (save-image (do_unscramble my-image) out-filename)))

; This function receives an image and the amount of elements to show in a list.
; This function helps to test the main, comparing the colors of some pixels
; in the images.
(define (test-pixels img size)
  (define my-img (bitmap/file img))
    (take (image->color-list my-img) size))

; Function that does all the scramble, calls the scrambles functions of RGB.
(define (do_scramble img)
  (if (image? img)
    (scramble-green (scramble-red (scramble-blue img)))
    (do_scramble (bitmap/file img))))

; Function that does all the unscramble, calls the scrambles functions of RGB.
(define (do_unscramble img)
  (if (image? img)
    (unscramble-green (unscramble-blue (unscramble-red img)))
    (do_unscramble (bitmap/file img))))

; Scramble of reds
(define (scramble-red img)
  (if (image? img)
    (for/image([old img])
      (red+color (obscure-intensity (color-red old) 31) old))
    (scramble-red (bitmap/file img))))

; Scramble of blues
(define (scramble-blue img)
  (if (image? img)
    (for/image([old img])
      (blue+color (obscure-intensity (color-blue old) 31) old))
    (scramble-blue (bitmap/file img))))

; Scramble of greens
(define (scramble-green img)
  (if (image? img)
    (for/image([old img])
      (green+color (obscure-intensity (color-green old) 31) old))
    (scramble-green (bitmap/file img))))

; Unscramble of blues
(define (unscramble-blue img)
  (if (image? img)
    (for/image([old img])
      (blue+color (obscure-intensity (color-blue old) 199) old))
    (unscramble-blue (bitmap/file img))))

; Unscramble of reds
(define (unscramble-red img)
  (if (image? img)
    (for/image([old img])
      (red+color (obscure-intensity (color-red old) 199) old))
    (unscramble-red (bitmap/file img))))

; Unscramble of greens
(define (unscramble-green img)
  (if (image? img)
    (for/image([old img])
      (green+color (obscure-intensity (color-green old) 199) old))
    (unscramble-green (bitmap/file img))))

; Operation functions 
(define (mult-mod x y z)
  (remainder (* x y) z))

(define (obscure-intensity n c)
 (sub1 (mult-mod(add1 n) c 257))) 
