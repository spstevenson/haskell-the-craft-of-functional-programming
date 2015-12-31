6.19 An alternative representation of Picture is the type

[[Bool]]

where True and False represent black and white points in a picture. How would
you have to modify the functions working over Picture to accomodate this change?
What are the advantages and disdvantages of the two representations?

We would have to modify each mention of '.' to False and each mention of '#' to true.
With this change we could probably get the functions working over the alternative type
if the function definitions were redefined for the alternative type. Because we are using
primitive boolean types some of our logic perhaps could be simplified to directly use the
pixel values in the boolean statement. We would have to reimplmement the printPicture function
as we cannot directly print boolean values, we would have to define characters to map to.

There are a few differences between using characters and boolean values for the pixel values.
Using booleans is more restrictive than characters. If we wanted to extend our representation
beyond a black-white pallette we would have no pixel values we could use with the boolean values.
On the other hand using boolean values for our pixels enforces valid pictures, whereas with
characters we could have pictures that use undefined characters (that in our case we assume to
be # and convert to this character). Using boolean values simplifies some of the logic with superimposing
and manipulating pixel values however it makes printing images more complex as we cannot directly print
boolean values but would have to define mappings to characters and construct a string for printing.

6.20 We have represented pictures as a list of rows: how would you redefine the functions working 
over pictures if they are represented as a list of columns.

Many of our funtions would be unchanged. The function superimposeChar would be unchanged, superimposeLine
would be unchanged although would be renamed to superimposeColumn. The function printPicture would involve
some of the most change and this is reimplemented in the next exercise.

The rotate and flip functions will be very similar, except that they must be renamed to reflect the fact that
the functions are rotating and flipping columns rather than lines. The implementations of flipH and flipV will
be swapped. Scaling will be a similar implementation. The function that corrects ragged pictures will be adjusting
column lengths rather than line lengths but will have the same implementation.

6.21 [Harder] How would you re-implement the function printPicture, defined in the
solution to Exercise 6.7, so that it works over this column based representation?

First we need to define our new picture

> import Prelude

> type Picture = [[Char]]

> horse :: Picture

> horse = ["............",
>          "......#.....",
>          "...###.#....",
>          "..#.....#...",
>          "..#......#..",
>          ".#........#.",
>          ".#..####...#",
>          "#....#..####", 
>          "#....#......",
>          ".#....#.....",
>          "..#####.....",
>          "............"] 

> printPicture :: Picture -> IO ()
> printPicture picture = putStr (concat [ (getRow picture i) ++ "\n" | i <- [0..(height picture)-1]])

> height :: Picture -> Int
> height pic = length (pic !! 0)

> getRow :: Picture -> Int -> [Char]
> getRow pic n = [column !! n | column <- pic]
