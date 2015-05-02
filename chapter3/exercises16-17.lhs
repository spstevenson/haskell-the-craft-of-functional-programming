import Prelude

3.16 Define a function to convert small letters to capitals which returns unchanged
characters which are not small letters.

> isSmallLetter :: Char -> Bool
> isSmallLetter ch = ('a' <= ch) && (ch <= 'z')

> offset :: Int
> offset = fromEnum 'A' - fromEnum 'a'

> toUpper :: Char -> Char
> toUpper ch 
>  | isSmallLetter ch = toEnum( fromEnum ch + offset)
>  | otherwise = ch

3.17 Define the function

charToNum :: Char -> Int

which converts a digit like '8' to its value, 8. The value of non-digits should
be taken to be 0.

> isDigit :: Char -> Bool
> isDigit ch = ('0' <= ch) && (ch <= '9')

> digitOffset :: Int
> digitOffset = fromEnum '0'

> charToNum :: Char -> Int
> charToNum ch
>  | isDigit ch = fromEnum ch - digitOffset
>  | otherwise = 0