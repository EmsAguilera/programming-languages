# Image Scrambler 

### By:

|  Student             |ID
|----------------|-------------------------------|
|Emilio Aguilera |A01351355
|Emmanuel Bautista|A01705220


# Description

Image scrambling is the method of rearranging the pixels randomly to make the image visually unreadable and break the correlation between the neighboring pixels. In general, during scrambling the pixel values remains unchanged.
Most of the image encryption algorithms involve two phases, namely confusion and diffusion. In the confusion phase the pixel positions are permuted using some scrambling technique and in the diffusion phase the pixel values are changed by using some inverse-able function.

## Objective 

We aim to successfully scramble an image by altering it's pixels using image scrambling techniques. In the same way, we should be able to retrieve the image to it's normal state, using the chosen procedure in reverse.  

If possible, we want to add  some sort of encryption key, so every image scramble is different if desired. Same key would be used to retrieve the image. 


## Implementation

We decided to use Racket for this project since it seemed the most friendly when using images and processing pixels compared to Elixir.

This is how we are planning on implementing it: 


So we will be receiving an image, which will then converted into pixel values. These pixel values are ordered in Red, Green and Blue (RGB), and are given as a list of colors as RGB values. We can also select which specific pixel to see from that list, and we can then turn back that list of values into the image. 



We are going to create a scrambling process, by which we define how many times every pixel is going to change and what values they are changing to. While doing that, the process will be repeated several times, and by the time the process is done, the image should become unrecognizable. 

![image](https://user-images.githubusercontent.com/44979133/180587087-6e9c5972-ecc3-4211-9a75-2fd2ab022a4b.png)

The unscrambling process will be doing the same changing pixel values, but in a reverse order. So it will be like doing a step back in the scrambling process. And whenever the process is done, the image should be the same one we started with. 

## Method

### Main function 

First, our program is used with the main function:

```
; This main function receives the name of the image and a name in which it will be saved. 

(define (main in-filename out-filename flag)
  (define my-image (bitmap/file in-filename))
    (if (eq? flag #t)
      (save-image (do_scramble my-image) out-filename)
      (save-image (do_unscramble my-image) out-filename)))

```

In which we receive as arguments the name of the file we wish to scramble, the name in which we want to save the scrambled image and a boolean that will tell the program to either scramble or unscramble (true = scramble, false = unscramble). 

The function then converts the path given into an image we can work with. 
In addition to that, we have an if statement, where we determine whether to scramble or unscramble, depending on the flag. 

### Scrambling 

Now, on to the scrambling process. 
This is done with a few functions. The key functions are these:  

```
; Operation functions 
(define (mult-mod x y z)
  (remainder (* x y) z))

(define (obscure-intensity n c)
 (sub1 (mult-mod(add1 n) c 257))) 
 
 ```

These are the arithmetic operations done to each RGB color of the image. These functions are basically there to further encrypt the image´s pixel values.

As for the RGB values, these are changed with the following functions: 

```
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
    
```

For each color in our image, we change the redness of the old image by obscuring it´s intensity, basically multiplying its intensity by 31 and then taking the remainder modulo of 257. 
This process is done for each color in our image (Red-Green-Blue). Each function using the previous version of the image, thus scrambling it. 

These functions are called by our do_scramble function: 

```

; Function that does all the scramble
(define (do_scramble img)
  (scramble-green (scramble-red (scramble-blue img))))

```


Which is called by our main function. 

### Unscrambling 

To unscramble an image, we use the following functions:  

```
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
```

Which are basically the reverse of the previous scramble functions. We begin with the last state of the image, and change the intensity of the blue color by multiplying it by 199. Then using the current state of the image nad changing the red color values, and so on. 

These functions are called by the do_unscramble function:

```
; Function that does all the unscramble
(define (do_unscramble img)
  (unscramble-green (unscramble-blue (unscramble-red img))))
```

Which is called by our main function when needed. 

## How to run

To compile and run the program, run the following command in the path where the project is saved.

```
racket -it scramble_project.rkt

```
Press enter and, if done succesfully, the terminal will show you are in interactive mode in racket.

![image](https://user-images.githubusercontent.com/71990835/181807343-4ec25e6f-e4d4-402f-9ba0-f6c2f1f41ba3.png)


Once there, run the main function with the first argument being the path of the image you want to scramble, the second being the path of where you want to save it, and the third a True value.

```

(main "data/dog.jpg" "results/out.jpg" #t)

```

This will return True, showing it worked.

![image](https://user-images.githubusercontent.com/71990835/181808329-efb8b4f8-77ea-49a5-bdd5-1192a35f1df4.png)

![image](https://user-images.githubusercontent.com/71990835/181808526-cac17a8d-34f8-40b9-9e33-ea98a6ad1717.png)

![image](https://user-images.githubusercontent.com/71990835/181808422-c61fb773-570b-4140-8972-8de4518d642d.png)

To  unscramble the image, call the main function again, receiving as arguments the image you want to unscramble, the path where it will be saved and a False value, to signal it will be unscrambled.

```

(main "results/out.jpg" "results/normalDog.jpg" #f)

```
It will return True, showing it worked. 

![image](https://user-images.githubusercontent.com/71990835/181810923-828ae437-3860-4faf-8fe7-e2a623806b2a.png)

<img width="259" alt="image" src="https://user-images.githubusercontent.com/71990835/181810973-4d31ac5e-3379-45aa-8557-a19d9d624158.png">

You can further compare the pixels of each image with the function test-pixels. It reveives the path of the image and the number of items in the pixel lists you want to see

```
(test-pixels "data/dog.jpg" 5)

```
![image](https://user-images.githubusercontent.com/71990835/181812329-61f0836d-e7c3-4b69-9efd-2779e33f9bb6.png)


And there you have it! If you followed the steps, you should have a scrambled image and an unscrambled image, in addition to the original. 












## Source

**Manipulating images:**
https://docs.racket-lang.org/teachpack/image.html.

**Images:  "image.rkt":**
https://docs.racket-lang.org/teachpack/2htdpimage.html#%28def._%28%28lib._2htdp%2Fimage..rkt%29._circle%29%29

**Image guide:**
https://docs.racket-lang.org/teachpack/2htdpimage-guide.html

