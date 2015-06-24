> import Data.Char

5.18 Give a definition of the function

doubleAll :: [Integer] -> [Integer]

which doubles all the elements of a list of integers.

> doubleAll ::[Integer] -> [Integer]
> doubleAll input = [2*n | n <- input]

5.19 Give a definition of a function

capitalize :: String -> String

which converts all small letters in a String into
capitals, leaving the other characters unchanged.
How would you modify this function to give

capitalizeLetters :: String -> String

which behaves in the same way except that all
non-letters are removed from the list?

> capitalise :: Char -> Char
> capitalise ch
>  | isLower ch = ch
>  | otherwise = ch
