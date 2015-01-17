3.10 Give calculcations of

max (3-2) (3*8)
maxThree (4+5) (2*6) (100 `div` 7)

max (3-2) (3*8)
 ?? (3-2) >= (3*8)
 ?? -> 1 >= 24
 ?? -> False
-> 24

maxThree (4+5) (2*6) (100 `div` 7)
 ?? (4+5) >= (2*6) && (4+5) >= (100 `div` 7)
 ?? -> 9 >= 12 && 9 >= 14
 ?? -> False && False
 ?? 12 >= 14
 ?? -> False
-> 14

3.11 Give definitions of the functions

min :: Int -> Int -> Int
minThree :: Int -> Int -> Int -> Int

which calculate the minimum of two and three integers, respectively.

> import Prelude hiding (min)

> min :: Int -> Int -> Int
> min x y 
>  | x <= y    = x
>  | otherwise = y

> minThree :: Int -> Int -> Int -> Int
> minThree x y z
>  | (min x y) <= z = (min x y)
>  | otherwise      = z