> import PicturesSVG

4.5 Give two other ways of completing the definition of fourPics given in this section.

> fourPics :: Picture -> Picture
> fourPics pic =
>    top `above` bottom
>      where
>        top = pic `beside` invertColour (flipV pic)
>        bottom = invertColour pic `beside` flipV pic

> fourPicsTwo :: Picture -> Picture
> fourPicsTwo pic =
>  top `above` bottom
>   where
>    top = pic `beside` invertColour (flipV pic)
>    bottom = flipV top

4.6 Another way of solving the problem is to break it down into one picture above another,
as in

fourPics :: Picture -> Picture

fourPics pic =
  top `above` bottom
   where
    top = ...:
	bottom ...
	
Give three different ways of completing this definition.