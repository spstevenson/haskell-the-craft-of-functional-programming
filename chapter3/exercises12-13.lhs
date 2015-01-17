3.12 Define a function to convert small letters to capitals which
returns unchanged characters which are not small letters.

> import Prelude
> import Data.Char hiding (isDigit)

> offset :: Int
> offset = ord 'A' - ord 'a'

> toUpper :: Char -> Char
> toUpper x
>  | (ord x) >= (ord 'a') 
>    && (ord x) <= (ord 'z') 
>				= (chr ((ord x) + offset))
>  | otherwise  = x

3.13 Define the function

charToNum :: Char -> Int

which converts a digit like '8' to its value, 8. The value of non-digits should be
taken to be 0.

> isDigit :: Char -> Bool
> isDigit ch = ('0' <= ch) && ('9' >= ch)

> charToNum :: Char -> Int
> charToNum ch
>  | isDigit ch = ord ch - ord '0'
>  | otherwise  = 0