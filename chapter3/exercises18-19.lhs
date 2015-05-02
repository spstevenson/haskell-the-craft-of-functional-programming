> isDigit :: Char -> Bool
> isDigit ch = ('0' <= ch) && (ch <= '9')

> digitOffset :: Int
> digitOffset = fromEnum '0'

> charToNum :: Char -> Int
> charToNum ch
>  | isDigit ch = fromEnum ch - digitOffset
>  | otherwise = 0

3.18 Define a function

onThreeLines :: String -> String -> String -> String

which takes three strings and returns a single string which when printed shows
the three strings on separate lines.

> onThreeLines :: String -> String -> String -> String
> onThreeLines x y z = x ++ "\n" ++ y ++ "\n" ++ z

3.19 Define a function

romanDigit :: Char -> String

which converts a digit to its representation in Roman numerals, so at '7'
it will have the value "VII" and so on.

> isInOffsetRange :: Int -> Bool
> isInOffsetRange x = (-1 <= x) && ( x <= 3)

> romanDigit :: Char -> String
> romanDigit ch 
>  | isInOffsetRange ((charToNum ch) - 10) = "Around 9"
>  | isInOffsetRange ((charToNum ch) - 5) = "Around 5"
>  | otherwise = "Between O and 3"

> addCharactersToRomanNumerals :: String -> Int -> String