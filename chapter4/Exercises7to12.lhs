4.7 Using the addition function over the natural numbers, give a recursive defintion
of multiplication of natural numbers.

> multiplication :: Int -> Int -> Int
> multiplication x y
>  | x == 1 = y
>  | x > 1 = (multiplication (x-1) y) + y
>  | otherwise = error "Not defined for zero or negative numbers"

4.8 The integer square root of a positive number n is the largest integer whose square
is less than or equal to n. For instance, the integer square roots of 15 and 16 are
3 and 4, respectively. Give a primitive recursive definition of this function.
