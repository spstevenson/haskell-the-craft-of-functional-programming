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

6.22 It would be possible to represent a Picture as a single list of characters,
with '\n' terminating each line of the picture, as in

".##.\n.#.#\n.###\n####\n"

How would you redefine the picture manipulating functions over this representation? Which functions
become easier to define? Which more difficult?

We would have to use list indexes to reference and manipulate the elements in the list of characters.
If we had to deal with ragged pictures much of our logic would become much more involved. However,
if we only had to deal with non ragged images we could take advantage of the fact that each of the
lines are of equal length.

The superimposeLine function would have exactly the same implementation but the superimpose function
would have to be redefined to split the list by the "\n" characters and form a new picture from the
results. The printPicture function would be easier to implement as we can just print the list of characters.

The rotate90 function would be a littly trickier to implement. Assuming we are dealing with a non-ragged
picture, we would need to find the number of rows and the row length. Then we pick out the ith element of
each line (which we can get by taking multiples of the line length until we reach the end of the character
list). The scale function is a little trickier to implement, we would begin by repeating every non-newline
element. Then we would have to duplicate each line, so we would have to somehow insert a copy of each line
between it and the next line.
