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


So we will be receiving an image, which we will then convert into pixel values. These pixel values are ordered in Red, Green and Blue (RGB). 

We are going to create a scrambling process, by which we define how many times every pixel is going to change and what values they are changing to. In doing that, the process will be repeated several times, and by the time the process is done, the image should become unrecognizable. 

The unscrambling process will be doing the same changing pixel values, but in a reverse order. So it will be like doing a step back in the scrambling process. And whenever the process is done, the image should be the same one we started with. 





## Source

**Manipulating images:**
https://docs.racket-lang.org/teachpack/image.html.

**Images:  "image.rkt":**
https://docs.racket-lang.org/teachpack/2htdpimage.html#%28def._%28%28lib._2htdp%2Fimage..rkt%29._circle%29%29
**Image guide:**
https://docs.racket-lang.org/teachpack/2htdpimage-guide.html

