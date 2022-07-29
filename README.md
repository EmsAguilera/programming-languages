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

![image](https://user-images.githubusercontent.com/71990835/181689511-5bf49729-0faf-493e-8bb3-5d823ff94da9.png)

In which we receive as arguments the name of the file we wish to scramble, the name in which we want to save the scrambled image and a boolean that will tell the program to either scramble or unscramble (true = scramble, false = unscramble). 

The function then converts the path given into an image we can work with. 
In addition to that, we have an if statement, where we determine whether to scramble or unscramble, depending on the flag. 

### Scrambling 

Now, on to the scrambling process. 
This is done with a few functions. The key functions are these:  

![image](https://user-images.githubusercontent.com/71990835/181690525-fd435dc5-0a09-4aa7-b522-5a3c832954f5.png)

These are the arithmetic operations done to each RGB color of the image. These functions are basically there to further encrypt the image´s pixel values.

As for the RGB values, these are changed with the following functions: 

<img width="421" alt="image" src="https://user-images.githubusercontent.com/71990835/181690821-8b5f4cc3-0270-4b41-ae47-d8d9b40c9c38.png">

For each color in our image, we change the redness of the old image by obscuring it´s intensity, basically multiplying its intensity by 31 and then taking the remainder modulo of 257. 
This process is done for each color in our image (Red-Green-Blue). Each function using the previous version of the image, thus scrambling it. 

These functions are called by our do_scramble function: 

![image](https://user-images.githubusercontent.com/71990835/181691614-8e5e2ea2-44c0-499c-be76-36996add8621.png)

Which is called by our main function. 

### Unscrambling 

To unscramble an image, we use the following functions:  

![image](https://user-images.githubusercontent.com/71990835/181691931-4f56bbb8-46be-448a-8cd5-5772b9d5420c.png)

Which are basically the reverse of the previous scramble functions. We begin with the last state of the image, and change the intensity of the blue color by multiplying it by 199. Then using the current state of the image nad changing the red color values, and so on. 

These functions are called by the do_unscramble function:

![image](https://user-images.githubusercontent.com/71990835/181692698-d0117b1b-b877-4384-89ce-aa331dbe68a0.png)

Which is called by our main function when needed. 






## Source

**Manipulating images:**
https://docs.racket-lang.org/teachpack/image.html.

**Images:  "image.rkt":**
https://docs.racket-lang.org/teachpack/2htdpimage.html#%28def._%28%28lib._2htdp%2Fimage..rkt%29._circle%29%29

**Image guide:**
https://docs.racket-lang.org/teachpack/2htdpimage-guide.html

