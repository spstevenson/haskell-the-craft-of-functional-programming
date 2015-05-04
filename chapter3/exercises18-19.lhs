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
>  | isInOffsetRange ((charToNum ch) - 10) = attachSuffixPostfix "X" ((charToNum ch) - 10)
>  | isInOffsetRange ((charToNum ch) - 5) = attachSuffixPostfix "V" ((charToNum ch) - 5)
>  | otherwise = attachSuffixPostfix "" (charToNum ch)

> attachSuffixPostfix :: String -> Int -> String
> attachSuffixPostfix ch offset
>  | offset >= 0 = ch ++ getDigitSuffixPostfix offset
>  | offset < 0 = getDigitSuffixPostfix offset ++ ch

> getDigitSuffixPostfix :: Int -> String
> getDigitSuffixPostfix x
>  | abs x > 0 = "I" ++ getDigitSuffixPostfix ((abs x) - 1)
>  | otherwise = ""