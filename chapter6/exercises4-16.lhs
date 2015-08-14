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
