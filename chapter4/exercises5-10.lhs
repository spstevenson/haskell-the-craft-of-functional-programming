> import PicturesSVG
> import Prelude

4.5 Give two other ways of completing the definition of fourPics given in this section.

We could try and do this without using local definitions.

> fourPics :: Picture -> Picture
> fourPics pic = (pic `beside` invertColour (flipV pic)) `above` (invertColour pic `beside` flipV pic)

We could make a local definition for flipped.

> fourPics2 :: Picture -> Picture
> fourPics2 pic = (pic `beside` invertColour flipped) `above` (invertColour pic `beside` flipped)
>  where flipped = flipV pic

4.6 Another way of solving the problem is to break it down into one picture above another,
as in

fourPics :: Picture -> Picture

fourPics pic =
  top `above` bottom
   where
    top = ...:
	bottom ...
	
Give three different ways of completing this definition.

> fourPics3 :: Picture -> Picture
> fourPics3 pic =
>    top `above` bottom
>      where
>        top = pic `beside` invertColour (flipV pic)
>        bottom = invertColour pic `beside` flipV pic

> fourPics4 :: Picture -> Picture
> fourPics4 pic =
>  top `above` bottom
>   where
>    top = pic `beside` invertColour (flipV pic)
>    bottom = flipV top

> fourPics5 :: Picture -> Picture
> fourPics5 pic = top `above` bottom
>  where
>   top = pic `beside` mirrorFlip
>   bottom = flipV top
>   mirrorFlip = invertColour (flipV pic)

4.7 Give two other ways of defining the fourPics function.

We could try and do this by having left and right rather than above and below.

> fourPics6 :: Picture -> Picture
> fourPics6 pic = left `beside` right
>  where
>   left = pic `above` (invertColour pic)
>   right = invertColour (flipV left)

We could break this down further with one more local definition.

> fourPics7 :: Picture -> Picture
> fourPics7 pic = left `beside` right
>  where
>   left = pic `above` (invertColour pic)
>   right = invert left
>   invert pic = invertColour (flipV pic)

4.8 Define the possible value as used in the triArea function.

> triArea :: Float -> Float -> Float ->Float
> triArea a b c
>  | possible = sqrt(s*(s-a)*(s-b)*(s-c))
>  | otherwise = 0
>  where
>   s = (a+b+c)/2
>   possible = allPositive && (b+c) > a && (a+c) > b && (a+b) > c
>   allPositive = a > 0 && b > 0 && c > 0

4.9 Define the function

maxThreeOccurs :: Int -> Int -> Int -> (Int,Int)

which returns the maximum of three integers paired with the number of
times it occurs among the three. A natural solution first finds the
maximum, and then investigates how often it occurs among the three.
Discuss how you would write your solution if you were not allowed to
use where-definitions.

> boolToInt :: Bool -> Int
> boolToInt bool
>  | bool = 1
>  | not bool = 0

> maxThreeOccurs :: Int -> Int -> Int -> (Int,Int)
> maxThreeOccurs x y z = (maxThree, maxOccurs)
>  where
>   maxThree = max x (max y z)
>   maxOccurs = boolToInt(x == maxThree) + boolToInt(y == maxThree) + boolToInt(z == maxThree)

If we were not allowed to use where-definitions we could use other functions that
are not local definitions. Or we could embed the definitions in the main definition.
This would make the function much less readable. Finally, we could make use of let
expression to replace the where clauses.

4.10 Give sample calculations of 

maxThreeOccurs 4 5 5
maxThreeOccurs 4 5 4

using your definition of maxThreeOccurs from the previous question.


maxThreeOccurs 4 5 5

(maxThree, maxOccurs)
(max x (max y z), boolToInt(x == maxThree) + boolToInt(y == maxThree) + boolToInt(z == maxThree))
(max x (max y z), boolToInt(x == max x (max y z)) + boolToInt(y == max x (max y z)) + boolToInt(z == max x (max y z)))
(max 4 (max 5 5), boolToInt(4 == max 4 (max 5 5)) + boolToInt(5 == max 4 (max 5 5)) + boolToInt(5 == max 4 (max 5 5)))
(max 4 5, boolToInt(4 == max 4 5) + boolToInt(5 == max 4 5) + boolToInt(5 == max 4 5))
(5, boolToInt(4 == 5) + boolToInt(5 == 5) + boolToInt(5 == 5))
(5, boolToInt(False) + boolToInt(True) + boolToInt(True))
(5, 0 + 1 + 1)
(5, 2)

maxThreeOccurs 4 5 4

(maxThree, maxOccurs)
(max x (max y z), boolToInt(x == maxThree) + boolToInt(y == maxThree) + boolToInt(z == maxThree))
(max x (max y z), boolToInt(x == max x (max y z)) + boolToInt(y == max x (max y z)) + boolToInt(z == max x (max y z)))
(max 4 (max 5 4), boolToInt(4 == max 4 (max 5 4)) + boolToInt(5 == max 4 (max 5 4)) + boolToInt(4 == max 4 (max 5 4)))
(max 4 5, boolToInt(4 == max 4 5) + boolToInt(5 == max 4 5) + boolToInt(5 == max 4 5))
(5, boolToInt(4 == 5) + boolToInt(5 == 5) + boolToInt(4 == 5))
(5, boolToInt(False) + boolToInt(True) + boolToInt(False))
(5, 0 + 1 + 0)
(5, 1)
