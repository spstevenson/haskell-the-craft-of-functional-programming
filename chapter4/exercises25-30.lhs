> import Prelude
> import PicturesSVG

> blackSquares :: Integer -> Picture

> blackSquares n
>  | n<=1 = black
>  | otherwise = black `beside` blackSquares (n-1)

> whiteSquares :: Integer -> Picture

> whiteSquares n
>  | n<=1 = white
>  | otherwise = white `beside` whiteSquares(n-1)

> blackWhite :: Integer -> Picture

> blackWhite n
>  | n<=1 = black
>  | otherwise = black `beside` whiteBlack (n-1)

> blackChess :: Integer -> Integer -> Picture

> blackChess n m
>  | n<=1 = blackWhite m
>  | otherwise = blackWhite m `above` whiteChess (n-1) m 

Exercises

4.25 Complete the definitions of whiteBlack and whiteChess

> whiteBlack :: Integer -> Picture

> whiteBlack n
>  | n<=1 = white
>  | otherwise = white `beside` blackWhite (n-1)

> whiteChess :: Integer -> Integer -> Picture

> whiteChess n m
>  | n<=1 = whiteBlack m
>  | otherwise = whiteBlack m `above` blackChess (n-1) m

4.26 How would you define a function to give a column of pictures,

column :: Picture -> Integer -> Picture

so that the result of column horse 3 is as shown below.

> column :: Picture -> Integer -> Picture

> column pic n
>  | n <= 1 = pic
>  | otherwise = pic `above` column pic (n-1)

4.27 Give a Haskell function which takes an integer n and returns an n by n
white square with a diagonal black line from top left to bottom right.

> row :: Integer -> Integer -> Picture

> row length blackPos 
>  | length == 1 = black
>  | blackPos == 0 = black `beside` whiteSquares (length - blackPos - 1) 
>  | blackPos == length - 1 = whiteSquares (length - 1) `beside` black 
>  | otherwise = whiteSquares blackPos `beside` black `beside` whiteSquares (length - blackPos - 1) 

> diagonal :: Integer -> Picture
> diagonal n = buildDiagonal n 0
>  where
>   buildDiagonal size blackPos
>    | blackPos == size - 1 = row size blackPos
>    | otherwise = row size blackPos `above` buildDiagonal size (blackPos+1) 

4.28 Give a Haskell function which takes an integer n and returns an n by n
white square with a diagonal black line from top right to bottom left.

> rightLeftDiagonal :: Integer -> Picture
> rightLeftDiagonal n = flipH (diagonal n)

4.29 Give a Haskell function which takes an integer n and returns an n by n
white square with both diagonals coloured black.

> columnWithCentralBlackSquare :: Integer -> Picture

> columnWithCentralBlackSquare n
>  | n `rem` 2 == 0 = error "Must be odd number"
>  | otherwise = verticalWhiteSquares whiteHeight `above` black `above` verticalWhiteSquares whiteHeight
>   where
>   whiteHeight = (n-1) `div` 2

> verticalWhiteSquares :: Integer -> Picture

> verticalWhiteSquares n
>  | n<=1 = white
>  | otherwise = white `above` verticalWhiteSquares (n-1)

> diagonals :: Integer -> Picture

> diagonals n
>  | n <= 1 = black
>  | n `rem` 2 == 0 = halfEvenDiagonal `above` flipH halfEvenDiagonal
>  | otherwise = halfOddDiagonal `beside` columnWithCentralBlackSquare n `beside` flipV halfOddDiagonal
>   where
>   diagonalSize = n `div` 2
>   halfEvenDiagonal = diagonal diagonalSize `beside` flipH (diagonal diagonalSize)
>   halfOddDiagonal = diagonal diagonalSize `above` whiteSquares diagonalSize `above` flipV (diagonal diagonalSize)
