> import Pictures hiding (superimpose, printPicture)

6.4 Define a function

superimposeChar :: Char -> Char -> Char

so that the superimposition of '.' with itself gives '.' while any other
combination of characters gives '#'.

> superimposeChar :: Char -> Char -> Char
> superimposeChar char1 char2
>  | char1 == '.' && char2 == '.' = '.'
>  | otherwise = '#'

6.5 Define a function

superimposeLine :: [Char] -> [Char] -> [Char]

which takes two lines - which you can assume are of the same length -
and superimposes their corresponding characters using the superimposeChar,
so that, for example

superimposeLine ".##." ".#.#" = ".###"

You may want to use zip in your solution.

> superimposeLine :: [Char] -> [Char] -> [Char]
> superimposeLine line1 line2 = [superimposeChar char1 char2 | (char1,char2) <- zip line1 line2]

6.6 In an similar way to superimposeLine, define the function

superimpose :: Picture -> Picture -> Picture

which superimposes two pictures, which you may assume have the same
dimensions.

> superimpose :: Picture -> Picture -> Picture
> superimpose pic1 pic2 = [superimposeLine line1 line2 | (line1,line2) <- zip pic1 pic2]

6.7 Using the function putStr :: String -> IO () and any other functions you
might need, define the function

printPicture :: Picture -> IO ()

so that the effect of printPicture [".##.",".#.#",".###","####"]
is that

: .##.
: .#.#
: .###
: ####

is printed at the terminal window. Hint: it is enought to transform this list of
strings to the single string

".##.\n.#.#\n.###\n####\n"

and to pass that to putStr.

> printPicture :: Picture -> IO ()
> printPicture picture = putStr (concat [line ++ "\n" | line <- picture])

6.8 [Harder] Define a function

rotate90 :: Picture -> Picture

which rotates a picture through 90 degrees clockwise. For instance, the
effect of rotate90 on the picture in the previous exercise would be to
give

: #...
: ####
: ##.#
: ###.

Hint: you need to make a line of the new picture by picking out the ith
elements in each of the lines of the original picture, reflected in a
horizontal mirror.

> rotate90 :: Picture -> Picture
> rotate90 pic = [rotateLine n pic | n <- [0.. (pictureWidth pic) - 1]]

> rotateLine :: Int -> Picture -> [Char]
> rotateLine col pic = reverse [ line !! col | line <- pic]

> pictureWidth :: Picture -> Int
> pictureWidth pic = length (pic !! 0)

6.9 Using rotate90 or otherwise, define a function which rotates a
picture through 90 degrees anticlockwise.

> rotate270 :: Picture -> Picture
> rotate270 pic = rotate90 (rotate90 (rotate90 pic))

6.10 [Harder] Define the function

scale :: Picture -> Int -> Picture

which scales the input picture by the integer provided
as the second argument. For instance, if exPic is the
picture

: #.#
: ..#

then the result of scale exPic 2 should be

: ##..##
: ##..##
: ....##
: ....##

In the case of a zero or negative scale factor, you should return
an empty picture.

> repeatTimes :: a -> Int -> [a]
> repeatTimes item n
>  | n > 1 = (repeatTimes item (n-1)) ++ [item]
>  | n == 1 = [item]
>  | otherwise = []

> stretchLineHorizontally :: [Char] -> Int -> [Char]
> stretchLineHorizontally line scale = concat [repeatTimes char scale | char <- line]

> stretchPictureHorizontally :: Picture -> Int -> Picture
> stretchPictureHorizontally pic scale = [stretchLineHorizontally line scale | line <- pic]
