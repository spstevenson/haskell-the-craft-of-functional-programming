> import Prelude hiding (min)
> import Test.QuickCheck

> maxThree :: Int -> Int -> Int -> Int
> maxThree x y z
>  | x >= y && x >= z = x
>  | y >= z = y
>  | otherwise = z

3.13 Give calculations of 

max (3-2) (3*8)
maxThree (4+5) (2*6) (100 `div` 7)

max (3-2) (3*8)
?? (3-2) >= (3*8)
?? 1 >= 24
?? False
1

maxThree (4+5) (2*6) (100 `div` 7)
?? (4+5) >= (2*6) && (4+5) >= (100 `div` 7)
?? 9 >= 12 && 9 >= 2
?? False && True
?? False
?? 12 >= 2
?? True
12

3.14 Give definitions of the functions

min :: Int -> Int -> Int
minThree :: Int -> Int -> Int -> Int

> min :: Int -> Int -> Int
> min x y
>  | x <= y = x
>  | otherwise = y

> minThree :: Int -> Int -> Int -> Int
> minThree x y z = min x (min y z)

3.15 Define QuickCheck properties to test the functions maxThree, min and minThree.

> prop_min1 :: Int -> Int -> Bool
> prop_min1 x y = min x y == x || min x y == y

> prop_min2 :: Int -> Int -> Bool
> prop_min2 x y = x >= min x y && y >= min x y

> prop_minThree1 :: Int -> Int -> Int -> Bool
> prop_minThree1 x y z = x >= minThree x y z || y >= minThree x y z || z >= minThree x y z

> prop_minThree2 :: Int -> Int -> Int -> Bool
> prop_minThree2 x y z = x >= minThree x y z && y >= minThree x y z && z >= minThree x y z

> prop_maxThree1 :: Int -> Int -> Int -> Bool
> prop_maxThree1 x y z = x <= maxThree x y z || y <= maxThree x y z || z <= maxThree x y z

> prop_maxThree2 :: Int -> Int -> Int -> Bool

> prop_maxThree2 x y z = x <= maxThree x y z && y <= maxThree x y z && z <= maxThree x y z